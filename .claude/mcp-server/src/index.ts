#!/usr/bin/env node

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
  ListResourcesRequestSchema,
  ReadResourceRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";
import * as fs from "fs";
import * as path from "path";
import { glob } from "glob";

const MONOREPO_ROOT = process.env.BESPOKE_ROOT || "/Users/stuart/Packages/bespoke";

// Package categories
const CATEGORIES = ["api", "blade", "cms", "core", "crm", "custom", "default", "ecommerce", "template"];

// Utility package list (don't need full CRUD)
const UTILITY_PACKAGES = [
  "activity", "backup", "captcha", "chart", "core", "dashboard",
  "editor", "module", "notification", "security", "two-factor"
];

interface PackageInfo {
  name: string;
  category: string;
  path: string;
  namespace: string;
  type: "crud" | "utility" | "blade" | "api" | "template" | "meta";
  hasApi: boolean;
  hasExports: boolean;
  hasImports: boolean;
  contractsCount: number;
  livewireComponents: string[];
  models: string[];
  traits: string[];
  dependencies: string[];
}

// Cache for package info
let packageCache: Map<string, PackageInfo> = new Map();

async function getPackageInfo(packagePath: string): Promise<PackageInfo | null> {
  const composerPath = path.join(packagePath, "composer.json");

  if (!fs.existsSync(composerPath)) {
    return null;
  }

  const composer = JSON.parse(fs.readFileSync(composerPath, "utf-8"));
  const packageName = composer.name?.replace("bespoke-uk/", "") || path.basename(packagePath);
  const category = path.basename(path.dirname(packagePath));

  // Determine package type
  let type: PackageInfo["type"] = "crud";
  if (category === "blade") type = "blade";
  else if (category === "api") type = "api";
  else if (category === "template") type = "template";
  else if (UTILITY_PACKAGES.includes(packageName)) type = "utility";
  else if (!composer.autoload?.["psr-4"]) type = "meta";

  // Check for API
  const hasApi = fs.existsSync(path.join(packagePath, "routes", "api.php"));

  // Check for exports/imports
  const hasExports = fs.existsSync(path.join(packagePath, "src", "Exports"));
  const hasImports = fs.existsSync(path.join(packagePath, "src", "Imports"));

  // Count contracts
  const contractsPath = path.join(packagePath, "src", "Contracts");
  let contractsCount = 0;
  if (fs.existsSync(contractsPath)) {
    const contracts = await glob("**/*.php", { cwd: contractsPath });
    contractsCount = contracts.length;
  }

  // Find Livewire components from config
  const livewireComponents: string[] = [];
  const configPath = path.join(packagePath, "config", `${packageName}.php`);
  if (fs.existsSync(configPath)) {
    const config = fs.readFileSync(configPath, "utf-8");
    const livewireMatch = config.match(/'livewire'\s*=>\s*\[([\s\S]*?)\]/);
    if (livewireMatch) {
      const componentMatches = livewireMatch[1].matchAll(/'([^']+)'\s*=>/g);
      for (const match of componentMatches) {
        livewireComponents.push(match[1]);
      }
    }
  }

  // Find models
  const models: string[] = [];
  const modelsPath = path.join(packagePath, "src", "Models");
  if (fs.existsSync(modelsPath)) {
    const modelFiles = await glob("*.php", { cwd: modelsPath });
    models.push(...modelFiles.map(f => f.replace(".php", "")));
  }

  // Find traits
  const traits: string[] = [];
  const traitsPath = path.join(packagePath, "src", "Traits");
  if (fs.existsSync(traitsPath)) {
    const traitFiles = await glob("*.php", { cwd: traitsPath });
    traits.push(...traitFiles.map(f => f.replace(".php", "")));
  }

  // Get dependencies
  const dependencies = Object.keys(composer.require || {})
    .filter(dep => dep.startsWith("bespoke-uk/"));

  // Get namespace
  const autoload = composer.autoload?.["psr-4"] || {};
  const namespace = Object.keys(autoload)[0]?.replace(/\\$/, "") || `Bespoke\\${pascalCase(packageName)}`;

  return {
    name: packageName,
    category,
    path: packagePath,
    namespace,
    type,
    hasApi,
    hasExports,
    hasImports,
    contractsCount,
    livewireComponents,
    models,
    traits,
    dependencies,
  };
}

function pascalCase(str: string): string {
  return str
    .split(/[-_]/)
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join("");
}

async function loadAllPackages(): Promise<void> {
  packageCache.clear();

  for (const category of CATEGORIES) {
    const categoryPath = path.join(MONOREPO_ROOT, category);
    if (!fs.existsSync(categoryPath)) continue;

    const packages = fs.readdirSync(categoryPath, { withFileTypes: true })
      .filter(d => d.isDirectory() && !d.name.startsWith("_") && !d.name.startsWith("."));

    for (const pkg of packages) {
      const pkgPath = path.join(categoryPath, pkg.name);
      const info = await getPackageInfo(pkgPath);
      if (info) {
        packageCache.set(info.name, info);
      }
    }
  }
}

async function findTraitUsages(traitName: string): Promise<string[]> {
  const results: string[] = [];

  for (const [name, info] of packageCache) {
    // Check if package provides this trait
    if (info.traits.some(t => t.toLowerCase().includes(traitName.toLowerCase()))) {
      continue; // Skip the package that defines the trait
    }

    // Search for trait usage in models
    const modelsPath = path.join(info.path, "src", "Models");
    if (fs.existsSync(modelsPath)) {
      const modelFiles = await glob("*.php", { cwd: modelsPath });
      for (const file of modelFiles) {
        const content = fs.readFileSync(path.join(modelsPath, file), "utf-8");
        if (content.includes(`use ${traitName}`) || content.includes(`use Has${traitName}`)) {
          results.push(`${info.category}/${info.name}/src/Models/${file}`);
        }
      }
    }
  }

  return results;
}

async function findModelRelationships(modelName: string): Promise<object> {
  const relationships: {
    belongsTo: string[];
    hasMany: string[];
    morphTo: string[];
    morphMany: string[];
  } = {
    belongsTo: [],
    hasMany: [],
    morphTo: [],
    morphMany: [],
  };

  // Find the model file
  for (const [name, info] of packageCache) {
    const modelPath = path.join(info.path, "src", "Models", `${modelName}.php`);
    if (fs.existsSync(modelPath)) {
      const content = fs.readFileSync(modelPath, "utf-8");

      // Find relationship methods
      const belongsToMatches = content.matchAll(/belongsTo\(([^)]+)\)/g);
      for (const match of belongsToMatches) {
        relationships.belongsTo.push(match[1].trim());
      }

      const hasManyMatches = content.matchAll(/hasMany\(([^)]+)\)/g);
      for (const match of hasManyMatches) {
        relationships.hasMany.push(match[1].trim());
      }

      const morphToMatches = content.matchAll(/morphTo\(/g);
      if (morphToMatches) {
        relationships.morphTo.push("(polymorphic)");
      }

      const morphManyMatches = content.matchAll(/morphMany\(([^)]+)\)/g);
      for (const match of morphManyMatches) {
        relationships.morphMany.push(match[1].trim());
      }

      break;
    }
  }

  return relationships;
}

// Create MCP server
const server = new Server(
  {
    name: "bespoke-mcp-server",
    version: "1.0.0",
  },
  {
    capabilities: {
      tools: {},
      resources: {},
    },
  }
);

// Tool handlers
server.setRequestHandler(ListToolsRequestSchema, async () => {
  return {
    tools: [
      {
        name: "get_package_info",
        description: "Get detailed information about a specific Bespoke package",
        inputSchema: {
          type: "object",
          properties: {
            package_name: {
              type: "string",
              description: "Package name (e.g., 'contact', 'customer', 'blade-button')",
            },
          },
          required: ["package_name"],
        },
      },
      {
        name: "list_packages",
        description: "List all packages, optionally filtered by category or type",
        inputSchema: {
          type: "object",
          properties: {
            category: {
              type: "string",
              description: "Filter by category (api, blade, cms, core, crm, custom, default, ecommerce, template)",
            },
            type: {
              type: "string",
              description: "Filter by type (crud, utility, blade, api, template, meta)",
            },
          },
        },
      },
      {
        name: "find_trait_usages",
        description: "Find all packages/models that use a specific trait",
        inputSchema: {
          type: "object",
          properties: {
            trait_name: {
              type: "string",
              description: "Trait name (e.g., 'HasContacts', 'HasDocuments')",
            },
          },
          required: ["trait_name"],
        },
      },
      {
        name: "get_model_relationships",
        description: "Get all relationships for a specific model",
        inputSchema: {
          type: "object",
          properties: {
            model_name: {
              type: "string",
              description: "Model name (e.g., 'Customer', 'Contact')",
            },
          },
          required: ["model_name"],
        },
      },
      {
        name: "audit_package",
        description: "Quick audit of a package's compliance with standards",
        inputSchema: {
          type: "object",
          properties: {
            package_name: {
              type: "string",
              description: "Package name to audit",
            },
          },
          required: ["package_name"],
        },
      },
      {
        name: "search_packages",
        description: "Search packages by various criteria",
        inputSchema: {
          type: "object",
          properties: {
            query: {
              type: "string",
              description: "Search query (searches names, traits, models, components)",
            },
          },
          required: ["query"],
        },
      },
      {
        name: "get_test_coverage",
        description: "Check test coverage and test file existence for a package",
        inputSchema: {
          type: "object",
          properties: {
            package_name: {
              type: "string",
              description: "Package name to check test coverage for",
            },
          },
          required: ["package_name"],
        },
      },
      {
        name: "compare_packages",
        description: "Compare two packages for consistency and identify differences",
        inputSchema: {
          type: "object",
          properties: {
            package1: {
              type: "string",
              description: "First package name to compare",
            },
            package2: {
              type: "string",
              description: "Second package name to compare",
            },
          },
          required: ["package1", "package2"],
        },
      },
      {
        name: "get_package_health",
        description: "Get comprehensive health check combining audit, tests, and dependencies",
        inputSchema: {
          type: "object",
          properties: {
            package_name: {
              type: "string",
              description: "Package name for health check",
            },
          },
          required: ["package_name"],
        },
      },
    ],
  };
});

server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;

  // Ensure cache is loaded
  if (packageCache.size === 0) {
    await loadAllPackages();
  }

  switch (name) {
    case "get_package_info": {
      const packageName = args?.package_name as string;
      const info = packageCache.get(packageName);

      if (!info) {
        return {
          content: [{ type: "text", text: `Package '${packageName}' not found` }],
        };
      }

      return {
        content: [{ type: "text", text: JSON.stringify(info, null, 2) }],
      };
    }

    case "list_packages": {
      const category = args?.category as string | undefined;
      const type = args?.type as string | undefined;

      let packages = Array.from(packageCache.values());

      if (category) {
        packages = packages.filter(p => p.category === category);
      }
      if (type) {
        packages = packages.filter(p => p.type === type);
      }

      const summary = packages.map(p => ({
        name: p.name,
        category: p.category,
        type: p.type,
        hasApi: p.hasApi,
        contractsCount: p.contractsCount,
      }));

      return {
        content: [{ type: "text", text: JSON.stringify(summary, null, 2) }],
      };
    }

    case "find_trait_usages": {
      const traitName = args?.trait_name as string;
      const usages = await findTraitUsages(traitName);

      return {
        content: [{
          type: "text",
          text: usages.length > 0
            ? `Files using '${traitName}':\n${usages.join("\n")}`
            : `No usages of '${traitName}' found`,
        }],
      };
    }

    case "get_model_relationships": {
      const modelName = args?.model_name as string;
      const relationships = await findModelRelationships(modelName);

      return {
        content: [{ type: "text", text: JSON.stringify(relationships, null, 2) }],
      };
    }

    case "audit_package": {
      const packageName = args?.package_name as string;
      const info = packageCache.get(packageName);

      if (!info) {
        return {
          content: [{ type: "text", text: `Package '${packageName}' not found` }],
        };
      }

      // Quick audit
      const issues: string[] = [];
      const passed: string[] = [];

      if (info.type === "crud") {
        // Check CRUD requirements
        if (!info.hasApi) issues.push("Missing API routes");
        else passed.push("Has API routes");

        if (!info.hasExports) issues.push("Missing exports");
        else passed.push("Has exports");

        if (!info.hasImports) issues.push("Missing imports");
        else passed.push("Has imports");

        if (info.contractsCount < 8) issues.push(`Only ${info.contractsCount} contracts (need 8-13+)`);
        else passed.push(`Has ${info.contractsCount} contracts`);
      }

      const score = info.type === "crud"
        ? Math.round((passed.length / (passed.length + issues.length)) * 100)
        : 100;

      return {
        content: [{
          type: "text",
          text: `Audit: ${packageName}\nType: ${info.type}\nScore: ${score}%\n\nPassed:\n${passed.map(p => `✓ ${p}`).join("\n")}\n\nIssues:\n${issues.map(i => `✗ ${i}`).join("\n") || "None"}`,
        }],
      };
    }

    case "search_packages": {
      const query = (args?.query as string).toLowerCase();
      const results: string[] = [];

      for (const [name, info] of packageCache) {
        if (name.includes(query)) {
          results.push(`Package: ${info.category}/${name}`);
        }
        for (const model of info.models) {
          if (model.toLowerCase().includes(query)) {
            results.push(`Model: ${info.category}/${name} -> ${model}`);
          }
        }
        for (const trait of info.traits) {
          if (trait.toLowerCase().includes(query)) {
            results.push(`Trait: ${info.category}/${name} -> ${trait}`);
          }
        }
        for (const component of info.livewireComponents) {
          if (component.toLowerCase().includes(query)) {
            results.push(`Livewire: ${info.category}/${name} -> ${component}`);
          }
        }
      }

      return {
        content: [{
          type: "text",
          text: results.length > 0
            ? `Search results for '${query}':\n${results.join("\n")}`
            : `No results for '${query}'`,
        }],
      };
    }

    case "get_test_coverage": {
      const packageName = args?.package_name as string;
      const info = packageCache.get(packageName);

      if (!info) {
        return {
          content: [{ type: "text", text: `Package '${packageName}' not found` }],
        };
      }

      const testsPath = path.join(info.path, "tests");
      const testFiles: string[] = [];
      const coverage = {
        hasTestCase: false,
        hasExampleTest: false,
        unitTests: 0,
        featureTests: 0,
        livewireTests: 0,
        totalTests: 0,
      };

      if (fs.existsSync(testsPath)) {
        coverage.hasTestCase = fs.existsSync(path.join(testsPath, "TestCase.php"));
        coverage.hasExampleTest = fs.existsSync(path.join(testsPath, "ExampleTest.php"));

        const allTests = await glob("**/*Test.php", { cwd: testsPath });
        testFiles.push(...allTests);
        coverage.totalTests = allTests.length;

        for (const test of allTests) {
          if (test.startsWith("Unit/")) coverage.unitTests++;
          else if (test.startsWith("Feature/")) coverage.featureTests++;
          else if (test.startsWith("Livewire/")) coverage.livewireTests++;
        }
      }

      const modelsCovered = info.models.filter(m =>
        testFiles.some(t => t.includes(m))
      );

      return {
        content: [{
          type: "text",
          text: `Test Coverage: ${packageName}

Base Infrastructure:
${coverage.hasTestCase ? "✓" : "✗"} TestCase.php
${coverage.hasExampleTest ? "✓" : "✗"} ExampleTest.php

Test Counts:
- Total: ${coverage.totalTests}
- Unit: ${coverage.unitTests}
- Feature: ${coverage.featureTests}
- Livewire: ${coverage.livewireTests}

Model Coverage: ${modelsCovered.length}/${info.models.length}
Models: ${info.models.join(", ")}
Covered: ${modelsCovered.join(", ") || "None"}

Test Files:
${testFiles.map(f => `- ${f}`).join("\n") || "No tests found"}`,
        }],
      };
    }

    case "compare_packages": {
      const pkg1Name = args?.package1 as string;
      const pkg2Name = args?.package2 as string;

      const pkg1 = packageCache.get(pkg1Name);
      const pkg2 = packageCache.get(pkg2Name);

      if (!pkg1) {
        return { content: [{ type: "text", text: `Package '${pkg1Name}' not found` }] };
      }
      if (!pkg2) {
        return { content: [{ type: "text", text: `Package '${pkg2Name}' not found` }] };
      }

      const differences: string[] = [];
      const similarities: string[] = [];

      // Compare types
      if (pkg1.type === pkg2.type) {
        similarities.push(`Same type: ${pkg1.type}`);
      } else {
        differences.push(`Type: ${pkg1Name}=${pkg1.type}, ${pkg2Name}=${pkg2.type}`);
      }

      // Compare API
      if (pkg1.hasApi === pkg2.hasApi) {
        similarities.push(`Both ${pkg1.hasApi ? "have" : "lack"} API`);
      } else {
        differences.push(`API: ${pkg1Name}=${pkg1.hasApi}, ${pkg2Name}=${pkg2.hasApi}`);
      }

      // Compare exports
      if (pkg1.hasExports === pkg2.hasExports) {
        similarities.push(`Both ${pkg1.hasExports ? "have" : "lack"} exports`);
      } else {
        differences.push(`Exports: ${pkg1Name}=${pkg1.hasExports}, ${pkg2Name}=${pkg2.hasExports}`);
      }

      // Compare contracts count
      const contractsDiff = Math.abs(pkg1.contractsCount - pkg2.contractsCount);
      if (contractsDiff <= 2) {
        similarities.push(`Similar contracts count: ${pkg1.contractsCount} vs ${pkg2.contractsCount}`);
      } else {
        differences.push(`Contracts: ${pkg1Name}=${pkg1.contractsCount}, ${pkg2Name}=${pkg2.contractsCount}`);
      }

      // Compare dependencies
      const sharedDeps = pkg1.dependencies.filter(d => pkg2.dependencies.includes(d));
      const pkg1OnlyDeps = pkg1.dependencies.filter(d => !pkg2.dependencies.includes(d));
      const pkg2OnlyDeps = pkg2.dependencies.filter(d => !pkg1.dependencies.includes(d));

      return {
        content: [{
          type: "text",
          text: `Package Comparison: ${pkg1Name} vs ${pkg2Name}

Similarities:
${similarities.map(s => `✓ ${s}`).join("\n")}

Differences:
${differences.map(d => `≠ ${d}`).join("\n") || "None"}

Dependencies:
- Shared: ${sharedDeps.join(", ") || "None"}
- ${pkg1Name} only: ${pkg1OnlyDeps.join(", ") || "None"}
- ${pkg2Name} only: ${pkg2OnlyDeps.join(", ") || "None"}

Features:
| Feature | ${pkg1Name} | ${pkg2Name} |
|---------|-------------|-------------|
| Models | ${pkg1.models.length} | ${pkg2.models.length} |
| Traits | ${pkg1.traits.length} | ${pkg2.traits.length} |
| Livewire | ${pkg1.livewireComponents.length} | ${pkg2.livewireComponents.length} |
| Contracts | ${pkg1.contractsCount} | ${pkg2.contractsCount} |`,
        }],
      };
    }

    case "get_package_health": {
      const packageName = args?.package_name as string;
      const info = packageCache.get(packageName);

      if (!info) {
        return {
          content: [{ type: "text", text: `Package '${packageName}' not found` }],
        };
      }

      // Compliance checks
      const compliance: { passed: string[]; failed: string[] } = { passed: [], failed: [] };

      // Basic structure
      if (fs.existsSync(path.join(info.path, "src", "Contracts"))) {
        compliance.passed.push("Has Contracts directory");
      } else if (fs.existsSync(path.join(info.path, "src", "Interfaces"))) {
        compliance.failed.push("Uses Interfaces/ (should be Contracts/)");
      } else {
        compliance.failed.push("Missing Contracts directory");
      }

      // Tests
      const hasTests = fs.existsSync(path.join(info.path, "tests", "TestCase.php"));
      if (hasTests) {
        compliance.passed.push("Has test infrastructure");
      } else {
        compliance.failed.push("Missing test infrastructure");
      }

      // Config
      const configPath = path.join(info.path, "config", `${info.name}.php`);
      if (fs.existsSync(configPath)) {
        compliance.passed.push("Has config file");
      } else {
        compliance.failed.push("Missing config file");
      }

      // CLAUDE.md
      if (fs.existsSync(path.join(info.path, "CLAUDE.md"))) {
        compliance.passed.push("Has CLAUDE.md documentation");
      } else {
        compliance.failed.push("Missing CLAUDE.md documentation");
      }

      // CRUD-specific checks
      if (info.type === "crud") {
        if (info.hasApi) compliance.passed.push("Has API implementation");
        else compliance.failed.push("Missing API implementation");

        if (info.hasExports) compliance.passed.push("Has exports");
        else compliance.failed.push("Missing exports");

        if (info.hasImports) compliance.passed.push("Has imports");
        else compliance.failed.push("Missing imports");

        if (info.contractsCount >= 8) {
          compliance.passed.push(`Has ${info.contractsCount} contracts (8+ required)`);
        } else {
          compliance.failed.push(`Only ${info.contractsCount} contracts (need 8+)`);
        }
      }

      // Dependency health
      const missingDeps: string[] = [];
      if (info.type === "crud" && !info.dependencies.includes("bespoke-uk/module")) {
        missingDeps.push("bespoke-uk/module (recommended for CRUD packages)");
      }

      const healthScore = Math.round(
        (compliance.passed.length / (compliance.passed.length + compliance.failed.length)) * 100
      );

      let healthStatus = "Critical";
      if (healthScore >= 90) healthStatus = "Excellent";
      else if (healthScore >= 75) healthStatus = "Good";
      else if (healthScore >= 50) healthStatus = "Fair";
      else if (healthScore >= 25) healthStatus = "Poor";

      return {
        content: [{
          type: "text",
          text: `Package Health: ${packageName}

Overall Health: ${healthStatus} (${healthScore}%)
Type: ${info.type}
Category: ${info.category}

Passed Checks:
${compliance.passed.map(p => `✓ ${p}`).join("\n")}

Failed Checks:
${compliance.failed.map(f => `✗ ${f}`).join("\n") || "None"}

Dependencies (${info.dependencies.length}):
${info.dependencies.map(d => `- ${d}`).join("\n") || "None"}

${missingDeps.length > 0 ? `Suggested Dependencies:\n${missingDeps.map(d => `⚠ ${d}`).join("\n")}` : ""}

Quick Stats:
- Models: ${info.models.length} (${info.models.join(", ") || "None"})
- Traits: ${info.traits.length} (${info.traits.join(", ") || "None"})
- Livewire: ${info.livewireComponents.length}
- Contracts: ${info.contractsCount}`,
        }],
      };
    }

    default:
      throw new Error(`Unknown tool: ${name}`);
  }
});

// Resource handlers
server.setRequestHandler(ListResourcesRequestSchema, async () => {
  // Ensure cache is loaded
  if (packageCache.size === 0) {
    await loadAllPackages();
  }

  const resources = Array.from(packageCache.values()).map(info => ({
    uri: `bespoke://package/${info.category}/${info.name}`,
    name: `${info.category}/${info.name}`,
    description: `${info.type} package with ${info.models.length} models`,
    mimeType: "application/json",
  }));

  return { resources };
});

server.setRequestHandler(ReadResourceRequestSchema, async (request) => {
  const uri = request.params.uri;
  const match = uri.match(/^bespoke:\/\/package\/([^/]+)\/(.+)$/);

  if (!match) {
    throw new Error(`Invalid resource URI: ${uri}`);
  }

  const [, category, packageName] = match;
  const info = packageCache.get(packageName);

  if (!info) {
    throw new Error(`Package not found: ${packageName}`);
  }

  return {
    contents: [
      {
        uri,
        mimeType: "application/json",
        text: JSON.stringify(info, null, 2),
      },
    ],
  };
});

// Main
async function main() {
  console.error("Starting Bespoke MCP Server...");
  await loadAllPackages();
  console.error(`Loaded ${packageCache.size} packages`);

  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("Bespoke MCP Server running");
}

main().catch(console.error);
