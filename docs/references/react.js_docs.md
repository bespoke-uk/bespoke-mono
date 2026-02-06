### Full example: Define and nest React components (JavaScript/JSX)

Source: https://react.dev/learn

This comprehensive example combines the definition of a basic `MyButton` component and its usage within the main `MyApp` component. It illustrates a typical React application structure where components are defined and then composed together, with `export default` marking the main component of the file.

```javascript
function MyButton() {
  return (
    <button>
      I'm a button
    </button>
  );
}

export default function MyApp() {
  return (
    <div>
      <h1>Welcome to my app</h1>
      <MyButton />
    </div>
  );
}
```

--------------------------------

### Defining a Basic React Functional Component

Source: https://react.dev/blog/2025/02/14/sunsetting-create-react-app

This example demonstrates a simple React functional component named App that renders a basic heading. It showcases how to immediately start coding in React with JSX, default linting rules, and a bundler for both development and production, as typically provided by initial project setups like Create React App.

```javascript
export default function App() {  

  return (  

    <div>  

      <h1>Welcome to the Admin Tool!</h1>  

    </div>  

  )  

}
```

--------------------------------

### Create React Router v7 Framework Project

Source: https://react.dev/learn/creating-a-react-app

Set up a new React Router framework project paired with Vite using the create-react-router CLI. React Router is the most popular routing library for React and can be deployed across various JavaScript runtimes.

```bash
npx create-react-router@latest
```

--------------------------------

### Display dynamic data and apply inline styles in a React component (JavaScript/JSX)

Source: https://react.dev/learn

This comprehensive example shows how to define a component that displays user data, uses dynamic image sources, and applies inline styles based on JavaScript variables. It also demonstrates string concatenation within JSX attributes and the use of an object for inline styles.

```javascript
const user = {
  name: 'Hedy Lamarr',
  imageUrl: 'https://i.imgur.com/yXOvdOSs.jpg',
  imageSize: 90,
};

export default function Profile() {
  return (
    <>
      <h1>{user.name}</h1>
      <img
        className="avatar"
        src={user.imageUrl}
        alt={'Photo of ' + user.name}
        style={{
          width: user.imageSize,
          height: user.imageSize
        }}
      />
    </>
  );
}
```

--------------------------------

### Basic createRoot and render setup

Source: https://react.dev/reference/react-dom/client/createRoot

Minimal setup for initializing React with createRoot and rendering the main App component. Must call render() after createRoot to display content in the DOM.

```javascript
import { createRoot } from 'react-dom/client';
import App from './App.js';

const root = createRoot(document.getElementById('root'));
root.render(<App />);
```

--------------------------------

### Install and Configure React Compiler in Vite using vite-plugin-babel

Source: https://react.dev/learn/react-compiler/installation

Installs `vite-plugin-babel` as a development dependency and then configures it in `vite.config.js` to include `babel-plugin-react-compiler`. This approach offers more granular control over Babel settings within a Vite project.

```bash
npm install -D vite-plugin-babel
```

```javascript
// vite.config.js
import babel from 'vite-plugin-babel';
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [
    react(),
    babel({
      babelConfig: {
        plugins: ['babel-plugin-react-compiler'],
      },
    }),
  ],
});
```

--------------------------------

### Install React Compiler Babel Plugin using npm, Yarn, or pnpm

Source: https://react.dev/learn/react-compiler/installation

Installs the `babel-plugin-react-compiler` as a development dependency. This plugin is essential for integrating the React Compiler into your project's build process, supporting various package managers.

```bash
npm install -D babel-plugin-react-compiler@latest
```

```bash
yarn add -D babel-plugin-react-compiler@latest
```

```bash
pnpm install -D babel-plugin-react-compiler@latest
```

--------------------------------

### useEffect Symmetric Setup and Cleanup Pattern

Source: https://react.dev/reference/react/useEffect

Shows the correct pattern for useEffect with symmetrical setup and cleanup logic. The cleanup function should stop or undo whatever the setup logic did. In this example, a connection is established on setup and properly disconnected during cleanup.

```javascript
useEffect(() => {
  const connection = createConnection(serverUrl, roomId);
  connection.connect();
  return () => {
    connection.disconnect();
  };
}, [serverUrl, roomId]);
```

--------------------------------

### Install and Configure React Compiler for React Router in Vite

Source: https://react.dev/learn/react-compiler/installation

Installs `vite-plugin-babel` and sets up `vite.config.js` for a React Router project to incorporate the React Compiler. This configuration demonstrates how to pass options to the compiler plugin and includes TypeScript support.

```bash
npm install vite-plugin-babel
```

```javascript
// vite.config.js
import { defineConfig } from "vite";
import babel from "vite-plugin-babel";
import { reactRouter } from "@react-router/dev/vite";


const ReactCompilerConfig = { /* ... */ };


export default defineConfig({
  plugins: [
    reactRouter(),
    babel({
      filter: /\.[jt]sx?$/,
      babelConfig: {
        presets: ["@babel/preset-typescript"], // if you use TypeScript
        plugins: [
          ["babel-plugin-react-compiler", ReactCompilerConfig],
        ],
      },
    }),
  ],
});
```

--------------------------------

### Complete List Rendering Example

Source: https://react.dev/learn/rendering-lists

Full working example demonstrating the complete workflow of storing data in an array, mapping it to JSX components, and rendering the list in a React component. Note: This example will generate a console warning about missing keys on list items.

```javascript
const people = [
  'Creola Katherine Johnson: mathematician',
  'Mario José Molina-Pasquel Henríquez: chemist',
  'Mohammad Abdus Salam: physicist',
  'Percy Lavon Julian: chemist',
  'Subrahmanyan Chandrasekhar: astrophysicist'
];

export default function List() {
  const listItems = people.map(person =>
    <li>{person}</li>
  );
  return <ul>{listItems}</ul>;
}
```

--------------------------------

### Effect Synchronization Setup Pattern

Source: https://react.dev/learn/lifecycle-of-reactive-effects

Shows the core pattern for starting synchronization in a React Effect. This code block illustrates how to initialize an external connection and establish communication. Part of the complete Effect lifecycle pattern that includes cleanup.

```javascript
// ...
const connection = createConnection(serverUrl, roomId);
connection.connect();
return () => {
  connection.disconnect();
};
// ...
```

--------------------------------

### React Suspense with Server Components

Source: https://react.dev/learn/creating-a-react-app

Demonstrates using React's Suspense component to specify loading states for server-rendered content. The fallback prop displays a placeholder (like a skeleton) while the async Talks component loads data, improving perceived performance and user experience.

```javascript
<Suspense fallback={<TalksLoading />}>
  <Talks confId={conf.id} />
</Suspense>
```

--------------------------------

### Nest a React component within another component (JavaScript/JSX)

Source: https://react.dev/learn

This example shows how to use a previously defined React component (`MyButton`) inside another component (`MyApp`). Components are nested by treating them as custom HTML-like tags, always starting with a capital letter.

```javascript
export default function MyApp() {  
  return (  
    <div>  
      <h1>Welcome to my app</h1>  
      <MyButton />  
    </div>  
  );  
}
```

--------------------------------

### Install React and React DOM packages via npm

Source: https://react.dev/learn/add-react-to-an-existing-project

This command installs the core React library and React DOM, which are essential dependencies for developing and rendering React components in a web browser. It should be executed in your project's root directory after Node.js is installed and your project is set up.

```bash
npm install react react-dom
```

--------------------------------

### Install ESLint Plugin for React Compiler Code Optimization

Source: https://react.dev/learn/react-compiler/installation

Installs `eslint-plugin-react-hooks` as a development dependency, which includes rules to identify code that cannot be optimized by the React Compiler. This helps in gradually improving component optimization in your codebase.

```bash
npm install -D eslint-plugin-react-hooks@latest
```

--------------------------------

### Migration Guide: Static Prerendering

Source: https://react.dev/reference/react-dom/server/renderToString

Provides migration path from renderToString to prerendering solutions that support waiting for data to load during static HTML generation.

```APIDOC
## Migration to Static Prerendering

### Description
renderToString returns a string immediately and does not support waiting for data to load for static HTML generation. Use fully-featured prerendering alternatives instead.

### Limitation of renderToString
- Cannot wait for data loading
- No support for asynchronous data fetching
- Suitable only for synchronous rendering
- Not ideal for static site generation with dynamic data

### Recommended Alternatives

#### For Node.js
Use `prerenderToNodeStream`:
```javascript
import { prerenderToNodeStream } from 'react-dom/server';

const stream = prerenderToNodeStream(<App />, {
  onError(error) {
    console.error(error);
  }
});

stream.pipe(response);
```

#### For Deno or Modern Edge Runtimes
Use `prerender`:
```javascript
import { prerender } from 'react-dom/server';

const { html } = await prerender(<App />);
return new Response(html);
```

### Benefits of Prerendering
- Wait for data loading before rendering
- Support for async operations
- Better for static site generation
- More control over rendering lifecycle
```

--------------------------------

### Configure React Compiler in Vite via @vitejs/plugin-react

Source: https://react.dev/learn/react-compiler/installation

Integrates the React Compiler Babel plugin directly into the `@vitejs/plugin-react` configuration within `vite.config.js`. This method is suitable for standard Vite setups using the official React plugin.

```javascript
// vite.config.js
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [
    react({
      babel: {
        plugins: ['babel-plugin-react-compiler'],
      },
    }),
  ],
});
```

--------------------------------

### useEffect Hook Basic Setup with Cleanup

Source: https://react.dev/reference/react/useEffect

Demonstrates the core useEffect pattern with setup and cleanup functions. The effect connects to an external system (chat connection) when dependencies change, and properly disconnects when the component unmounts or dependencies update. Includes both serverUrl and roomId as reactive dependencies.

```javascript
import { useState, useEffect } from 'react';
import { createConnection } from './chat.js';

function ChatRoom({ roomId }) {
  const [serverUrl, setServerUrl] = useState('https://localhost:1234');

  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => {
      connection.disconnect();
    };
  }, [serverUrl, roomId]);
  // ...
}
```

--------------------------------

### React Greeting Component with JSX

Source: https://react.dev/learn/installation

A simple React functional component demonstrating JSX syntax with props. The Greeting component accepts a name prop and renders an h1 element. The App component exports the default application entry point, rendering the Greeting component with a name prop value of 'world'.

```javascript
function Greeting({ name }) {
  return <h1>Hello, {name}</h1>;
}

export default function App() {
  return <Greeting name="world" />
}
```

--------------------------------

### Preloading Resources in a React Event Handler

Source: https://react.dev/reference/react-dom/preload

This example demonstrates calling `preload` within an event handler, such as a button click. Preloading a stylesheet (`wizardStyles.css`) before a UI transition (e.g., starting a wizard) ensures the resource is available when needed, improving the perceived performance and responsiveness of the application.

```javascript
import { preload } from 'react-dom';


function CallToAction() {

  const onClick = () => {

    preload("https://example.com/wizardStyles.css", {as: "style"});

    startWizard();

  }

  return (

    <button onClick={onClick}>Start Wizard</button>

  );

}
```

--------------------------------

### Install React 19 and React DOM packages

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

These commands install the latest stable versions of the `react` and `react-dom` packages, specifically targeting version 19.0.0. The `--save-exact` (npm) or `--exact` (yarn) flag ensures that the exact specified version is saved to your `package.json` file.

```bash
npm install --save-exact react@^19.0.0 react-dom@^19.0.0
```

```bash
yarn add --exact react@^19.0.0 react-dom@^19.0.0
```

--------------------------------

### Install React DevTools npm Package Globally

Source: https://react.dev/learn/react-developer-tools

This snippet provides commands to globally install the `react-devtools` npm package using either Yarn or npm. This installation method is crucial for debugging React applications in environments where direct browser extensions are not available, such as Safari or specific development setups.

```bash
yarn global add react-devtools
```

```bash
npm install -g react-devtools
```

--------------------------------

### Complete React list rendering with keyed Fragments and sub-components

Source: https://react.dev/reference/react/Fragment

A full React example showing a `Blog` component that renders a dynamic list of posts. Each post's details are wrapped in a keyed `<Fragment>` component, ensuring efficient updates and correct DOM structure.

```javascript
import { Fragment } from 'react';

const posts = [
  { id: 1, title: 'An update', body: "It's been a while since I posted..." },
  { id: 2, title: 'My new blog', body: 'I am starting a new blog!' }
];

export default function Blog() {
  return posts.map(post =>
    <Fragment key={post.id}>
      <PostTitle title={post.title} />
      <PostBody body={post.body} />
    </Fragment>
  );
}

function PostTitle({ title }) {
  return <h1>{title}</h1>
}

function PostBody({ body }) {
  return (
    <article>
      <p>{body}</p>
    </article>
  );
}
```

--------------------------------

### Initialize and Render Full React Application with `createRoot`

Source: https://react.dev/reference/react-dom/client/createRoot

Demonstrates the typical setup for a React application's entry point (`index.js`). It imports `createRoot` from `react-dom/client`, the main `App` component, and styles, then initializes a React root on the 'root' DOM element and renders the `App` component into it. This code usually runs once at application startup.

```javascript
import { createRoot } from 'react-dom/client';  

import App from './App.js';
import './styles.css';

const root = createRoot(document.getElementById('root'));
root.render(<App />);
```

--------------------------------

### React Server Component with Database Query

Source: https://react.dev/learn/creating-a-react-app

Server-only async React component that executes on the server or during build time. It demonstrates accessing data layers directly without requiring API endpoints, processing data server-side, and passing results to interactive client components. This pattern is fully implemented in Next.js App Router.

```javascript
// This component runs *only* on the server (or during the build).
async function Talks({ confId }) {
  // 1. You're on the server, so you can talk to your data layer. API endpoint not required.
  const talks = await db.Talks.findAll({ confId });

  // 2. Add any amount of rendering logic. It won't make your JavaScript bundle larger.
  const videos = talks.map(talk => talk.video);

  // 3. Pass the data down to the components that will run in the browser.
  return <SearchableVideoList videos={videos} />;
}
```

--------------------------------

### Check React Version Installation

Source: https://react.dev/reference/react-compiler/target

Verify the installed React version in your project. Use this command to diagnose version mismatches between your configuration and installed React package.

```bash
npm why react
```

--------------------------------

### Install React 19 TypeScript type definitions

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

These commands install the type definitions for React 19 and React DOM 19, which are essential for TypeScript projects. The `--save-exact` (npm) or `--exact` (yarn) flag ensures that the exact specified version of the types is saved to your `package.json`.

```bash
npm install --save-exact @types/react@^19.0.0 @types/react-dom@^19.0.0
```

```bash
yarn add --exact @types/react@^19.0.0 @types/react-dom@^19.0.0
```

--------------------------------

### Complete React video player app with useEffect synchronization

Source: https://react.dev/learn/synchronizing-with-effects

Full working example of a React app with state management and a VideoPlayer component that uses useEffect to keep the video playback state synchronized with the isPlaying prop. Demonstrates how Effects run after renders to update external systems.

```javascript
import { useState, useRef, useEffect } from 'react';

function VideoPlayer({ src, isPlaying }) {
  const ref = useRef(null);

  useEffect(() => {
    if (isPlaying) {
      ref.current.play();
    } else {
      ref.current.pause();
    }
  });

  return <video ref={ref} src={src} loop playsInline />;
}

export default function App() {
  const [isPlaying, setIsPlaying] = useState(false);
  return (
    <>
      <button onClick={() => setIsPlaying(!isPlaying)}>
        {isPlaying ? 'Pause' : 'Play'}
      </button>
      <VideoPlayer
        isPlaying={isPlaying}
        src="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
      />
    </>
  );
}
```

--------------------------------

### useInsertionEffect Hook - Basic Syntax and Setup

Source: https://react.dev/reference/react/useInsertionEffect

Demonstrates the basic syntax for using useInsertionEffect to inject dynamic styles from CSS-in-JS libraries. The hook is called with a setup function that contains logic to inject <style> tags before layout Effects run. This example shows how to wrap useInsertionEffect inside a custom CSS hook within a CSS-in-JS library.

```javascript
import { useInsertionEffect } from 'react';

// Inside your CSS-in-JS library
function useCSS(rule) {
  useInsertionEffect(() => {
    // ... inject <style> tags here ...
  });

  return rule;
}
```

--------------------------------

### Manage Component Lifecycle with componentDidMount, componentDidUpdate, and componentWillUnmount in React

Source: https://react.dev/reference/react/Component

This example demonstrates how to use `componentDidMount` for initial setup like establishing a connection, `componentDidUpdate` for reacting to changes in props or state by re-establishing the connection, and `componentWillUnmount` for cleaning up resources when the component is unmounted. This pattern ensures proper resource management throughout the component's lifecycle.

```jsx
class ChatRoom extends Component {
  state = {
    serverUrl: 'https://localhost:1234'
  };

  componentDidMount() {
    this.setupConnection();
  }

  componentDidUpdate(prevProps, prevState) {
    if (
      this.props.roomId !== prevProps.roomId ||
      this.state.serverUrl !== prevState.serverUrl
    ) {
      this.destroyConnection();
      this.setupConnection();
    }
  }

  componentWillUnmount() {
    this.destroyConnection();
  }

  // ...
}
```

--------------------------------

### Manage Component State with useState Hook in React

Source: https://react.dev/learn

Shows how to use the useState hook to add state to a functional component. The hook returns the current state value and a function to update it. This example demonstrates a counter that increments each time the button is clicked, with each component instance maintaining its own separate state.

```JavaScript
import { useState } from 'react';

function MyButton() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    <button onClick={handleClick}>
      Clicked {count} times
    </button>
  );
}
```

--------------------------------

### Migration Guide: Streaming Alternatives

Source: https://react.dev/reference/react-dom/server/renderToString

Provides migration path from renderToString to streaming render functions for better performance. Recommends renderToPipeableStream for Node.js and renderToReadableStream for Deno/edge runtimes.

```APIDOC
## Migration to Streaming Render

### Description
renderToString returns a string immediately and does not support streaming content as it loads. When possible, use fully-featured streaming alternatives.

### Limitation of renderToString
- Returns entire HTML string at once
- No support for progressive content delivery
- Blocks until all rendering is complete
- Not suitable for content that loads asynchronously

### Recommended Alternatives

#### For Node.js
Use `renderToPipeableStream`:
```javascript
import { renderToPipeableStream } from 'react-dom/server';

const stream = renderToPipeableStream(<App />);
stream.pipe(response);
```

#### For Deno or Modern Edge Runtimes
Use `renderToReadableStream`:
```javascript
import { renderToReadableStream } from 'react-dom/server';

const stream = await renderToReadableStream(<App />);
return new Response(stream);
```

### Benefits of Streaming
- Progressive HTML delivery
- Better Time to First Byte (TTFB)
- Support for Suspense and async data loading
- Improved user experience on slow connections
```

--------------------------------

### Launch React DevTools from Terminal

Source: https://react.dev/learn/react-developer-tools

After installing the `react-devtools` npm package, this command is used to launch the standalone React Developer Tools application from the terminal. This step is necessary before connecting your web application for inspection.

```bash
react-devtools
```

--------------------------------

### Install react-shallow-renderer Package

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Install react-shallow-renderer as a direct dependency instead of importing from react-test-renderer/shallow. React 19 removes the re-export from react-test-renderer.

```bash
npm install react-shallow-renderer --save-dev
```

--------------------------------

### Compose React Components with JSX

Source: https://react.dev/learn/your-first-component

Shows how React components can be composed together to build complete page layouts. This example demonstrates nesting multiple components including NavigationHeader, Sidebar, and PageContent to create a full documentation page structure.

```jsx
<PageLayout>
  <NavigationHeader>
    <SearchBar />
    <Link to="/docs">Docs</Link>
  </NavigationHeader>
  <Sidebar />
  <PageContent>
    <TableOfContents />
    <DocumentationText />
  </PageContent>
</PageLayout>
```

--------------------------------

### Complete Shared State Counter Application - React

Source: https://react.dev/learn

Full working example of a React application with lifted state. MyApp manages a shared count state and passes it to multiple MyButton components. When any button is clicked, the shared state updates and both buttons display the new count value, demonstrating state lifting and prop passing.

```JavaScript
import { useState } from 'react';

export default function MyApp() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    <div>
      <h1>Counters that update together</h1>
      <MyButton count={count} onClick={handleClick} />
      <MyButton count={count} onClick={handleClick} />
    </div>
  );
}

function MyButton({ count, onClick }) {
  return (
    <button onClick={onClick}>
      Clicked {count} times
    </button>
  );
}
```

--------------------------------

### Leaked Server Function Source Code Example

Source: https://react.dev/blog/2025/12/11/denial-of-service-and-source-code-exposure-in-react-server-components

Example output demonstrating how an attacker can extract the stringified Server Function source code through a malicious request. The response shows the leaked function code including the hardcoded SECRET KEY and the original function implementation.

```json
0:{"a":"$@1","f":"","b":"Wy43RxUKdxmr5iuBzJ1pN"}
1:{"id":"tva1sfodwq","message":"Hello, async function(a){console.log(\"serverFunction\");let b=i.createConnection(\"SECRET KEY\");return{id:(await b.createUser(a)).id,message:`Hello, ${a}!`}}!"}
```

--------------------------------

### Import and Instantiate React Root with createRoot

Source: https://react.dev/reference/react-dom/client/createRoot

This example demonstrates how to import `createRoot` from 'react-dom/client' and use it to create a React root instance. It targets a specific DOM element by its ID, typically for a main application entry point.

```javascript
import { createRoot } from 'react-dom/client';

const domNode = document.getElementById('root');
const root = createRoot(domNode);
```

--------------------------------

### Set dynamic attributes in JSX using curly braces

Source: https://react.dev/learn

This example explains how to assign a JavaScript variable's value to an HTML attribute in JSX. Unlike static string attributes that use quotes, dynamic attribute values require curly braces around the JavaScript expression.

```jsx
return (  
  <img  
    className="avatar"  
    src={user.imageUrl}  
  />  
);
```

--------------------------------

### Install React Compiler Babel Plugin

Source: https://react.dev/reference/react-compiler/compiling-libraries

Installs the `babel-plugin-react-compiler` as a development dependency. This plugin is essential for integrating React Compiler into a library's build process, enabling optimization before publishing to npm.

```shell
npm install -D babel-plugin-react-compiler@latest
```

--------------------------------

### Complete React app using createElement

Source: https://react.dev/reference/react/createElement

Full example demonstrating a complete React application built entirely with createElement. Shows both a reusable Greeting component that creates nested elements and a main App component that renders the Greeting component with props.

```javascript
import { createElement } from 'react';

function Greeting({ name }) {
  return createElement(
    'h1',
    { className: 'greeting' },
    'Hello ',
    createElement('i', null, name),
    '. Welcome!'
  );
}

export default function App() {
  return createElement(
    Greeting,
    { name: 'Taylor' }
  );
}
```

--------------------------------

### Install React TypeScript Type Definitions

Source: https://react.dev/learn/typescript

Command to install the latest React type definitions package for TypeScript support. Installs @types/react and @types/react-dom as development dependencies to enable full React and React DOM type checking.

```bash
npm install --save-dev @types/react @types/react-dom
```

--------------------------------

### Return multiple elements using React Fragments (JSX)

Source: https://react.dev/learn

This snippet illustrates how to return multiple JSX elements from a component by wrapping them in a React Fragment (`<>...</>`). This addresses JSX's requirement that a component must return a single root element.

```javascript
function AboutPage() {  
  return (  
    <>  
      <h1>About</h1>  
      <p>Hello there.<br />How do you do?</p>  
    </>  
  );  
}
```

--------------------------------

### Configure React Compiler in babel.config.js

Source: https://react.dev/learn/react-compiler/installation

Updates your project's `babel.config.js` to include `babel-plugin-react-compiler` in the plugin list. It's crucial for the compiler plugin to run first in the Babel pipeline to ensure proper analysis of the original source code.

```javascript
module.exports = {
  plugins: [
    'babel-plugin-react-compiler', // must run first!
    // ... other plugins
  ],
  // ... other config
};
```

--------------------------------

### Render a basic React 'Hello, world!' component

Source: https://react.dev/learn/add-react-to-an-existing-project

This JavaScript code snippet demonstrates how to initialize a React application and render a simple 'Hello, world!' heading into the DOM. It first clears the document body, creates a new root element, and then uses `createRoot` from `react-dom/client` to mount and render a basic React element. This serves as a quick verification that your React development environment is correctly configured.

```javascript
import { createRoot } from 'react-dom/client';

// Clear the existing HTML content
document.body.innerHTML = '<div id="app"></div>';

// Render your React component instead
const root = createRoot(document.getElementById('app'));
root.render(<h1>Hello, world</h1>);
```

--------------------------------

### Server-Side Rendering Usage Example

Source: https://react.dev/reference/react-dom/server/renderToString

Demonstrates how to use renderToString to generate HTML on the server and send it as the initial response. Shows integration with a typical backend framework routing pattern.

```APIDOC
## Server-Side Rendering Pattern

### Description
Shows the recommended pattern for using renderToString to render your React app to an HTML string which can be sent with your server response.

### Code Example
```javascript
import { renderToString } from 'react-dom/server';

// The route handler syntax depends on your backend framework
app.use('/', (request, response) => {
  const html = renderToString(<App />);
  response.send(html);
});
```

### Client-Side Hydration
After receiving the server-generated HTML, call `hydrateRoot` on the client to make it interactive:

```javascript
import { hydrateRoot } from 'react-dom/client';

hydrateRoot(document, <App />);
```

### Flow
1. Server receives request
2. Server calls renderToString to generate HTML
3. Server sends HTML string in response
4. Client receives HTML and mounts it to DOM
5. Client calls hydrateRoot to attach event listeners and make interactive
```

--------------------------------

### Import React Dependencies and Components in Entry Point

Source: https://react.dev/learn/tutorial-tic-tac-toe

Sets up the React application entry point by importing React, ReactDOM, CSS styles, and the main App component. This file bridges the React components with the web browser and prepares all necessary dependencies for rendering the application.

```javascript
import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';
import App from './App';
```

--------------------------------

### Import and Basic Usage of preconnect from react-dom

Source: https://react.dev/reference/react-dom/preconnect

Demonstrates how to import the preconnect function from react-dom and call it with a server URL. This basic example shows the function signature and typical usage pattern for establishing eager connections to external servers.

```JavaScript
import { preconnect } from 'react-dom';

preconnect("https://example.com");
```

--------------------------------

### Implement React `resumeAndPrerender` in a server handler for SSG

Source: https://react.dev/reference/react-dom/static/resumeAndPrerender

This example shows how to use `resumeAndPrerender` within an `async` server handler to generate static HTML. It imports the API, retrieves a `postponedState`, and then passes a React node and `bootstrapScripts` option to `resumeAndPrerender`. The resulting `prelude` stream is then used to construct an HTTP response with the correct content type.

```javascript
import { resumeAndPrerender } from 'react-dom/static';  

import { getPostponedState } from 'storage';  

  

async function handler(request, response) {  

  const postponedState = getPostponedState(request);  

  const { prelude } = await resumeAndPrerender(<App />, postponedState, {  

    bootstrapScripts: ['/main.js']  

  });  

  return new Response(prelude, {  

    headers: { 'content-type': 'text/html' },  

  });  

}
```

--------------------------------

### Define a basic React functional component (JavaScript/JSX)

Source: https://react.dev/learn

This snippet demonstrates how to create a simple React functional component. It's a JavaScript function that returns JSX markup, representing a piece of the user interface.

```javascript
function MyButton() {  
  return (  
    <button>I'm a button</button>  
  );  
}
```

--------------------------------

### HTML Document Structure with Semantic Tags

Source: https://react.dev/learn/your-first-component

Demonstrates traditional HTML markup using semantic tags like article, heading, and ordered list to create structured web content. This example shows the basic HTML structure that React components can encapsulate and reuse.

```html
<article>
  <h1>My First Component</h1>
  <ol>
    <li>Components: UI Building Blocks</li>
    <li>Defining a Component</li>
    <li>Using a Component</li>
  </ol>
</article>
```

--------------------------------

### Install React Compiler with npm, pnpm, or yarn

Source: https://react.dev/blog/2025/10/07/react-compiler-1

Install the babel-plugin-react-compiler package using your preferred package manager. The --save-dev flag installs it as a development dependency, and --save-exact pins the latest version to ensure consistency across environments.

```bash
npm install --save-dev --save-exact babel-plugin-react-compiler@latest
```

```bash
pnpm add --save-dev --save-exact babel-plugin-react-compiler@latest
```

```bash
yarn add --dev --exact babel-plugin-react-compiler@latest
```

--------------------------------

### Basic React `prefetchDNS` function call

Source: https://react.dev/reference/react-dom/prefetchDNS

Illustrates a fundamental call to the `prefetchDNS` function. This basic example demonstrates initiating a DNS prefetch for a specified URL.

```javascript
prefetchDNS("https://example.com");
```

--------------------------------

### Basic React App Entry Point

Source: https://react.dev/reference/react/StrictMode

Standard React application initialization using createRoot from react-dom/client. This renders the App component to the DOM root element.

```javascript
import { createRoot } from 'react-dom/client';
import './styles.css';
import App from './App';

const root = createRoot(document.getElementById("root"));
root.render(<App />);
```

--------------------------------

### React Effect with Same Dependencies Setup

Source: https://react.dev/learn/synchronizing-with-effects

Shows a React Effect hook with cleanup function and dependency array that remains unchanged between renders. React compares dependencies using Object.is() and skips re-execution if all match previous render.

```javascript
// Effect for the second render (roomId = "general")
() => {
  const connection = createConnection('general');
  connection.connect();
  return () => connection.disconnect();
},
// Dependencies for the second render (roomId = "general")
['general']
```

--------------------------------

### Correct Usage of `react-hook-form` with `useWatch` for Memoization Compatibility

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/incompatible-library

This example demonstrates the recommended and memoization-compatible way to get form values from `react-hook-form` using `useWatch`. Unlike `watch`, `useWatch` is designed to be compatible with React's rendering and memoization model, ensuring that components re-render correctly when the watched value changes.

```javascript
// ✅ For react-hook-form, use `useWatch`:  
function Component() {  
  const {register, control} = useForm();  
  const watchedValue = useWatch({
    control,
    name: 'field'  
  });  
  
  return (  
    <>  
      <input {...register('field')} />  
      <div>Current value: {watchedValue}</div>  
    </>  
  );
}
```

--------------------------------

### Multiple Component Instances with Separate State in React

Source: https://react.dev/learn

Demonstrates how multiple instances of the same component each maintain their own independent state. When the same component is rendered multiple times, each instance has its own state variables that don't affect other instances, allowing for isolated state management.

```JavaScript
import { useState } from 'react';

export default function MyApp() {
  return (
    <div>
      <h1>Counters that update separately</h1>
      <MyButton />
      <MyButton />
    </div>
  );
}

function MyButton() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    <button onClick={handleClick}>
      Clicked {count} times
    </button>
  );
}
```

--------------------------------

### Install React Compiler Runtime Package

Source: https://react.dev/reference/react-compiler/compiling-libraries

Installs the `react-compiler-runtime` package as a direct dependency. This is required for backwards compatibility when supporting React versions older than 19, ensuring the compiled library functions correctly.

```shell
npm install react-compiler-runtime@latest
```

--------------------------------

### resumeAndPrerender - Web Streams (Experimental)

Source: https://react.dev/reference/react-dom/static

Experimental API that continues a prerendered React tree to static HTML with a Readable Web Stream. Available in Web Streams environments only.

```APIDOC
## resumeAndPrerender (Experimental)

### Description
Continues a prerendered React tree to static HTML with a Readable Web Stream.

### Method
Function

### Environment
Web Streams environments (browsers, Deno, modern edge runtimes)

### Status
Experimental - API may change in future releases

### Parameters
#### Input Parameters
- **component** (React.ReactNode) - Required - The React component tree to resume and render
- **options** (object) - Optional - Configuration options for rendering

### Returns
- **ReadableStream** - A Readable Web Stream containing the static HTML

### Notes
- Experimental API subject to change
- Builds upon prerendered content to generate final HTML
- Limited functionality compared to streaming APIs
```

--------------------------------

### Render basic HTML input

Source: https://react.dev/reference/react-dom/components/input

This example demonstrates rendering a basic, uncontrolled HTML <input> element. It doesn't specify any attributes, resulting in a default text input.

```html
<input />
```

--------------------------------

### Equivalent React component using JSX syntax

Source: https://react.dev/reference/react/createElement

JSX equivalent of the createElement example showing the same component structure with JSX markup syntax. Demonstrates how the same component logic can be written more concisely using JSX instead of createElement calls.

```javascript
function Greeting({ name }) {
  return (
    <h1 className="greeting">
      Hello <i>{name}</i>. Welcome!
    </h1>
  );
}

export default function App() {
  return <Greeting name="Taylor" />;
}
```

--------------------------------

### React Class Component with componentDidMount, componentDidUpdate, and componentWillUnmount

Source: https://react.dev/reference/react/Component

This JavaScript example showcases a React `ChatRoom` class component that utilizes `componentDidMount` for initial setup, `componentDidUpdate` for handling changes in `roomId` or `serverUrl` to re-establish connections, and `componentWillUnmount` for cleanup. This pattern ensures proper resource management throughout the component's lifecycle.

```javascript
class ChatRoom extends Component {  
  state = {  
    serverUrl: 'https://localhost:1234'  
  };  

  componentDidMount() {  
    this.setupConnection();  
  }  

  componentDidUpdate(prevProps, prevState) {  
    if (  
      this.props.roomId !== prevProps.roomId ||  
      this.state.serverUrl !== prevState.serverUrl  
    ) {  
      this.destroyConnection();  
      this.setupConnection();  
    }  
  }  

  componentWillUnmount() {  
    this.destroyConnection();  
  }  

  // ...  
}
```

--------------------------------

### Custom Component with selectAction Prop in React

Source: https://react.dev/blog/2024/02/15/react-labs-what-we-have-been-working-on-february-2024

Example pattern for library authors implementing custom action props in components. Shows how to expose both callback and action-based APIs for consistent React developer experience across different component libraries.

```jsx
function Calendar({ onSelect, selectAction }) {
  const [isPending, startTransition] = useTransition();
  
  function handleSelect(date) {
    if (selectAction) {
      startTransition(() => selectAction(date));
    } else if (onSelect) {
      onSelect(date);
    }
  }
  
  return (
    <div>
      {/* Calendar UI */}
      <button onClick={() => handleSelect(new Date())} disabled={isPending}>
        Select Date
      </button>
    </div>
  );
}
```

--------------------------------

### Basic Logging Implementation

Source: https://react.dev/reference/react-compiler/logger

Implement basic logging to track compilation success and failures. This example demonstrates how to monitor which functions are successfully compiled and which are skipped.

```APIDOC
## Basic Logging Usage

### Description
Track compilation success and failures using event.kind to differentiate between successful compilations and skipped functions.

### Implementation

```javascript
{
  logger: {
    logEvent(filename, event) {
      switch (event.kind) {
        case 'CompileSuccess': {
          console.log(`✅ Compiled: ${filename}`);
          break;
        }
        case 'CompileError': {
          console.log(`❌ Skipped: ${filename}`);
          break;
        }
        default: {}
      }
    }
  }
}
```

### Behavior

- Logs successful compilations with ✅ indicator
- Logs compilation failures with ❌ indicator
- Ignores other event types
- Suitable for monitoring compilation progress
```

--------------------------------

### Create React Component with JSX

Source: https://react.dev/learn/describing-the-ui

Demonstrates how to write a basic React component using JSX syntax. The Gallery component renders multiple Profile components, showing how components can be nested and reused. This example illustrates the fundamental pattern of combining JavaScript functions with markup to create reusable UI elements.

```JavaScript
function Profile() {
  return (
    <img
      src="https://i.imgur.com/MK3eW3As.jpg"
      alt="Katherine Johnson"
    />
  );
}

export default function Gallery() {
  return (
    <section>
      <h1>Amazing scientists</h1>
      <Profile />
      <Profile />
      <Profile />
    </section>
  );
}
```

--------------------------------

### Render Dynamic Lists with map() Function in React

Source: https://react.dev/learn

Demonstrates rendering a list of components by transforming an array of data using the map() function. Each list item must have a unique key prop derived from the data (typically a database ID) to help React identify which items have changed, been added, or removed.

```JavaScript
const products = [
  { title: 'Cabbage', id: 1 },
  { title: 'Garlic', id: 2 },
  { title: 'Apple', id: 3 }
];

const listItems = products.map(product =>
  <li key={product.id}>
    {product.title}
  </li>
);

return (
  <ul>{listItems}</ul>
);
```

--------------------------------

### useEffect Hook Signature and Parameters

Source: https://react.dev/reference/react/useEffect

Defines the useEffect hook function signature with setup function and optional dependencies array. The setup function contains effect logic and may return a cleanup function. Dependencies determine when the effect re-runs.

```javascript
useEffect(setup, dependencies?)
```

--------------------------------

### Initialize Cat List with Push Loop JavaScript

Source: https://react.dev/reference/react/StrictMode

Creates an array of cat objects by iterating twice to add 'neo' and 'millie' type cats with image URLs from a placeholder service. Each cat object contains a type identifier and image source URL with query parameters.

```javascript
for (let i = 0; i < 10; i++) {
  catList.push({type: 'neo', src: "https://placecats.com/neo/320/240?" + i});
}
for (let i = 0; i < 10; i++) {
  catList.push({type: 'millie', src: "https://placecats.com/millie/320/240?" + i});
}

return catList;
```

--------------------------------

### Create new Vite app with optional React Compiler

Source: https://react.dev/blog/2025/10/07/react-compiler-1

Initialize a new Vite project with the option to enable React Compiler templates. Users can select compiler-enabled configurations during project setup.

```bash
npm create vite@latest
```

--------------------------------

### Basic useEffect Hook for ChatRoom Connection

Source: https://react.dev/learn/synchronizing-with-effects

Initializes a chat connection when the ChatRoom component mounts using useEffect with an empty dependency array. The connection is created and connected once when the component first appears on screen. Note: This example lacks cleanup and will leak connections on unmount.

```javascript
import { useEffect } from 'react';
import { createConnection } from './chat.js';

export default function ChatRoom() {
  useEffect(() => {
    const connection = createConnection();
    connection.connect();
  }, []);
  return <h1>Welcome to the chat!</h1>;
}
```

--------------------------------

### Create new Next.js app with optional React Compiler

Source: https://react.dev/blog/2025/10/07/react-compiler-1

Initialize a new Next.js project with the option to enable React Compiler templates. Users can select compiler-enabled configurations during project setup.

```bash
npx create-next-app@latest
```

--------------------------------

### Using a Data Fetching Library in React Components

Source: https://react.dev/learn/synchronizing-with-effects

This example illustrates the use of a hypothetical data fetching library (e.g., `useSomeDataLibrary`) as an alternative to manual `useEffect` fetching. Such libraries simplify data retrieval by often providing built-in caching, request deduplication, and state management, leading to a more streamlined development process and a faster, more responsive user experience by avoiding unnecessary re-fetches.

```javascript
function TodoList() {  
  const todos = useSomeDataLibrary(`/api/user/${userId}/todos`);  
  // ...
```

--------------------------------

### Enable React StrictMode for an Entire Application

Source: https://react.dev/reference/react/StrictMode

This example illustrates how to enable React's StrictMode for your entire application by wrapping the root component during rendering. This configuration ensures that all components rendered throughout the application are subject to StrictMode's development checks. It requires importing `StrictMode` from 'react' and `createRoot` from 'react-dom/client' to set up the application's root.

```jsx
import { StrictMode } from 'react';  
import { createRoot } from 'react-dom/client';  
  
const root = createRoot(document.getElementById('root'));  
root.render(  
  <StrictMode>  
    <App />  
  </StrictMode>  
);
```

--------------------------------

### startTransition Immediate Execution Example

Source: https://react.dev/reference/react/useTransition

Demonstrates that the callback function passed to startTransition executes immediately, not delayed like setTimeout. The output will be 1, 2, 3 in order, showing that state updates scheduled during execution are marked as Transitions.

```javascript
console.log(1);

startTransition(() => {
  console.log(2);
  setPage('/about');
});

console.log(3);
```

--------------------------------

### Render Styled List with Conditional Styling in React

Source: https://react.dev/learn

Shows a complete React component that renders a product list with conditional inline styles applied based on data properties. Each list item's color is determined by the isFruit property, demonstrating how to combine list rendering with dynamic styling.

```JavaScript
const products = [
  { title: 'Cabbage', isFruit: false, id: 1 },
  { title: 'Garlic', isFruit: false, id: 2 },
  { title: 'Apple', isFruit: true, id: 3 }
];

export default function ShoppingList() {
  const listItems = products.map(product =>
    <li
      key={product.id}
      style={{
        color: product.isFruit ? 'magenta' : 'darkgreen'
      }}
    >
      {product.title}
    </li>
  );

  return (
    <ul>{listItems}</ul>
  );
}
```

--------------------------------

### Read Props in Child Component - React

Source: https://react.dev/learn

Demonstrates how a child component receives and uses props passed from its parent. The MyButton component destructures count and onClick props from its parent and uses them to display the current count and handle click events.

```JavaScript
function MyButton({ count, onClick }) {
  return (
    <button onClick={onClick}>
      Clicked {count} times
    </button>
  );
}
```

--------------------------------

### Handle Click Events with Event Handler in React

Source: https://react.dev/learn

Demonstrates how to respond to user interactions by declaring an event handler function and passing it to an event attribute like onClick. The event handler function is passed without parentheses, allowing React to call it when the user triggers the event.

```JavaScript
function MyButton() {
  function handleClick() {
    alert('You clicked me!');
  }

  return (
    <button onClick={handleClick}>
      Click me
    </button>
  );
}
```

--------------------------------

### Correct React Component Rendering with createRoot

Source: https://react.dev/reference/react-dom/client/createRoot

Demonstrates the correct syntax for rendering a React component using createRoot. Shows the difference between passing a function reference versus JSX syntax. The correct approach uses JSX element notation (<App />) rather than the function itself (App).

```javascript
// 🚩 Wrong: App is a function, not a Component.

root.render(App);


// ✅ Correct: <App /> is a component.

root.render(<App />);
```

--------------------------------

### Apply CSS classes to React elements (JSX)

Source: https://react.dev/learn

This snippet demonstrates how to assign a CSS class to an HTML element within JSX. In React, the `class` attribute is replaced by `className` to avoid conflicts with JavaScript's reserved `class` keyword.

```jsx
<img className="avatar" />
```

--------------------------------

### React useLayoutEffect Hook Signature

Source: https://react.dev/reference/react/useLayoutEffect

This snippet shows the basic signature of the `useLayoutEffect` React Hook. It accepts a `setup` function for the effect's logic and an optional array of `dependencies`. The `setup` function can also return a cleanup function.

```javascript
useLayoutEffect(setup, dependencies?)
```

--------------------------------

### Correct pattern for passing options to createRoot

Source: https://react.dev/reference/react-dom/client/createRoot

Demonstrates the correct way to pass configuration options to createRoot() rather than to render(). Options like onUncaughtError must be passed to createRoot, not to the render() method.

```javascript
// ✅ Correct: pass options to createRoot.
const root = createRoot(container, { onUncaughtError });
root.render(<App />);
```

--------------------------------

### React Component Subscribing to an External Store with useSyncExternalStore

Source: https://react.dev/reference/react/useSyncExternalStore

This example demonstrates how to use `useSyncExternalStore` within a React functional component. It imports the hook and a `todosStore` to subscribe to changes and retrieve the current snapshot of todos, ensuring the component re-renders when the external store updates.

```javascript
import { useSyncExternalStore } from 'react';  

import { todosStore } from './todoStore.js';  

  

function TodosApp() {  

  const todos = useSyncExternalStore(todosStore.subscribe, todosStore.getSnapshot);  

  // ...  

}
```

--------------------------------

### Embed JavaScript variables in JSX using curly braces

Source: https://react.dev/learn

This snippet demonstrates how to display dynamic data from JavaScript variables within JSX. By enclosing the variable name in curly braces, you 'escape back' into JavaScript to embed its value directly into the rendered output.

```jsx
return (  
  <h1>  
    {user.name}  
  </h1>  
);
```

--------------------------------

### Conditional Rendering with Ternary Operator in React

Source: https://react.dev/learn

Shows how to use the JavaScript ternary operator (? :) for inline conditional rendering directly within JSX. This compact syntax is more concise than if/else statements and works inside JSX expressions, making it ideal for simple conditional logic.

```JavaScript
<div>
  {isLoggedIn ? (
    <AdminPanel />
  ) : (
    <LoginForm />
  )}
</div>
```

--------------------------------

### Move State Up from Child to Parent Component - React

Source: https://react.dev/learn

Demonstrates lifting state from individual MyButton components into the parent MyApp component. The parent component manages the count state and passes it down to children as props. This pattern enables multiple components to share and synchronize the same state.

```JavaScript
export default function MyApp() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    <div>
      <h1>Counters that update separately</h1>
      <MyButton />
      <MyButton />
    </div>
  );
}

function MyButton() {
  // ... we're moving code from here ...
}
```

--------------------------------

### Conditional Rendering with if Statement in React

Source: https://react.dev/learn

Demonstrates how to conditionally render different JSX elements based on a boolean condition using standard JavaScript if/else statements. The content variable is assigned different JSX components before being rendered in the return statement. This approach is useful for complex conditional logic.

```JavaScript
let content;

if (isLoggedIn) {
  content = <AdminPanel />;
} else {
  content = <LoginForm />;
}

return (
  <div>
    {content}
  </div>
);
```

--------------------------------

### Define React Component with Automatic Memoization Example

Source: https://react.dev/blog/2025/10/07/react-compiler-1

This JavaScript snippet illustrates a React functional component, `ThemeProvider`, which demonstrates how the React Compiler can automatically memoize code even after a conditional return. The compiler's deep understanding of data-flow allows it to optimize the `theme` calculation and component rendering without explicit `useMemo` or `useCallback` hooks. This example showcases the compiler's capability to enhance performance by granularly memoizing values.

```javascript
import { use } from 'react';  
  
export default function ThemeProvider(props) {  
  if (!props.children) {  
    return null;  
  }  
  // The compiler can still memoize code after a conditional return  
  const theme = mergeTheme(props.theme, use(ThemeContext));  
  return (  
    <ThemeContext value={theme}>  
      {props.children}  
    </ThemeContext>  
  );  
}
```

--------------------------------

### React Square Button Component Starter

Source: https://react.dev/learn/tutorial-tic-tac-toe

Basic React functional component that renders a button element with the className 'square' and displays 'X' as its content. This is the starter template used in the tutorial setup for building the tic-tac-toe game incrementally.

```JavaScript
export default function Square() {
  return <button className="square">X</button>;
}
```

--------------------------------

### React TodoList Component with JSX Markup

Source: https://react.dev/learn/writing-markup-with-jsx

Complete functional React component example demonstrating proper JSX syntax including fragment notation, camelCase className, and nested HTML elements. Shows best practice for rendering lists and component structure.

```jsx
export default function TodoList() {
  return (
    <>
      <h1>Hedy Lamarr's Todos</h1>
      <img
        src="https://i.imgur.com/yXOvdOSs.jpg"
        alt="Hedy Lamarr"
        className="photo"
      />
      <ul>
        <li>Invent new traffic lights</li>
        <li>Rehearse a movie scene</li>
        <li>Improve the spectrum technology</li>
      </ul>
    </>
  );
}
```

--------------------------------

### preinitModule Function Reference

Source: https://react.dev/reference/react-dom/preinitModule

The preinitModule function from react-dom provides the browser with a hint to start downloading and executing a given ESM module. This function returns nothing and accepts an href string and options object as parameters.

```APIDOC
## preinitModule(href, options)

### Description
Eagerly fetch and evaluate an ESM module. The browser will start downloading and executing the module, which can save time when you know the module will be needed.

### Method
Function Call

### Function Signature
```javascript
preinitModule(href, options)
```

### Parameters

#### Required Parameters
- **href** (string) - Required - The URL of the module you want to download and execute
- **options** (object) - Required - Configuration object for the module
  - **as** (string) - Required - Must be `'script'`

#### Optional Parameters
- **options.crossOrigin** (string) - Optional - The CORS policy to use. Possible values: `anonymous`, `use-credentials`
- **options.integrity** (string) - Optional - A cryptographic hash of the module to verify its authenticity
- **options.nonce** (string) - Optional - A cryptographic nonce to allow the module when using strict Content Security Policy

### Returns
Returns nothing (void)

### Request Example
```javascript
import { preinitModule } from 'react-dom';

preinitModule("https://example.com/module.js", {as: "script"});
```

### Advanced Example with Options
```javascript
import { preinitModule } from 'react-dom';

function AppRoot() {
  preinitModule("https://example.com/module.js", {
    as: "script",
    crossOrigin: "anonymous",
    integrity: "sha384-..."
  });
  return ...;
}
```

### Important Caveats
- Multiple calls with the same `href` have the same effect as a single call
- In the browser, can be called during rendering, in Effects, in event handlers, etc.
- In server-side rendering or Server Components, only has effect if called during component rendering or in async context from rendering
- Note: React-based frameworks often handle resource loading automatically, so you may not need to call this directly
```

--------------------------------

### Opt Out Component from React Compiler with 'use no memo' Directive

Source: https://react.dev/learn/react-compiler/installation

Shows how to use the 'use no memo' directive to disable React Compiler optimization for a specific component. This is a temporary troubleshooting measure when a component causes issues after compilation. The directive should be removed once the underlying issue is fixed.

```javascript
function ProblematicComponent() {
  "use no memo";
  // Component code here
}
```

--------------------------------

### Resume a Prerendered React Application with `prerender` and `resume` in JavaScript

Source: https://react.dev/reference/react-dom/server/resume

This `index.js` file demonstrates the complete lifecycle of prerendering, resuming, and hydrating a React application. It uses `prerender` to generate initial HTML, strategically aborts rendering to simulate postponement for data fetching, then `resume`s the rendering process from the postponed state, and finally `hydrateRoot`s the application for client-side interactivity. The `main` function orchestrates these steps, including simulated delays and cookie resolution.

```javascript
import {
  flushReadableStreamToFrame,
  getUser,
  Postponed,
  sleep,
} from "./demo-helpers";
import { StrictMode, Suspense, use, useEffect } from "react";
import { prerender } from "react-dom/static";
import { resume } from "react-dom/server";
import { hydrateRoot } from "react-dom/client";

function Header() {
  return <header>Me and my descendants can be prerendered</header>;
}

const { promise: cookies, resolve: resolveCookies } = Promise.withResolvers();

function Main() {
  const { sessionID } = use(cookies);
  const user = getUser(sessionID);

  useEffect(() => {
    console.log("reached interactivity!");
  }, []);

  return (
    <main>
      Hello, {user.name}!
      <button onClick={() => console.log("hydrated!")}>
        Clicking me requires hydration.
      </button>
    </main>
  );
}

function Shell({ children }) {
  // In a real app, this is where you would put your html and body.
  // We're just using tags here we can include in an existing body for demonstration purposes
  return (
    <html>
      <body>{children}</body>
    </html>
  );
}

function App() {
  return (
    <Shell>
      <Suspense fallback="loading header">
        <Header />
      </Suspense>
      <Suspense fallback="loading main">
        <Main />
      </Suspense>
    </Shell>
  );
}

async function main(frame) {
  // Layer 1
  const controller = new AbortController();
  const prerenderedApp = prerender(<App />, {
    signal: controller.signal,
    onError(error) {
      if (error instanceof Postponed) {
      } else {
        console.error(error);
      }
    },
  });
  // We're immediately aborting in a macrotask.
  // Any data fetching that's not available synchronously, or in a microtask, will not have finished.
  setTimeout(() => {
    controller.abort(new Postponed());
  });

  const { prelude, postponed } = await prerenderedApp;
  await flushReadableStreamToFrame(prelude, frame);

  // Layer 2
  // Just waiting here for demonstration purposes.
  // In a real app, the prelude and postponed state would've been serialized in Layer 1 and Layer would deserialize them.
  // The prelude content could be flushed immediated as plain HTML while
  // React is continuing to render from where the prerender left off.
  await sleep(2000);

  // You would get the cookies from the incoming HTTP request
  resolveCookies({ sessionID: "abc" });

  const stream = await resume(<App />, postponed);

  await flushReadableStreamToFrame(stream, frame);

  // Layer 3
  // Just waiting here for demonstration purposes.
  await sleep(2000);

  hydrateRoot(frame.contentWindow.document, <App />);
}

main(document.getElementById("container"));
```

--------------------------------

### Define CSS rules for a React component's class (CSS)

Source: https://react.dev/learn

This CSS snippet provides a basic style rule for the `.avatar` class. This rule would typically be placed in a separate CSS file and applied to elements in React components that use `className="avatar"`.

```css
/* In your CSS */  
.avatar {  
  border-radius: 50%;  
}
```

--------------------------------

### Server-Side Handler with resumeAndPrerenderToNodeStream

Source: https://react.dev/reference/react-dom/static/resumeAndPrerenderToNodeStream

This example illustrates how to integrate `resumeAndPrerenderToNodeStream` within a Node.js server handler. It imports the function from `react-dom/static`, retrieves `postponedState` from storage, and then uses the `prelude` stream to pipe the generated HTML to a writable response stream, facilitating streaming server-side rendering for a React application.

```javascript
import { resumeAndPrerenderToNodeStream } from 'react-dom/static';  

import { getPostponedState } from 'storage';  

  

async function handler(request, writable) {  

  const postponedState = getPostponedState(request);  

  const { prelude } = await resumeAndPrerenderToNodeStream(<App />, JSON.parse(postponedState));  

  prelude.pipe(writable);  

}
```

--------------------------------

### Pass State and Handlers Down as Props - React

Source: https://react.dev/learn

Shows how to pass state and event handlers from parent component to child components using JSX props syntax. The parent MyApp component passes both the count state and handleClick function to each MyButton component, enabling them to display and update shared state.

```JavaScript
export default function MyApp() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    <div>
      <h1>Counters that update together</h1>
      <MyButton count={count} onClick={handleClick} />
      <MyButton count={count} onClick={handleClick} />
    </div>
  );
}
```

--------------------------------

### useEffect Cleanup Logic Without Setup - Anti-pattern

Source: https://react.dev/reference/react/useEffect

Demonstrates an anti-pattern where cleanup logic runs without corresponding setup logic. This is considered a code smell and should be avoided. The cleanup function will execute before every re-render with changed dependencies and during unmount.

```javascript
useEffect(() => {
  // 🔴 Avoid: Cleanup logic without corresponding setup logic
  return () => {
    doSomething();
  };
}, []);
```

--------------------------------

### Install ESLint React Hooks Plugin

Source: https://react.dev/blog/2025/10/07/react-compiler-1

Install the eslint-plugin-react-hooks package to enforce React Rules through ESLint linting. This plugin can be used independently without the compiler and helps identify code that violates React conventions.

```bash
npm install --save-dev eslint-plugin-react-hooks@latest
```

```bash
pnpm add --save-dev eslint-plugin-react-hooks@latest
```

```bash
yarn add --dev eslint-plugin-react-hooks@latest
```

--------------------------------

### createRoot - Initialize React Root

Source: https://react.dev/reference/react-dom/client

Creates a root to display React components inside a browser DOM node. This is the primary entry point for rendering React applications on the client side. Must be called at the top level of your app to initialize your React tree.

```APIDOC
## createRoot

### Description
Creates a root to display React components inside a browser DOM node. This API replaces the older ReactDOM.render method and is the recommended way to initialize React applications on the client.

### Method
Function

### Syntax
```javascript
const root = createRoot(domNode, options?)
```

### Parameters
#### Required Parameters
- **domNode** (DOM Element) - Required - A valid DOM element where React components will be rendered

#### Optional Parameters
- **options** (Object) - Optional - Configuration options for the root
  - **onRecoverableError** (Function) - Optional - Callback invoked when React recovers from errors
  - **identifierPrefix** (String) - Optional - Prefix for IDs generated by useId

### Usage Example
```javascript
import { createRoot } from 'react-dom/client';

const container = document.getElementById('root');
const root = createRoot(container);
root.render(<App />);
```

### Return Value
- **root** (Object) - Root object with render and unmount methods
  - **render(reactNode)** - Renders a React component into the root
  - **unmount()** - Removes the rendered React tree from the DOM

### Browser Support
All popular browsers including Internet Explorer 9 and above. Polyfills required for IE 9 and IE 10.
```

--------------------------------

### Expose Custom Ref Handle to Parent Component

Source: https://react.dev/reference/react/useImperativeHandle

Shows how to customize what gets exposed through a ref by using useImperativeHandle to return only specific methods instead of the entire DOM node. This example exposes focus() and scrollIntoView() methods while keeping the underlying input DOM node private and unexposed to parent components.

```javascript
import { useRef, useImperativeHandle } from 'react';

function MyInput({ ref }) {
  const inputRef = useRef(null);

  useImperativeHandle(ref, () => {
    return {
      focus() {
        inputRef.current.focus();
      },
      scrollIntoView() {
        inputRef.current.scrollIntoView();
      },
    };
  }, []);

  return <input ref={inputRef} />;
}
```

--------------------------------

### Build Tic-Tac-Toe Game with React Components and Hooks

Source: https://react.dev/blog/2023/03/16/introducing-react-dev

Complete React application demonstrating functional components, props, state management with useState hook, and game logic. Includes Square, Board, and Game components with winner calculation. The example shows how to manage game history, handle player turns, and enable move navigation through time-travel debugging.

```JavaScript
import { useState } from 'react';

function Square({ value, onSquareClick }) {
  return (
    <button className="square" onClick={onSquareClick}>
      {value}
    </button>
  );
}

function Board({ xIsNext, squares, onPlay }) {
  function handleClick(i) {
    if (calculateWinner(squares) || squares[i]) {
      return;
    }
    const nextSquares = squares.slice();
    if (xIsNext) {
      nextSquares[i] = 'X';
    } else {
      nextSquares[i] = 'O';
    }
    onPlay(nextSquares);
  }

  const winner = calculateWinner(squares);
  let status;
  if (winner) {
    status = 'Winner: ' + winner;
  } else {
    status = 'Next player: ' + (xIsNext ? 'X' : 'O');
  }

  return (
    <>
      <div className="status">{status}</div>
      <div className="board-row">
        <Square value={squares[0]} onSquareClick={() => handleClick(0)} />
        <Square value={squares[1]} onSquareClick={() => handleClick(1)} />
        <Square value={squares[2]} onSquareClick={() => handleClick(2)} />
      </div>
      <div className="board-row">
        <Square value={squares[3]} onSquareClick={() => handleClick(3)} />
        <Square value={squares[4]} onSquareClick={() => handleClick(4)} />
        <Square value={squares[5]} onSquareClick={() => handleClick(5)} />
      </div>
      <div className="board-row">
        <Square value={squares[6]} onSquareClick={() => handleClick(6)} />
        <Square value={squares[7]} onSquareClick={() => handleClick(7)} />
        <Square value={squares[8]} onSquareClick={() => handleClick(8)} />
      </div>
    </>
  );
}

export default function Game() {
  const [history, setHistory] = useState([Array(9).fill(null)]);
  const [currentMove, setCurrentMove] = useState(0);
  const xIsNext = currentMove % 2 === 0;
  const currentSquares = history[currentMove];

  function handlePlay(nextSquares) {
    const nextHistory = [...history.slice(0, currentMove + 1), nextSquares];
    setHistory(nextHistory);
    setCurrentMove(nextHistory.length - 1);
  }

  function jumpTo(nextMove) {
    setCurrentMove(nextMove);
  }

  const moves = history.map((squares, move) => {
    let description;
    if (move > 0) {
      description = 'Go to move #' + move;
    } else {
      description = 'Go to game start';
    }
    return (
      <li key={move}>
        <button onClick={() => jumpTo(move)}>{description}</button>
      </li>
    );
  });

  return (
    <div className="game">
      <div className="game-board">
        <Board xIsNext={xIsNext} squares={currentSquares} onPlay={handlePlay} />
      </div>
      <div className="game-info">
        <ol>{moves}</ol>
      </div>
    </div>
  );
}

function calculateWinner(squares) {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}
```

--------------------------------

### Build a React Blog component using Fragment shorthand for structure

Source: https://react.dev/reference/react/Fragment

A complete React application example showcasing the use of Fragment shorthand (`<></>`) in parent and child components (`Blog`, `Post`, `PostTitle`, `PostBody`) to group elements without introducing unnecessary DOM wrappers.

```javascript
export default function Blog() {
  return (
    <>
      <Post title="An update" body="It's been a while since I posted..." />
      <Post title="My new blog" body="I am starting a new blog!" />
    </>
  )
}

function Post({ title, body }) {
  return (
    <>
      <PostTitle title={title} />
      <PostBody body={body} />
    </>
  );
}

function PostTitle({ title }) {
  return <h1>{title}</h1>
}

function PostBody({ body }) {
  return (
    <article>
      <p>{body}</p>
    </article>
  );
}
```

--------------------------------

### Providing Context for React's `use` API

Source: https://react.dev/reference/react/use

Demonstrates how to set up a context provider (`ThemeContext`) in a parent component (`MyPage`) so that child components, potentially many levels deep, can consume its value using the `use` API. This ensures context is available down the component tree.

```javascript
function MyPage() {
  return (
    <ThemeContext value="dark">
      <Form />
    </ThemeContext>
  );
}

function Form() {
  // ... renders buttons inside ...
}
```

--------------------------------

### Render React App to Pipeable Stream with Shell Ready Callback

Source: https://react.dev/reference/react-dom/server/renderToPipeableStream

Configure renderToPipeableStream with onShellReady callback to start streaming HTML once the shell has been fully rendered. Sets content-type header and pipes the response to the client.

```javascript
const { pipe } = renderToPipeableStream(<App />, {
  bootstrapScripts: ['/main.js'],
  onShellReady() {
    response.setHeader('content-type', 'text/html');
    pipe(response);
  }
});
```

--------------------------------

### preloadModule(href, options)

Source: https://react.dev/reference/react-dom/preloadModule

Lets you eagerly fetch an ESM module that you expect to use, providing a hint to the browser to start downloading it.

```APIDOC
## Function: preloadModule(href, options)

### Description
The `preloadModule` function provides the browser with a hint that it should start downloading the given module, which can save time. It lets you eagerly fetch an ESM module that you expect to use.

### Method
Function Call

### Parameters
#### Arguments
- **`href`** (string) - Required - The URL of the module you want to download.
- **`options`** (object) - Required - An object containing additional properties:
    - **`as`** (string) - Required - Specifies the type of content. It must be `'script'`.
    - **`crossOrigin`** (string) - Optional - The CORS policy to use for the request. Possible values are `anonymous` and `use-credentials`.
    - **`integrity`** (string) - Optional - A cryptographic hash of the module, used to verify its authenticity.
    - **`nonce`** (string) - Optional - A cryptographic nonce, used to allow the module when a strict Content Security Policy is in effect.

### Request Example
```javascript
import { preloadModule } from 'react-dom';

function AppRoot() {
  preloadModule("https://example.com/module.js", {as: "script"});
  // ...
}
```

### Response
#### Return Value
`preloadModule` returns nothing.

#### Caveats
- Multiple calls to `preloadModule` with the same `href` have the same effect as a single call.
- In the browser, you can call `preloadModule` in any situation: while rendering a component, in an Effect, in an event handler, and so on.
- In server-side rendering or when rendering Server Components, `preloadModule` only has an effect if you call it while rendering a component or in an async context originating from rendering a component. Any other calls will be ignored.
```

--------------------------------

### Configure babel-plugin-react-compiler in Babel

Source: https://react.dev/reference/react-compiler/configuration

Basic Babel configuration setup for React Compiler plugin. This is the entry point for integrating the compiler into your build process. The plugin accepts an options object for advanced configuration.

```javascript
// babel.config.js

module.exports = {
  plugins: [
    [
      'babel-plugin-react-compiler', {
        // compiler options
      }
    ]
  ]
};
```

--------------------------------

### preinit(href, options)

Source: https://react.dev/reference/react-dom/preinit

The `preinit` function from `react-dom` allows you to eagerly fetch and evaluate a stylesheet or external script, providing the browser with a hint to start downloading and executing the resource early.

```APIDOC
## preinit(href, options)

### Description
The `preinit` function from `react-dom` provides a hint to the browser to eagerly fetch and evaluate a stylesheet or external script. This can improve loading performance by allowing resources to be downloaded and processed before they are explicitly needed. Scripts are executed upon download completion, while stylesheets are inserted into the document and take immediate effect.

### Method
N/A (Client-side function)

### Endpoint
N/A (Client-side function)

### Parameters
#### Path Parameters
N/A

#### Query Parameters
N/A

#### Request Body
N/A (Parameters are passed directly as function arguments to the function call, not as a distinct HTTP request body.)

### Function Parameters
- **href** (string) - Required - The URL of the resource you want to download and execute.
- **options** (object) - Required - An object containing configuration properties for the resource:
    - **as** (string) - Required - The type of resource. Possible values are `script` and `style`.
    - **precedence** (string) - Required with stylesheets - Specifies where to insert the stylesheet relative to others. Stylesheets with higher precedence can override those with lower precedence. Possible values are `reset`, `low`, `medium`, `high`.
    - **crossOrigin** (string) - Optional - The CORS policy to use. Possible values are `anonymous` and `use-credentials`.
    - **integrity** (string) - Optional - A cryptographic hash of the resource, used to verify its authenticity.
    - **nonce** (string) - Optional - A cryptographic nonce used to allow the resource when a strict Content Security Policy (CSP) is in effect.
    - **fetchPriority** (string) - Optional - Suggests a relative priority for fetching the resource. Possible values are `auto` (the default), `high`, and `low`.

### Request Example
```json
{
  "functionCallExample1": "preinit(\"https://example.com/script.js\", { as: \"script\" });",
  "functionCallExample2": "preinit(\"https://example.com/styles.css\", { as: \"style\", precedence: \"high\" });",
  "functionCallExample3": "preinit(\"https://example.com/secure-script.js\", { as: \"script\", integrity: \"sha256-abc...\", nonce: \"random-nonce\" });"
}
```

### Response
#### Success Response (N/A)
`preinit` returns nothing.

#### Response Example
```json
{
  "result": "void"
}
```

```

--------------------------------

### React Compiler Runtime Import and Memoization Logic

Source: https://react.dev/learn/react-compiler/installation

Demonstrates compiled React code showing automatic memoization added by React Compiler. The compiler imports the _c function from 'react/compiler-runtime' and creates a cache mechanism ($ array) to store computed values. When the cache sentinel is detected, new values are computed and cached; otherwise, cached values are reused.

```javascript
import { c as _c } from "react/compiler-runtime";

export default function MyApp() {
  const $ = _c(1);
  let t0;
  if ($[0] === Symbol.for("react.memo_cache_sentinel")) {
    t0 = <div>Hello World</div>;
    $[0] = t0;
  } else {
    t0 = $[0];
  }
  return t0;
}
```

--------------------------------

### Production Configuration with panicThreshold - JavaScript/React

Source: https://react.dev/reference/react-compiler/panicThreshold

Demonstrates the recommended production configuration using panicThreshold set to 'none'. This ensures builds never fail due to compiler issues and all optimizable components get optimized while components that can't be compiled run normally.

```javascript
{
  panicThreshold: 'none'
}
```

--------------------------------

### Basic usage of React's `use` API

Source: https://react.dev/reference/react/use

Demonstrates the fundamental syntax of the `use` API to read a value from a resource. This snippet shows how `use` is called directly with a resource in a React component.

```javascript
const value = use(resource);
```

--------------------------------

### React Component Composition and Rendering Example (JavaScript)

Source: https://react.dev/learn/render-and-commit

This code illustrates how React processes and renders nested components. The `Gallery` component renders multiple instances of the `Image` component. During the rendering phase, React recursively calls the functions for `Gallery` and `Image` to determine the complete JSX structure, which it then uses to create or update the DOM nodes. This example highlights component composition and the recursive nature of React's rendering.

```javascript
export default function Gallery() {
  return (
    <section>
      <h1>Inspiring Sculptures</h1>
      <Image />
      <Image />
      <Image />
    </section>
  );
}

function Image() {
  return (
    <img
      src="https://i.imgur.com/ZF6s192.jpg"
      alt="'Floralis Genérica' by Eduardo Catalano: a gigantic metallic flower sculpture with reflective petals"
    />
  );
}
```

--------------------------------

### useEffectEvent with useEffect Integration Example

Source: https://react.dev/reference/react/useEffectEvent

Shows a practical example of using useEffectEvent within a ChatRoom component that connects to a server. The Effect Event accesses the latest theme value without including it in the dependency array, preventing unnecessary re-renders when theme changes.

```javascript
import { useEffectEvent, useEffect } from 'react';

function ChatRoom({ roomId, theme }) {
  const onConnected = useEffectEvent(() => {
    showNotification('Connected!', theme);
  });

  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.on('connected', () => {
      onConnected();
    });
    connection.connect();
    return () => connection.disconnect();
  }, [roomId]);

  // ...
}
```

--------------------------------

### Remove Unused React Imports Example

Source: https://react.dev/link/new-jsx-transform

Before and after example showing how unused React imports are removed when no React methods or components are used in the file. The codemod automatically detects and removes the unnecessary import statement.

```javascript
import React from 'react';

function App() {
  return <h1>Hello World</h1>;
}
```

```javascript
function App() {
  return <h1>Hello World</h1>;
}
```

--------------------------------

### Connect Web Application to React DevTools

Source: https://react.dev/learn/react-developer-tools

To enable a web application to connect to the locally running React Developer Tools, add this `<script>` tag to the beginning of your website’s `<head>` section. This script establishes the communication channel required for debugging.

```html
<html>
  <head>
    <script src="http://localhost:8097"></script>
```

--------------------------------

### Fetch Static Content Client-Side with React useEffect

Source: https://react.dev/reference/rsc/server-components

This example shows a traditional React client-side component fetching static data using `useEffect` after initial render. It requires `marked` and `sanitize-html` to be bundled, increasing client load and introducing a delay for content display.

```javascript
// bundle.js  
import marked from 'marked'; // 35.9K (11.2K gzipped)  
import sanitizeHtml from 'sanitize-html'; // 206K (63.3K gzipped)  
  
function Page({page}) {  
  const [content, setContent] = useState('');  
  // NOTE: loads *after* first page render.  
  useEffect(() => {  
    fetch(`/api/content/${page}`).then((data) => {  
      setContent(data.content);  
    });  
  }, [page]);  
  
  return <div>{sanitizeHtml(marked(content))}</div>;  
}
```

--------------------------------

### Example React Counter Component for Testing

Source: https://react.dev/reference/react/act

This code defines a simple React `Counter` component, featuring `useState` for managing a numerical count, `useEffect` to update the document title based on the count, and a button to increment the count. This component serves as the target for subsequent `act` usage examples.

```javascript
function Counter() {  

  const [count, setCount] = useState(0);  

  const handleClick = () => {  

    setCount(prev => prev + 1);  

  }  

  

  useEffect(() => {  

    document.title = `You clicked ${count} times`;  

  }, [count]);  

  

  return (  

    <div>  

      <p>You clicked {count} times</p>  

      <button onClick={handleClick}>  

        Click me  

      </button>  

    </div>  

  )  

}
```

--------------------------------

### Complete React Application with `use` for Context

Source: https://react.dev/reference/react/use

A comprehensive example demonstrating the `use` API for context consumption across multiple nested React components (`MyApp`, `Form`, `Panel`, `Button`). It showcases context provision and conditional context reading within a functional application structure, highlighting `use`'s flexibility.

```javascript
import { createContext, use } from 'react';

const ThemeContext = createContext(null);

export default function MyApp() {
  return (
    <ThemeContext value="dark">
      <Form />
    </ThemeContext>
  )
}

function Form() {
  return (
    <Panel title="Welcome">
      <Button show={true}>Sign up</Button>
      <Button show={false}>Log in</Button>
    </Panel>
  );
}

function Panel({ title, children }) {
  const theme = use(ThemeContext);
  const className = 'panel-' + theme;
  return (
    <section className={className}>
      <h1>{title}</h1>
      {children}
    </section>
  )
}

function Button({ show, children }) {
  if (show) {
    const theme = use(ThemeContext);
    const className = 'button-' + theme;
    return (
      <button className={className}>
        {children}
      </button>
    );
  }
  return false
}
```

--------------------------------

### Asynchronous React Server Component Example

Source: https://react.dev/reference/react/cache

This snippet provides a simple example of an asynchronous React Server Component that directly `await`s data fetched through a memoized function. This pattern is exclusive to Server Components, enabling direct data fetching within the component's render logic.

```jsx
async function AnimatedWeatherCard({city}) {  
	const temperature = await getTemperature(city);  
	// ...  
}
```

--------------------------------

### Install React 18 with npm and yarn

Source: https://react.dev/blog/2022/03/08/react-18-upgrade-guide

Install the latest version of React 18 and React DOM packages using npm or yarn package managers. Both commands are equivalent and will update your project to React 18.

```bash
npm install react react-dom
```

```bash
yarn add react react-dom
```

--------------------------------

### Basic useEffect with Empty Dependencies - React

Source: https://react.dev/learn/separating-events-from-effects

Demonstrates a simple Effect that logs page visits without any dependencies. This basic pattern shows the starting point before adding dynamic props like URL.

```javascript
function Page() {
  useEffect(() => {
    logVisit();
  }, []);
  // ...
}
```

--------------------------------

### Basic `resume` Function Call (JavaScript)

Source: https://react.dev/reference/react-dom/server/resume

Demonstrates the fundamental syntax for calling the `resume` function. It takes a React node, a `postponedState` object, and optional configuration `options` to resume rendering.

```javascript
const stream = await resume(reactNode, postponedState, options?)
```

--------------------------------

### Accessing Context in React Class Components using static contextType

Source: https://react.dev/reference/react/Component

This example demonstrates how to integrate a React Context into a class component by assigning a Context object to the `static contextType` property. This setup enables the component to consume the context value through `this.context`, which is particularly useful for managing themes or shared state across components. The `ThemeContext` must be created beforehand using `React.createContext()`.

```javascript
class Button extends Component {  
  static contextType = ThemeContext;  
  
  render() {  
    const theme = this.context;  
    const className = 'button-' + theme;  
    return (  
      <button className={className}>  
        {this.props.children}  
      </button>  
    );  
  }  
}
```

--------------------------------

### Render React Component with `root.render` and `createRoot`

Source: https://react.dev/reference/react-dom/client/createRoot

Initializes a React root using `createRoot` on a specified DOM element and renders an `<App />` component into it. This snippet demonstrates the basic process of mounting a React application to a DOM element, also noting that the DOM update happens asynchronously.

```javascript
const root = createRoot(document.getElementById('root'));  

root.render(<App />);  

// 🚩 The HTML will not include the rendered <App /> yet:  

console.log(document.body.innerHTML);
```

--------------------------------

### prerender - Web Streams

Source: https://react.dev/reference/react-dom/static

Renders a React tree to static HTML with a Readable Web Stream. Available in browsers, Deno, and modern edge runtimes. Returns a Readable Web Stream containing the static HTML output.

```APIDOC
## prerender

### Description
Renders a React tree to static HTML with a Readable Web Stream.

### Method
Function

### Environment
Web Streams environments (browsers, Deno, modern edge runtimes)

### Parameters
#### Input Parameters
- **component** (React.ReactNode) - Required - The React component tree to render
- **options** (object) - Optional - Configuration options for rendering

### Returns
- **ReadableStream** - A Readable Web Stream containing the static HTML

### Usage Example
```javascript
import { prerender } from 'react-dom/static';

const stream = await prerender(<App />);
for await (const chunk of stream) {
  console.log(chunk);
}
```

### Notes
- Limited functionality compared to streaming APIs
- Primary use case is for frameworks to call during build time
- Most components do not need to directly import or use this API
```

--------------------------------

### Displaying Create React App Deprecation Warning in Console

Source: https://react.dev/blog/2025/02/14/sunsetting-create-react-app

This console message is shown when installing a new application after Create React App has been deprecated. It informs users about the deprecation, directs them to react.dev for updated React frameworks, and indicates that the message will only appear once per installation.

```console
create-react-app is deprecated. You can find a list of up-to-date React frameworks on react.dev For more info see: react.dev/link/cra This error message will only be shown once per install.
```

--------------------------------

### Troubleshooting: Second Argument Error

Source: https://react.dev/link/hydration-mismatch

Common error when passing options to root.render() instead of hydrateRoot(). This guide explains the error, its cause, and the correct solution.

```APIDOC
## Troubleshooting: "You passed a second argument to root.render"

### Problem Description
When attempting to pass configuration options to root.render(), React displays a warning:
```
Warning: You passed a second argument to root.render(…) but it only accepts one argument.
```

### Root Cause
The root.render() method only accepts a single argument (the React node to render). Configuration options must be passed to hydrateRoot() during initialization, not to root.render() during updates.

### Incorrect Pattern
```javascript
// ❌ WRONG: Passing options to root.render()
const root = hydrateRoot(container, <App />);
root.render(App, {onUncaughtError});
```

### Correct Pattern
```javascript
// ✅ CORRECT: Pass options to hydrateRoot()
const root = hydrateRoot(container, <App />, {onUncaughtError});

// Later updates use only the component
root.render(<App newProp={value} />);
```

### Key Differences
- **hydrateRoot(domNode, reactNode, options?)** - Accepts 3 parameters including options
- **root.render(reactNode)** - Accepts only 1 parameter (the React node)

### Available Options for hydrateRoot
- **onUncaughtError** - Error handler for uncaught errors
- **onRecoverableError** - Error handler for recoverable errors
- **identifierPrefix** - Prefix for useId hook identifiers

### Resolution Steps
1. Identify where options are being passed to root.render()
2. Move those options to the hydrateRoot() call
3. Use root.render() only for updating the component with new props/state
```

--------------------------------

### Triggering Initial React Render with createRoot (JavaScript)

Source: https://react.dev/learn/render-and-commit

This snippet demonstrates how to perform the initial render of a React application. It uses the `createRoot` API from `react-dom/client` to establish a root for the React tree on a specified DOM element (typically 'root'), and then calls `root.render()` to render the top-level component into that root. This is the essential bootstrapping step for any React app.

```javascript
import Image from './Image.js';
import { createRoot } from 'react-dom/client';

const root = createRoot(document.getElementById('root'))
root.render(<Image />);
```

--------------------------------

### preconnect - Preconnecting When Rendering

Source: https://react.dev/reference/react-dom/preconnect

Example of calling preconnect during component rendering when you know that child components will load external resources from a specific host.

```APIDOC
## Preconnecting When Rendering

### Description
Call `preconnect` when rendering a component if you know that its children will load external resources from that host.

### Use Case
Use this pattern when component initialization requires resources from an external server that will be needed during the component's lifecycle.

### Code Example
```javascript
import { preconnect } from 'react-dom';

function AppRoot() {
  preconnect("https://example.com");
  return (
    // Component JSX
  );
}
```

### Benefits
- Establishes server connection early in the component lifecycle
- Ensures connection is ready when child components need external resources
- Automatically handles multiple calls to the same server (treated as single call)
```

--------------------------------

### Import Mixed Default and Named Exports in App.js

Source: https://react.dev/learn/importing-and-exporting-components

Complete example showing how to import both a default export (Gallery) and a named export (Profile) from the same file. The App component uses both imports to render multiple components.

```javascript
import Gallery from './Gallery.js';
import { Profile } from './Gallery.js';

export default function App() {
  return (
    <Profile />
  );
}
```

--------------------------------

### Render Dynamic List Items with Keys (JSX)

Source: https://react.dev/learn/tutorial-tic-tac-toe

These JSX snippets illustrate the importance of the `key` prop when rendering dynamic lists in React. The first two examples show how a list might change, highlighting the ambiguity for React without explicit keys. The third example demonstrates the correct usage of the `key` prop, typically using a unique identifier like `user.id`, to help React efficiently identify, reorder, and update list items while preserving component state.

```jsx
<li>Alexa: 7 tasks left</li>
<li>Ben: 5 tasks left</li>
```

```jsx
<li>Ben: 9 tasks left</li>
<li>Claudia: 8 tasks left</li>
<li>Alexa: 5 tasks left</li>
```

```jsx
<li key={user.id}>
  {user.name}: {user.taskCount} tasks left
</li>
```

--------------------------------

### Invalid React Compiler Configuration Examples

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/config

Examples demonstrating incorrect React Compiler configurations with typos in option names and invalid option values. These configurations will trigger the config lint rule and should be corrected to prevent unexpected behavior.

```javascript
// ❌ Unknown option name
module.exports = {
  plugins: [
    ['babel-plugin-react-compiler', {
      compileMode: 'all' // Typo: should be compilationMode
    }]
  ]
};

// ❌ Invalid option value
module.exports = {
  plugins: [
    ['babel-plugin-react-compiler', {
      compilationMode: 'everything' // Invalid: use 'all' or 'infer'
    }]
  ]
};
```

--------------------------------

### useReducer Hook with TypeScript - React Counter Example

Source: https://react.dev/learn/typescript

Complete counter example using useReducer with full TypeScript typing. Includes interface for state shape, discriminated union type for actions, and properly typed reducer function. Demonstrates best practice of setting type on initialState rather than as a generic argument.

```TypeScript
import {useReducer} from 'react';

interface State {
   count: number
};

type CounterAction =
  | { type: "reset" }
  | { type: "setCount"; value: State["count"] }

const initialState: State = { count: 0 };

function stateReducer(state: State, action: CounterAction): State {
  switch (action.type) {
    case "reset":
      return initialState;
    case "setCount":
      return { ...state, count: action.value };
    default:
      throw new Error("Unknown action");
  }
}

export default function App() {
  const [state, dispatch] = useReducer(stateReducer, initialState);

  const addFive = () => dispatch({ type: "setCount", value: state.count + 5 });
  const reset = () => dispatch({ type: "reset" });

  return (
    <div>
      <h1>Welcome to my counter</h1>
      <p>Count: {state.count}</p>
      <button onClick={addFive}>Add 5</button>
      <button onClick={reset}>Reset</button>
    </div>
  );
}
```

--------------------------------

### React App Component Composition with Nested Components

Source: https://react.dev/learn/understanding-your-ui-as-a-tree

Demonstrates a React app structure with multiple nested components including FancyText, InspirationGenerator, and Copyright. Shows how parent components can contain child components and how to pass props (like year={2004}) to child components. This example renders an inspirational quotes application.

```jsx
import FancyText from './FancyText';
import InspirationGenerator from './InspirationGenerator';
import Copyright from './Copyright';

export default function App() {
  return (
    <>
      <FancyText title text="Get Inspired App" />
      <InspirationGenerator>
        <Copyright year={2004} />
      </InspirationGenerator>
    </>
  );
}
```

--------------------------------

### React: Incorrect Hook Usage Examples

Source: https://react.dev/reference/rules/rules-of-hooks

This collection of examples illustrates common mistakes when using React Hooks, such as calling `useContext`, `useState`, or `useEffect` inside conditional statements, loops, event handlers, `useMemo`, class components, or `try`/`catch` blocks. These practices violate the Rules of Hooks and can lead to unexpected behavior or errors.

```javascript
function Bad({ cond }) {  
  if (cond) {  
    // 🔴 Bad: inside a condition (to fix, move it outside!)  
    const theme = useContext(ThemeContext);  
  }  
  // ...  
}  
  
function Bad() {  
  for (let i = 0; i < 10; i++) {  
    // 🔴 Bad: inside a loop (to fix, move it outside!)  
    const theme = useContext(ThemeContext);  
  }  
  // ...  
}  
  
function Bad({ cond }) {  
  if (cond) {  
    return;  
  }  
  // 🔴 Bad: after a conditional return (to fix, move it before the return!)  
  const theme = useContext(ThemeContext);  
  // ...  
}  
  
function Bad() {  
  function handleClick() {  
    // 🔴 Bad: inside an event handler (to fix, move it outside!)  
    const theme = useContext(ThemeContext);  
  }  
  // ...  
}  
  
function Bad() {  
  const style = useMemo(() => {  
    // 🔴 Bad: inside useMemo (to fix, move it outside!)  
    const theme = useContext(ThemeContext);  
    return createStyle(theme);  
  });  
  // ...  
}  
  
class Bad extends React.Component {  
  render() {  
    // 🔴 Bad: inside a class component (to fix, write a function component instead of a class!)  
    useEffect(() => {})  
    // ...  
  }  
}  
  
function Bad() {  
  try {  
    // 🔴 Bad: inside try/catch/finally block (to fix, move it outside!)  
    const [x, setX] = useState(0);  
  } catch {  
    const [x, setX] = useState(1);  
  }  
}
```

--------------------------------

### Correct React memoization with complete dependencies or compiler optimization

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/preserve-manual-memoization

This example showcases two approaches for correct memoization in React. The first ensures all dependencies are explicitly included in `useMemo`. The second demonstrates removing manual memoization entirely, allowing the React Compiler to handle optimizations automatically.

```javascript
// ✅ Complete dependencies  
function Component({ data, filter }) {  
  const filtered = useMemo(  
    () => data.filter(filter),  
    [data, filter] // All dependencies included  
  );  
  
  return <List items={filtered} />;  
}  
  
// ✅ Or let the compiler handle it  
function Component({ data, filter }) {  
  // No manual memoization needed  
  const filtered = data.filter(filter);  
  return <List items={filtered} />;  
}
```

--------------------------------

### Render HTML input with a name attribute

Source: https://react.dev/reference/react-dom/components/input

This example shows how to render an HTML <input> element with a 'name' attribute. The 'name' attribute is crucial for identifying the input's value when a form is submitted.

```html
<input name="myInput" />
```

--------------------------------

### Implement React TaskList and Task Components with Context Hooks

Source: https://react.dev/learn/scaling-up-with-reducer-and-context

Demonstrates the `TaskList` and nested `Task` components consuming the shared task state and dispatch function using the custom `useTasks` and `useTasksDispatch` hooks. This example showcases how to read, update, and delete tasks, centralizing state logic in `TasksContext.js`.

```javascript
import { useState } from 'react';
import { useTasks, useTasksDispatch } from './TasksContext.js';

export default function TaskList() {
  const tasks = useTasks();
  return (
    <ul>
      {tasks.map(task => (
        <li key={task.id}>
          <Task task={task} />
        </li>
      ))}
    </ul>
  );
}

function Task({ task }) {
  const [isEditing, setIsEditing] = useState(false);
  const dispatch = useTasksDispatch();
  let taskContent;
  if (isEditing) {
    taskContent = (
      <>
        <input
          value={task.text}
          onChange={e => {
            dispatch({
              type: 'changed',
              task: {
                ...task,
                text: e.target.value
              }
            });
          }} />
        <button onClick={() => setIsEditing(false)}>
          Save
        </button>
      </>
    );
  } else {
    taskContent = (
      <>
        {task.text}
        <button onClick={() => setIsEditing(true)}>
          Edit
        </button>
      </>
    );
  }
  return (
    <label>
      <input
        type="checkbox"
        checked={task.done}
        onChange={e => {
          dispatch({
            type: 'changed',
            task: {
              ...task,
              done: e.target.checked
            }
          });
        }}
      />
      {taskContent}
      <button onClick={() => {
        dispatch({
          type: 'deleted',
          id: task.id
        });
      }}>
        Delete
      </button>
    </label>
  );
}
```

--------------------------------

### Create Game Component with Board Rendering

Source: https://react.dev/learn/tutorial-tic-tac-toe

Establishes the top-level Game component that renders the Board component and game information container. The export default keywords are moved from Board to Game, making Game the entry point component. This structure provides layout for displaying game board and move history.

```javascript
function Board() {
  // ...
}

export default function Game() {
  return (
    <div className="game">
      <div className="game-board">
        <Board />
      </div>
      <div className="game-info">
        <ol>{/*TODO*/}</ol>
      </div>
    </div>
  );
}
```

--------------------------------

### Preloading in Event Handlers

Source: https://react.dev/reference/react-dom/preinitModule

Call preinitModule in an event handler before transitioning to a page or state where the module will be needed. This starts the process earlier than calling it during rendering of the new page.

```APIDOC
## Usage: Preloading in an event handler

### Description
Call `preinitModule` in an event handler before transitioning to a page or state where the module will be needed. This gets the loading process started earlier than waiting for the new page to render.

### Use Case
Optimal for anticipatory loading when user actions will trigger navigation or state changes that require specific modules.

### Code Example
```javascript
import { preinitModule } from 'react-dom';

function CallToAction() {
  const onClick = () => {
    preinitModule("https://example.com/module.js", {as: "script"});
    startWizard();
  }
  return (
    <button onClick={onClick}>Start Wizard</button>
  );
}
```

### Performance Benefit
By calling `preinitModule` in the event handler before state changes or navigation, the module begins downloading earlier, reducing perceived latency when the new page or state renders.
```

--------------------------------

### Mocking React Component States (Initial)

Source: https://react.dev/learn/reacting-to-input-with-state

This React component demonstrates how to mock different visual states using a `status` prop. It displays a simple form or a success message based on the prop's value, initially set to 'empty', for rapid UI iteration before implementing complex logic.

```javascript
export default function Form({
  status = 'empty'
}) {
  if (status === 'success') {
    return <h1>That's right!</h1>
  }
  return (
    <>
      <h2>City quiz</h2>
      <p>
        In which city is there a billboard that turns air into drinkable water?
      </p>
      <form>
        <textarea />
        <br />
        <button>
          Submit
        </button>
      </form>
    </>
  )
}
```

--------------------------------

### preconnect - Preconnecting in Event Handlers

Source: https://react.dev/reference/react-dom/preconnect

Example of calling preconnect within an event handler to establish connection before transitioning to a new page or state that requires external resources.

```APIDOC
## Preconnecting in an Event Handler

### Description
Call `preconnect` in an event handler before transitioning to a page or state where external resources will be needed. This starts the connection process earlier than if called during rendering of the new page or state.

### Use Case
Use this pattern when user interactions (like button clicks) will navigate to or load content that requires resources from an external server.

### Code Example
```javascript
import { preconnect } from 'react-dom';

function CallToAction() {
  const onClick = () => {
    preconnect('http://example.com');
    startWizard();
  }
  return (
    <button onClick={onClick}>Start Wizard</button>
  );
}
```

### Benefits
- Preemptively establishes connection before state transition
- Reduces latency when external resources are actually needed
- Improves perceived performance by establishing connection ahead of time
```

--------------------------------

### React App with MoreRows Component Example

Source: https://react.dev/reference/react/Children

Demonstrates how the children prop receives JSX elements but does not include the rendered output of nested components. In this example, RowList receives only two items (a p element and MoreRows component) even though MoreRows renders two additional p elements.

```javascript
import RowList from './RowList.js';

export default function App() {
  return (
    <RowList>
      <p>This is the first item.</p>
      <MoreRows />
    </RowList>
  );
}

function MoreRows() {
  return (
    <>
      <p>This is the second item.</p>
      <p>This is the third item.</p>
    </>
  );
}
```

--------------------------------

### Initialize Global Application Logic Outside React Components

Source: https://react.dev/learn/synchronizing-with-effects

This JavaScript code demonstrates how to execute global application initialization logic once when the browser loads the page, rather than within a React component's `useEffect`. It includes checks for browser environment (`typeof window !== 'undefined'`) and performs tasks like authentication token checks and loading data from local storage.

```javascript
if (typeof window !== 'undefined') { // Check if we're running in the browser.  

  checkAuthToken();  

  loadDataFromLocalStorage();  

}  

  

function App() {  

  // ...  

}
```

--------------------------------

### Rendering React app to static HTML stream with prerenderToNodeStream in Node.js

Source: https://react.dev/reference/react-dom/static/prerenderToNodeStream

This example illustrates how to integrate `prerenderToNodeStream` into a Node.js backend framework (like Express) to serve a React application as static HTML. It imports the function, renders a React component, and pipes the resulting HTML stream (`prelude`) to the HTTP response, setting a `bootstrapScripts` option.

```javascript
import { prerenderToNodeStream } from 'react-dom/static';  

// The route handler syntax depends on your backend framework  
app.use('/', async (request, response) => {  
  const { prelude } = await prerenderToNodeStream(<App />, {  
    bootstrapScripts: ['/main.js'],  
  });  

  response.setHeader('Content-Type', 'text/plain');  
  prelude.pipe(response);  
});
```

--------------------------------

### Illustrative Server-Generated HTML Output (HTML)

Source: https://react.dev/reference/react-dom/static/prerender

This demonstrates a simplified example of the HTML stream generated by `prerender`. It includes the `<!DOCTYPE html>` declaration and shows how `bootstrapScripts` are automatically injected by React at the end of the document, after the content from your components.

```html
<!DOCTYPE html>  
<html>  
  <!-- ... HTML from your components ... -->  
</html>  
<script src="/main.js" async=""></script>
```

--------------------------------

### Importing and defining a `forwardRef` component in React

Source: https://react.dev/reference/react/forwardRef

This example shows how to import `forwardRef` from React and define a functional component (`MyInput`) that accepts `props` and `ref` as arguments, enabling ref forwarding.

```javascript
import { forwardRef } from 'react';

const MyInput = forwardRef(function MyInput(props, ref) {
  // ...
});
```

--------------------------------

### Example of nested React components consuming context without provision

Source: https://react.dev/learn/passing-data-deeply-with-context

This comprehensive `App.js` example showcases a deeply nested component structure using `Section` and `Heading` components. It illustrates how `Section` components receive a `level` prop and pass it down, while `Heading` components are configured to consume `LevelContext`. The provided JSX highlights a common issue: without a `Context.Provider` wrapping the components, `useContext` will return the default value (e.g., `1`), leading to uniform heading sizes.

```jsx
import Heading from './Heading.js';
import Section from './Section.js';

export default function Page() {
  return (
    <Section level={1}>
      <Heading>Title</Heading>
      <Section level={2}>
        <Heading>Heading</Heading>
        <Heading>Heading</Heading>
        <Heading>Heading</Heading>
        <Section level={3}>
          <Heading>Sub-heading</Heading>
          <Heading>Sub-heading</Heading>
          <Heading>Sub-heading</Heading>
          <Section level={4}>
            <Heading>Sub-sub-heading</Heading>
            <Heading>Sub-sub-heading</Heading>
            <Heading>Sub-sub-heading</Heading>
          </Section>
        </Section>
      </Section>
    </Section>
  );
}
```

--------------------------------

### Expand Babel Overrides Coverage for Multiple Directories

Source: https://react.dev/learn/react-compiler/incremental-adoption

Extend Babel configuration to apply React Compiler to multiple directories while keeping legacy code unchanged. This example shows how to gradually expand compiler coverage to additional directories like './src/features' while maintaining separate plugin configurations for legacy code.

```javascript
// babel.config.js

module.exports = {
  plugins: [
    // Global plugins
  ],
  overrides: [
    {
      test: ['./src/modern/**/*.{js,jsx,ts,tsx}', './src/features/**/*.{js,jsx,ts,tsx}'],
      plugins: [
        'babel-plugin-react-compiler'
      ]
    },
    {
      test: './src/legacy/**/*.{js,jsx,ts,tsx}',
      plugins: [
        // Different plugins for legacy code
      ]
    }
  ]
};
```

--------------------------------

### React 17/18 Compiled Output with Polyfill Runtime

Source: https://react.dev/reference/react-compiler/target

Example of compiled output for React 17 and 18 using the polyfill react-compiler-runtime package. This demonstrates the import path for the standalone runtime package.

```javascript
// Compiled output uses the polyfill
import { c as _c } from 'react-compiler-runtime';
```

--------------------------------

### Handle Multiple Form Submission Types in React with formAction

Source: https://react.dev/reference/react-dom/components/form

This example shows how to manage different submission actions within a single HTML form in React based on which button the user clicks. Each button can have a `formAction` prop set to a distinct function, allowing the form to execute different server functions (or client-side functions in this example) without separate forms.

```jsx
export default function Search() {
  function publish(formData) {
    const content = formData.get("content");
    const button = formData.get("button");
    alert(`'${content}' was published with the '${button}' button`);
  }

  function save(formData) {
    const content = formData.get("content");
    alert(`Your draft of '${content}' has been saved!`);
  }

  return (
    <form action={publish}>
      <textarea name="content" rows={4} cols={40} />
      <br />
      <button type="submit" name="button" value="submit">Publish</button>
      <button formAction={save}>Save draft</button>
    </form>
  );
}
```

--------------------------------

### XSS Vulnerability Example with Untrusted HTML in React

Source: https://react.dev/reference/react-dom/components/common

Illustrates a security vulnerability when passing untrusted content to dangerouslySetInnerHTML. The example shows how malicious code embedded in HTML (like onerror event handlers) can execute and compromise user data. This demonstrates why dangerouslySetInnerHTML should only be used with sanitized, trusted data.

```JavaScript
const post = {
  // Imagine this content is stored in the database.
  content: `<img src="" onerror='alert("you were hacked")'>`
};

export default function MarkdownPreview() {
  // 🔴 SECURITY HOLE: passing untrusted input to dangerouslySetInnerHTML
  const markup = { __html: post.content };
  return <div dangerouslySetInnerHTML={markup} />;
}
```

--------------------------------

### Configure Target Matching React Version

Source: https://react.dev/reference/react-compiler/target

Ensure the target configuration matches your installed React major version. Mismatches between target and React version cause runtime errors.

```javascript
{
  target: '18' // Must match your React major version
}
```

--------------------------------

### Correct Function Invocation for React Component Factory

Source: https://react.dev/reference/react-dom/client/createRoot

Shows proper handling when using factory functions that return components. Demonstrates the difference between passing a function reference versus calling the function to get the component result. The correct approach calls the factory function to return a component.

```javascript
// 🚩 Wrong: createApp is a function, not a component.

root.render(createApp);


// ✅ Correct: call createApp to return a component.

root.render(createApp());
```

--------------------------------

### Resume and Pre-render Static HTML for SSG with `resumeAndPrerender` in React DOM

Source: https://react.dev/blog/2025/10/01/react-19-2

The `resumeAndPrerender` API combines the concepts of resuming and pre-rendering, specifically designed for Static Site Generation (SSG) workflows. It takes a React application element and a `postponed` state, and returns a complete HTML `prelude` suitable for deployment to a CDN, effectively completing the rendering process statically.

```javascript
const postponedState = await getPostponedState(request);
const { prelude } = await resumeAndPrerender(<App />, postponedState);

// Send complete HTML prelude to CDN.
```

--------------------------------

### React useEffect Function Dependency Issue Example

Source: https://react.dev/learn/removing-effect-dependencies

This example shows a parent component passing a function ('getOptions') as a prop to 'ChatRoom'. If this function were directly used as a useEffect dependency, it would trigger re-runs every time the function's reference changed, even if its logical output remained the same, leading to unnecessary re-synchronization.

```javascript
<ChatRoom  

  roomId={roomId}  

  getOptions={() => {  

    return {  

      serverUrl: serverUrl,  

      roomId: roomId  

    };  

  }}  

/>
```

--------------------------------

### Render React Tree to HTML Stream with `prerender` (Node.js/React)

Source: https://react.dev/reference/react-dom/static/prerender

This example demonstrates how to use `react-dom/static`'s `prerender` function to render a React root component into a static HTML stream. It includes setting `bootstrapScripts` for client-side hydration and returning the stream as a `Response` with the appropriate content-type header.

```javascript
import { prerender } from 'react-dom/static';  
  
async function handler(request) {  
  const {prelude} = await prerender(<App />, {  
    bootstrapScripts: ['/main.js']  
  });  
  return new Response(prelude, {  
    headers: { 'content-type': 'text/html' },  
  });  
}
```

--------------------------------

### Update Babel @babel/preset-react package

Source: https://react.dev/link/new-jsx-transform

Updates the Babel core and the `@babel/preset-react` package to ensure compatibility with the new JSX transform. This is required for manual Babel setups using this specific preset.

```bash
npm update @babel/core @babel/preset-react
```

```bash
yarn upgrade @babel/core @babel/preset-react
```

--------------------------------

### Basic Usage of resumeAndPrerenderToNodeStream

Source: https://react.dev/reference/react-dom/static/resumeAndPrerenderToNodeStream

This snippet demonstrates the basic asynchronous call to `resumeAndPrerenderToNodeStream`. It takes a React node, a `postponedState` object, and optional `options`, returning an object containing `prelude` (a Web Stream of HTML) and `postponed` (an opaque object for further resumption) for continued processing.

```javascript
const {prelude, postponed} = await resumeAndPrerenderToNodeStream(reactNode, postponedState, options?)
```

--------------------------------

### Render React JSX into document body with createPortal

Source: https://react.dev/reference/react-dom/createPortal

This example demonstrates how to import and utilize `createPortal` from `react-dom` to render a React paragraph element (`<p>`) into a different part of the DOM, specifically the `document.body`. It shows how to pass the JSX to be rendered and the target DOM node.

```jsx
import { createPortal } from 'react-dom';

// ...

<div>
  <p>This child is placed in the parent div.</p>
  {createPortal(
    <p>This child is placed in the document body.</p>,
    document.body
  )}
</div>
```

--------------------------------

### Migrate unmountComponentAtNode to root.unmount

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Replace ReactDOM.unmountComponentAtNode with the root.unmount() method from createRoot or hydrateRoot. This provides a cleaner API for unmounting React applications from the DOM.

```JavaScript
// Before
unmountComponentAtNode(document.getElementById('root'));

// After
root.unmount();
```

```Bash
npx codemod@latest react/19/replace-reactdom-render
```

--------------------------------

### Configure Target for React 17

Source: https://react.dev/reference/react-compiler/target

Set target to '17' for React 17 projects. Requires react-compiler-runtime package to be installed as a runtime dependency.

```javascript
// For React 17
{
  target: '17'
}
```

--------------------------------

### React useEffect Object Dependency Issue Example

Source: https://react.dev/learn/removing-effect-dependencies

This example illustrates a common anti-pattern in React useEffect where an object ('options') passed directly as a prop is used as a dependency. When the parent component re-renders, a new 'options' object reference is created, even if its internal values are identical, causing the useEffect to re-run and unnecessarily re-establish the connection.

```javascript
function ChatRoom({ options }) {  

  const [message, setMessage] = useState('');  

  

  useEffect(() => {  

    const connection = createConnection(options);  

    connection.connect();  

    return () => connection.disconnect();  

  }, [options]); // ✅ All dependencies declared  

  // ...
```

```javascript
<ChatRoom  

  roomId={roomId}  

  options={{  

    serverUrl: serverUrl,  

    roomId: roomId  

  }}  

/>
```

--------------------------------

### Render Multiple Square Components in Board

Source: https://react.dev/learn/tutorial-tic-tac-toe

Updates the Board component to render nine Square components organized in three rows using JSX syntax. This demonstrates component composition and the requirement that custom components start with capital letters.

```JavaScript
export default function Board() {
  return (
    <>
      <div className="board-row">
        <Square />
        <Square />
        <Square />
      </div>
      <div className="board-row">
        <Square />
        <Square />
        <Square />
      </div>
      <div className="board-row">
        <Square />
        <Square />
        <Square />
      </div>
    </>
  );
}
```

--------------------------------

### Compiler Output with Gating

Source: https://react.dev/reference/react-compiler/gating

Example of how the compiler generates gated code, importing the feature flag function and conditionally using either the optimized or original function version based on the flag evaluation.

```javascript
// Input
function Button(props) {
  return <button>{props.label}</button>;
}

// Output (simplified)
import { shouldUseCompiler } from './src/utils/feature-flags';

const Button = shouldUseCompiler()
  ? function Button_optimized(props) { /* compiled version */ }
  : function Button_original(props) { /* original version */ };
```

--------------------------------

### Eagerly Fetch and Evaluate an ESM Module (JavaScript)

Source: https://react.dev/reference/react-dom/preinitModule

This snippet demonstrates the basic, standalone usage of `preinitModule` to eagerly fetch and evaluate an ECMAScript Module (ESM) from a given URL. The `as: "script"` option is required, indicating the resource type. This call initiates the download and immediate execution of the module.

```javascript
preinitModule("https://example.com/module.js", {as: "script"});
```

--------------------------------

### Refactor React component to consume Context using useContext instead of props

Source: https://react.dev/learn/passing-data-deeply-with-context

These snippets illustrate the transformation of a React `Heading` component from receiving `level` as a prop to consuming it from `LevelContext` using the `useContext` Hook. The first example shows the original component signature with the `level` prop. The second example removes the `level` prop and retrieves the value directly from `LevelContext`, emphasizing that `useContext` must be called directly within the component function.

```javascript
export default function Heading({ level, children }) {  

  // ...  

}
```

```javascript
export default function Heading({ children }) {  

  const level = useContext(LevelContext);  

  // ...  

}
```

--------------------------------

### Corrected React Compiler Configuration Best Practices

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/config

Best practice example showing proper React Compiler configuration with documented options and valid values. Includes comments explaining valid option choices for compilationMode and panicThreshold.

```javascript
// ✅ Better: Valid configuration
module.exports = {
  plugins: [
    ['babel-plugin-react-compiler', {
      compilationMode: 'all', // or 'infer'
      panicThreshold: 'none', // or 'critical_errors', 'all_errors'
      // Only use documented options
    }]
  ]
};
```

--------------------------------

### Load Asynchronous External Script with Callback in React

Source: https://react.dev/reference/react-dom/components/script

This example illustrates loading an external JavaScript file asynchronously using the `async` prop and executing a callback function (`onLoad`) once the script has finished loading. This pattern is useful for components that depend on an external script to fully render or function.

```jsx
import ShowRenderedHTML from './ShowRenderedHTML.js';

function Map({lat, long}) {
  return (
    <>
      <script async src="map-api.js" onLoad={() => console.log('script loaded')} />
      <div id="map" data-lat={lat} data-long={long} />
    </>
  );
}

export default function Page() {
  return (
    <ShowRenderedHTML>
      <Map />
    </ShowRenderedHTML>
  );
}
```

--------------------------------

### Load React 19 with ESM CDN using script tag

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Demonstrates loading React 19 and ReactDOM from an ESM-based CDN (esm.sh) using a module script tag instead of the deprecated UMD builds. This replaces the need for a build step when loading React as a script.

```html
<script type="module">
  import React from "https://esm.sh/react@19/?dev"
  import ReactDOMClient from "https://esm.sh/react-dom@19/client?dev"
  ...
</script>
```

--------------------------------

### Optimize React SSR for Crawlers and Static Generation with onAllReady

Source: https://react.dev/reference/react-dom/server/renderToPipeableStream

This example illustrates how to use the `onAllReady` callback with `renderToPipeableStream` to ensure all content is fully loaded before sending the HTML response. This is particularly useful for web crawlers or static site generation, where a complete page is preferred over a streamed, progressive render. It conditionally pipes the response based on whether the client is a regular visitor or a crawler, allowing for different rendering strategies.

```javascript
let didError = false;  
let isCrawler = // ... depends on your bot detection strategy ...  
  
const { pipe } = renderToPipeableStream(<App />, {  
  bootstrapScripts: ['/main.js'],  
  onShellReady() {  
    if (!isCrawler) {  
      response.statusCode = didError ? 500 : 200;  
      response.setHeader('content-type', 'text/html');  
      pipe(response);  
    }  
  },  
  onShellError(error) {  
    response.statusCode = 500;  
    response.setHeader('content-type', 'text/html');  
    response.send('<h1>Something went wrong</h1>');   
  },  
  onAllReady() {  
    if (isCrawler) {  
      response.statusCode = didError ? 500 : 200;  
      response.setHeader('content-type', 'text/html');  
      pipe(response);        
    }  
  },  
  onError(error) {  
    didError = true;  
    console.error(error);  
    logServerCrashReport(error);  
  }
});
```

--------------------------------

### Incorrect React manual memoization with missing dependencies

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/preserve-manual-memoization

This example demonstrates invalid usage of React's `useMemo` and `useCallback` hooks. Missing dependencies in their respective dependency arrays prevent the React Compiler from fully understanding data flow, potentially hindering further optimizations.

```javascript
// ❌ Missing dependencies in useMemo  
function Component({ data, filter }) {  
  const filtered = useMemo(  
    () => data.filter(filter),  
    [data] // Missing 'filter' dependency  
  );  
  
  return <List items={filtered} />;  
}  
  
// ❌ Missing dependencies in useCallback  
function Component({ onUpdate, value }) {  
  const handleClick = useCallback(() => {  
    onUpdate(value);  
  }, [onUpdate]); // Missing 'value'  
  
  return <button onClick={handleClick}>Update</button>;  
}
```

--------------------------------

### React Compiler: React 17/18 Configuration

Source: https://react.dev/reference/react-compiler/configuration

Details the necessary steps and configuration, including runtime package installation and `target` option, for integrating React Compiler with older React versions (17 or 18).

```APIDOC
## Common Configuration Pattern: React 17/18 Projects

### Description
Older React versions (17 and 18) require special consideration, including the installation of the `react-compiler-runtime` package and explicit `target` configuration, to ensure proper functioning of the React Compiler.

### Method
Babel Plugin Configuration & Package Installation

### Endpoint
`babel.config.js` `babel-plugin-react-compiler` options object

### Parameters
#### Request Body
- **target** (string) - Required - Specifies the React version.
  - **'17'**: For React 17 projects.
  - **'18'**: For React 18 projects.

### Request Example
```bash
npm install react-compiler-runtime@latest
```

```json
{
  "target": "18" // or '17'
}
```

### Response
#### Success Response (N/A)
Compiler is configured for the specified older React version, with runtime support.

#### Response Example
N/A
```

--------------------------------

### Configure Target for React 18

Source: https://react.dev/reference/react-compiler/target

Set target to '18' for React 18 projects. Requires react-compiler-runtime package to be installed as a runtime dependency.

```javascript
// For React 18
{
  target: '18'
}
```

--------------------------------

### Update Babel @babel/plugin-transform-react-jsx package

Source: https://react.dev/link/new-jsx-transform

Updates the Babel core and the `@babel/plugin-transform-react-jsx` package to ensure compatibility with the new JSX transform. This is required for manual Babel setups using this specific plugin.

```bash
npm update @babel/core @babel/plugin-transform-react-jsx
```

```bash
yarn upgrade @babel/core @babel/plugin-transform-react-jsx
```

--------------------------------

### Troubleshooting: Component Not Compiled in Infer Mode

Source: https://react.dev/reference/react-compiler/compilationMode

Diagnostic guide for troubleshooting why components aren't being compiled in 'infer' mode. Learn about naming conventions and React patterns required for automatic detection.

```APIDOC
## Troubleshooting: Component Not Being Compiled in Infer Mode

### Common Issues and Solutions

#### Issue 1: Lowercase Component Name

**Problem - Won't Compile**
```javascript
// ❌ Won't be compiled: lowercase name
function button(props) {
  return <button>{props.label}</button>;
}
```

**Solution - Use PascalCase**
```javascript
// ✅ Will be compiled: PascalCase name
function Button(props) {
  return <button>{props.label}</button>;
}
```

**Why**: React convention requires component names to start with uppercase letters to distinguish them from HTML elements.

#### Issue 2: No JSX or Hook Calls

**Problem - Won't Compile**
```javascript
// ❌ Won't be compiled: doesn't create JSX or call hooks
function useData() {
  return window.localStorage.getItem('data');
}
```

**Solution - Call React Hooks**
```javascript
// ✅ Will be compiled: calls a hook
function useData() {
  const [data] = useState(() => window.localStorage.getItem('data'));
  return data;
}
```

**Why**: In 'infer' mode, functions must either:
- Return JSX (for components), OR
- Call React hooks (for hooks)

### Requirements for Compilation in Infer Mode

1. **Component Functions**
   - Must use PascalCase naming
   - Must return JSX

2. **Hook Functions**
   - Must start with `use` prefix
   - Must call other React hooks

3. **Explicit Compilation**
   - Add `"use memo"` directive to force compilation

### Verification Checklist
- [ ] Component name starts with uppercase letter (PascalCase)
- [ ] Hook name starts with `use` prefix
- [ ] Component returns JSX or hook calls other hooks
- [ ] No `"use no memo"` directive is present
- [ ] Function is top-level (not nested inside another function)
```

--------------------------------

### Common React Compiler Configuration Mistakes

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/config

Troubleshooting guide showing common configuration errors including typos in option names, wrong value types, and unknown options. Demonstrates how to identify and fix configuration issues.

```javascript
// ❌ Wrong: Common configuration mistakes
module.exports = {
  plugins: [
    ['babel-plugin-react-compiler', {
      // Typo in option name
      compilationMod: 'all',
      // Wrong value type
      panicThreshold: true,
      // Unknown option
      optimizationLevel: 'max'
    }]
  ]
};
```

--------------------------------

### Example DOM structure showing createPortal output

Source: https://react.dev/reference/react-dom/createPortal

This HTML snippet depicts the resulting DOM structure after `createPortal` has been used. It highlights how the element rendered by `createPortal` (the second `<p>`) is physically placed directly within the `<body>` element, independent of its original React parent component's position in the DOM.

```html
<body>
  <div id="root">
    ...
      <div style="border: 2px solid black">
        <p>This child is placed inside the parent div.</p>
      </div>
    ...
  </div>
  <p>This child is placed in the document body.</p>
</body>
```

--------------------------------

### Pre-render Multiple Pages with Hidden Activity Components in React

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Demonstrates rendering multiple pages within Activity components set to hidden mode until the user navigates to them. This approach pre-fetches and pre-renders content so it's ready immediately when needed, eliminating Suspense fallback delays. The example maps through videos to render Details pages in hidden mode and conditionally shows Home or Details based on the current URL.

```javascript
import { Activity, ViewTransition, use } from "react";
import Details from "./Details";
import Home from "./Home";
import { useRouter } from "./router";
import { fetchVideos } from './data';

export default function App() {
  const { url } = useRouter();
  const videoId = url.split("/").pop();
  const videos = use(fetchVideos());

  return (
    <ViewTransition>
      {/* Render videos in Activity to pre-render them */}
      {videos.map(({id}) => (
        <Activity key={id} mode={videoId === id ? 'visible' : 'hidden'}>
          <Details id={id}/>
        </Activity>
      ))}
      <Activity mode={url === '/' ? 'visible' : 'hidden'}>
        <Home />
      </Activity>
    </ViewTransition>
  );
}
```

--------------------------------

### Initiate a Non-Blocking Update with startTransition in React

Source: https://react.dev/reference/react/useTransition

This example shows how to use the `startTransition` function returned by `useTransition` to perform an asynchronous update. It wraps an `async` function that updates a quantity, ensuring the UI remains responsive by doing the work in the background.

```javascript
import {useState, useTransition} from 'react';
import {updateQuantity} from './api';

function CheckoutForm() {
  const [isPending, startTransition] = useTransition();
  const [quantity, setQuantity] = useState(1);

  function onSubmit(newQuantity) {
    startTransition(async function () {
      const savedQuantity = await updateQuantity(newQuantity);
      startTransition(() => {
        setQuantity(savedQuantity);
      });
    });
  }
  // ...
}
```

--------------------------------

### Example JSX for Unpacked Item Display

Source: https://react.dev/learn/conditional-rendering

This snippet shows the basic JSX structure for a list item that is not packed. It is presented to highlight the similarity and potential duplication with the packed item's JSX, leading into refactoring discussions.

```jsx
<li className="item">{name}</li>
```

--------------------------------

### Render Server with Asset Map and Bootstrap Scripts

Source: https://react.dev/reference/react-dom/server/renderToPipeableStream

Sets up the server route to render the App component with an assetMap containing hashed asset filenames. The bootstrapScripts option uses the mapped asset URL to load the correct hashed JavaScript file, ensuring the client receives the same asset references as the server.

```JavaScript
const assetMap = {
  'styles.css': '/styles.123456.css',
  'main.js': '/main.123456.js'
};

app.use('/', (request, response) => {
  const { pipe } = renderToPipeableStream(<App assetMap={assetMap} />, {
    bootstrapScripts: [assetMap['main.js']],
    onShellReady() {
      response.setHeader('content-type', 'text/html');
      pipe(response);
    }
  });
});
```

--------------------------------

### Complete Details Component with Suspense Animation

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Full Details component demonstrating video loading with Suspense and View Transitions. Fetches video data, handles navigation, and renders VideoDetails with custom slide animations. Combines routing, data fetching, and animated transitions for a complete UI flow.

```JSX
export default function Details() {
  const { url, navigateBack } = useRouter();
  const videoId = url.split("/").pop();
  const video = use(fetchVideo(videoId));

  return (
    <Layout
      heading={
        <div
          className="fit back"
          onClick={() => {
            navigateBack("/");
          }}
        >
          <ChevronLeft /> Back
        </div>
      }
    >
      <div className="details">
        <Thumbnail video={video} large>
          <VideoControls />
        </Thumbnail>
        <VideoDetails id={video.id} />
      </div>
    </Layout>
  );
}
```

--------------------------------

### Valid Gating Configuration with Feature Flags

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/gating

Demonstrates correct gating configuration with all required fields properly set. The gating object includes 'importSpecifierName' referencing an exported function name and 'source' specifying the module name. This setup enables selective component compilation through feature flag evaluation.

```javascript
module.exports = {
  plugins: [
    ['babel-plugin-react-compiler', {
      gating: {
        importSpecifierName: 'isCompilerEnabled',
        source: 'featureFlags'
      }
    }]
  ]
};

export function isCompilerEnabled() {
  // ...
}
```

--------------------------------

### Measure React useMemo Performance with console.time

Source: https://react.dev/reference/react/useMemo

This example combines `console.time` with `useMemo` to demonstrate how memoization affects calculation times on subsequent renders. The `filterTodos` function is wrapped in `useMemo` so its execution is skipped if dependencies `todos` and `tab` remain unchanged, showing performance gains.

```jsx
console.time('filter array');
const visibleTodos = useMemo(() => {
  return filterTodos(todos, tab); // Skipped if todos and tab haven't changed
}, [todos, tab]);
console.timeEnd('filter array');
```

--------------------------------

### Run String Refs to Callback Ref Codemod

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Automated codemod to convert string refs to ref callbacks in React class components. Executes the react/19/replace-string-ref transformation.

```bash
npx codemod@latest react/19/replace-string-ref
```

--------------------------------

### useState Component Example with Multiple State Variables

Source: https://react.dev/reference/react/useState

Demonstrates declaring multiple state variables in a React component using useState. Shows both direct value initialization and function-based initialization with createTodos(). Each state variable follows the naming convention [something, setSomething] using array destructuring.

```JavaScript
import { useState } from 'react';

function MyComponent() {
  const [age, setAge] = useState(28);
  const [name, setName] = useState('Taylor');
  const [todos, setTodos] = useState(() => createTodos());
  // ...
}
```

--------------------------------

### Render React Tree to Node.js Stream with onShellReady Callback

Source: https://react.dev/reference/react-dom/server/renderToPipeableStream

This example illustrates how to use `renderToPipeableStream` to render a React application to an HTML stream in a Node.js server environment. It demonstrates importing the function, passing a root React component (`<App />`), and configuring `bootstrapScripts` for client-side hydration. The `onShellReady` callback is used to set the `Content-Type` header and initiate piping the HTML response once the initial shell is ready, enabling progressive streaming.

```javascript
import { renderToPipeableStream } from 'react-dom/server';

const { pipe } = renderToPipeableStream(<App />, {
  bootstrapScripts: ['/main.js'],
  onShellReady() {
    response.setHeader('content-type', 'text/html');
    pipe(response);
  }
});
```

--------------------------------

### Replace React.createFactory with JSX

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Replace createFactory (deprecated v16.13.0) with JSX syntax. createFactory was common before JSX support was widespread but is rarely used in modern React applications.

```javascript
// Before
import { createFactory } from 'react';

const button = createFactory('button');
```

```javascript
// After
const button = <button />;
```

--------------------------------

### FragmentInstance Methods (Canary)

Source: https://react.dev/reference/react/Fragment

API reference for FragmentInstance methods available when using refs with Fragment components. Includes event handling, layout queries, focus management, and observer methods for interacting with DOM nodes wrapped by the Fragment.

```APIDOC
## FragmentInstance Methods (Canary only)

### Description
When a ref is passed to a Fragment, React provides a `FragmentInstance` object with methods for DOM interaction and manipulation.

### Event Handling Methods

#### addEventListener(type, listener, options?)
- **Description**: Adds an event listener to all first-level DOM children of the Fragment
- **Parameters**:
  - `type` (string) - Event type to listen for
  - `listener` (EventListener) - Callback function
  - `options` (AddEventListenerOptions, optional) - Event listener options
- **Returns**: void

#### removeEventListener(type, listener, options?)
- **Description**: Removes an event listener from all first-level DOM children of the Fragment
- **Parameters**:
  - `type` (string) - Event type
  - `listener` (EventListener) - Callback function to remove
  - `options` (EventListenerOptions, optional) - Event listener options
- **Returns**: void

#### dispatchEvent(event)
- **Description**: Dispatches an event to a virtual child of the Fragment to call any added listeners and can bubble to the DOM parent
- **Parameters**:
  - `event` (Event) - Event object to dispatch
- **Returns**: boolean - Returns false if event was cancelled

### Layout Methods

#### compareDocumentPosition(otherNode)
- **Description**: Compares the document position of the Fragment with another node
- **Parameters**:
  - `otherNode` (Node) - Node to compare position with
- **Returns**: number - Document position constant
- **Behavior**:
  - Non-empty Fragments: Returns native `compareDocumentPosition` value
  - Empty Fragments: Attempts to compare positioning within React tree, includes `Node.DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC`
  - Portaled elements: Returns `Node.DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC`

#### getClientRects()
- **Description**: Returns bounding rectangles of all Fragment children
- **Parameters**: None
- **Returns**: DOMRect[] - Flat array of DOMRect objects

#### getRootNode()
- **Description**: Returns the root node containing the Fragment's parent DOM node
- **Parameters**: None
- **Returns**: Node - Root node containing Fragment's parent

### Focus Management Methods

#### focus(options?)
- **Description**: Focuses the first focusable DOM node in the Fragment using depth-first traversal
- **Parameters**:
  - `options` (FocusOptions, optional) - Focus options (preventScroll)
- **Returns**: void

#### focusLast(options?)
- **Description**: Focuses the last focusable DOM node in the Fragment using depth-first traversal
- **Parameters**:
  - `options` (FocusOptions, optional) - Focus options (preventScroll)
- **Returns**: void

#### blur()
- **Description**: Removes focus if `document.activeElement` is within the Fragment
- **Parameters**: None
- **Returns**: void

### Observer Methods

#### observeUsing(observer)
- **Description**: Starts observing the Fragment's DOM children with an IntersectionObserver or ResizeObserver
- **Parameters**:
  - `observer` (IntersectionObserver | ResizeObserver) - Observer instance
- **Returns**: void

#### unobserveUsing(observer)
- **Description**: Stops observing the Fragment's DOM children with the specified observer
- **Parameters**:
  - `observer` (IntersectionObserver | ResizeObserver) - Observer instance
- **Returns**: void
```

--------------------------------

### Run propTypes to TypeScript Codemod

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Automated codemod to convert PropTypes usage to TypeScript type definitions. Executes the react/prop-types-typescript transformation to migrate legacy PropTypes declarations.

```bash
npx codemod@latest react/prop-types-typescript
```

--------------------------------

### Implementing DOM node exposure using `forwardRef` in React

Source: https://react.dev/reference/react/forwardRef

This example completes the `forwardRef` implementation by explicitly passing the `ref` received from the parent to the desired internal DOM node (`<input>`), effectively exposing it for parent interaction.

```javascript
import { forwardRef } from 'react';

const MyInput = forwardRef(function MyInput(props, ref) {
  const { label, ...otherProps } = props;
  return (
    <label>
      {label}
      <input {...otherProps} ref={ref} />
    </label>
  );
});
```

--------------------------------

### Using startTransition API for Urgent and Non-Urgent Updates in React

Source: https://react.dev/blog/2022/03/29/react-v18

Demonstrates how to use the startTransition API to mark state updates as non-urgent transitions. Urgent updates (like setInputValue) execute immediately to provide instant user feedback, while transition updates (wrapped in startTransition) can be interrupted by higher-priority user interactions. This pattern is useful for search filters, form submissions, and other UI transitions that don't require immediate visual response.

```javascript
import { startTransition } from 'react';

// Urgent: Show what was typed
setInputValue(input);

// Mark any state updates inside as transitions
startTransition(() => {
  // Transition: Show the results
  setSearchQuery(input);
});
```

--------------------------------

### Basic Button Component without Event Handler

Source: https://react.dev/learn/responding-to-events

A simple React functional component that renders a button element with no interactivity. This serves as the starting point before adding event handling logic.

```JavaScript
export default function Button() {
  return (
    <button>
      I don't do anything
    </button>
  );
}
```

--------------------------------

### Integrate flushSync with browser onbeforeprint API

Source: https://react.dev/reference/react-dom/flushSync

Complete example demonstrating flushSync usage with React hooks (useState, useEffect) to synchronously update state before the browser print dialog opens. This pattern ensures custom print styles are applied correctly by flushing React state to the DOM synchronously.

```JavaScript
import { useState, useEffect } from 'react';
import { flushSync } from 'react-dom';

export default function PrintApp() {
  const [isPrinting, setIsPrinting] = useState(false);

  useEffect(() => {
    function handleBeforePrint() {
      flushSync(() => {
        setIsPrinting(true);
      })
    }

    function handleAfterPrint() {
      setIsPrinting(false);
    }

    window.addEventListener('beforeprint', handleBeforePrint);
    window.addEventListener('afterprint', handleAfterPrint);
    return () => {
      window.removeEventListener('beforeprint', handleBeforePrint);
      window.removeEventListener('afterprint', handleAfterPrint);
    }
  }, []);

  return (
    <>
      <h1>isPrinting: {isPrinting ? 'yes' : 'no'}</h1>
      <button onClick={() => window.print()}>
        Print
      </button>
    </>
  );
}
```

--------------------------------

### Marking State Updates as Non-Blocking Transitions in React

Source: https://react.dev/reference/react/startTransition

Shows a practical example of using `startTransition` within a React functional component. It demonstrates wrapping a `useState` update (`setTab`) inside `startTransition` to prevent it from blocking the UI, enhancing user experience during potentially slow updates. Requires importing `startTransition` and `useState` from 'react'.

```JavaScript
import { startTransition } from 'react';

function TabContainer() {
  const [tab, setTab] = useState('about');

  function selectTab(nextTab) {
    startTransition(() => {
      setTab(nextTab);
    });
  }
  // ...
}
```

--------------------------------

### Conditionally Render JSX in React

Source: https://react.dev/learn/describing-the-ui

Illustrates how to conditionally display different UI elements in React using JavaScript syntax. This example specifically uses the logical AND (&&) operator to render a checkmark emoji only when the 'isPacked' prop is true, demonstrating simple conditional rendering within JSX.

```javascript
function Item({ name, isPacked }) {
  return (
    <li className="item">
      {name} {isPacked && '✅'}
    </li>
  );
}

export default function PackingList() {
  return (
    <section>
      <h1>Sally Ride's Packing List</h1>
      <ul>
        <Item
          isPacked={true}
          name="Space suit"
        />
        <Item
          isPacked={true}
          name="Helmet with a golden leaf"
        />
        <Item
          isPacked={false}
          name="Photo of Tam"
        />
      </ul>
    </section>
  );
}
```

--------------------------------

### createElement Function Signature and Basic Usage

Source: https://react.dev/reference/react/createElement

Demonstrates the basic createElement function signature and a simple example creating an h1 element with className prop. The function serves as a programmatic alternative to JSX for creating React elements with the specified type, props, and children.

```javascript
const element = createElement(type, props, ...children)
```

```javascript
import { createElement } from 'react';

function Greeting({ name }) {
  return createElement(
    'h1',
    { className: 'greeting' },
    'Hello'
  );
}
```

--------------------------------

### Avoid renderToString on client - use createRoot instead

Source: https://react.dev/reference/react-dom/server/renderToString

Demonstrates the recommended approach for rendering components to HTML on the client side using createRoot and flushSync instead of renderToString. This avoids unnecessary bundle size increase from importing react-dom/server in browser code.

```javascript
import { createRoot } from 'react-dom/client';
import { flushSync } from 'react-dom';

const div = document.createElement('div');
const root = createRoot(div);

flushSync(() => {
  root.render(<MyIcon />);
});

console.log(div.innerHTML); // For example, "<svg>...</svg>"
```

--------------------------------

### Declare and use a ref to focus an input in React class component

Source: https://react.dev/reference/react/createRef

Provides a complete React class component example demonstrating how to declare a ref with `createRef`, attach it to an `<input>` element using the `ref` prop, and then programmatically focus that input via a button click using `this.inputRef.current.focus()`.

```javascript
import { Component, createRef } from 'react';

export default class Form extends Component {
  inputRef = createRef();

  handleClick = () => {
    this.inputRef.current.focus();
  }

  render() {
    return (
      <>
        <input ref={this.inputRef} />
        <button onClick={this.handleClick}>
          Focus the input
        </button>
      </>
    );
  }
}
```

--------------------------------

### Listen for Custom Element Events in React

Source: https://react.dev/reference/react-dom/components

Shows how to listen for CustomEvent dispatched by custom elements using the `on` prefix with the event name in JSX. This example captures a 'speak' event and logs the message from the event detail.

```jsx
export function App() {
  return (
    <my-element
      onspeak={e => console.log(e.detail.message)}
    ></my-element>
  )
}
```

--------------------------------

### Render an Inline JavaScript Script in React

Source: https://react.dev/reference/react-dom/components/script

This example demonstrates embedding JavaScript directly within a React component using the built-in `<script>` component. The script content is passed as children to the component.

```jsx
<script> alert("hi!") </script>
```

--------------------------------

### Complete TaskApp with Reducer and Event Handlers

Source: https://react.dev/learn/scaling-up-with-reducer-and-context

Full TaskApp component implementation including useReducer hook setup, three event handler functions (handleAddTask, handleChangeTask, handleDeleteTask), and the tasksReducer function with cases for 'added', 'changed', and 'deleted' actions. Also defines initial tasks data structure and nextId counter.

```javascript
import { useReducer } from 'react';
import AddTask from './AddTask.js';
import TaskList from './TaskList.js';
import { TasksContext, TasksDispatchContext } from './TasksContext.js';

export default function TaskApp() {
  const [tasks, dispatch] = useReducer(
    tasksReducer,
    initialTasks
  );

  function handleAddTask(text) {
    dispatch({
      type: 'added',
      id: nextId++,
      text: text,
    });
  }

  function handleChangeTask(task) {
    dispatch({
      type: 'changed',
      task: task
    });
  }

  function handleDeleteTask(taskId) {
    dispatch({
      type: 'deleted',
      id: taskId
    });
  }

  return (
    <TasksContext value={tasks}>
      <TasksDispatchContext value={dispatch}>
        <h1>Day off in Kyoto</h1>
        <AddTask
          onAddTask={handleAddTask}
        />
        <TaskList
          tasks={tasks}
          onChangeTask={handleChangeTask}
          onDeleteTask={handleDeleteTask}
        />
      </TasksDispatchContext>
    </TasksContext>
  );
}

function tasksReducer(tasks, action) {
  switch (action.type) {
    case 'added': {
      return [...tasks, {
        id: action.id,
        text: action.text,
        done: false
      }];
    }
    case 'changed': {
      return tasks.map(t => {
        if (t.id === action.task.id) {
          return action.task;
        } else {
          return t;
        }
      });
    }
    case 'deleted': {
      return tasks.filter(t => t.id !== action.id);
    }
    default: {
      throw Error('Unknown action: ' + action.type);
    }
  }
}

let nextId = 3;
const initialTasks = [
  { id: 0, text: 'Philosopher\'s Path', done: true },
  { id: 1, text: 'Visit the temple', done: false },
  { id: 2, text: 'Drink matcha', done: false }
];
```

--------------------------------

### Using `act` for Initial Render and Assertion in React Tests

Source: https://react.dev/reference/react/act

This example demonstrates embedding `await act()` within a test block (`it`) to render a component (`TestComponent`) and subsequently assert its state. It guarantees that all rendering processes and side effects are completed before any `expect` calls are executed.

```javascript
it ('renders with button disabled', async () => {  

  await act(async () => {  

    root.render(<TestComponent />)  

  });  

  expect(container.querySelector('button')).toBeDisabled();  

});
```

--------------------------------

### Example JSX for Packed Item Display

Source: https://react.dev/learn/conditional-rendering

This snippet shows the JSX structure for a list item that is marked as packed, including a checkmark. It is presented as part of a discussion on identifying and reducing code duplication in conditional rendering.

```jsx
<li className="item">{name} ✅</li>
```

--------------------------------

### Migrate ReactDOM.render to ReactDOM.createRoot

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Replace the legacy ReactDOM.render method with createRoot for modern React 19 applications. This provides better performance and enables concurrent features. The new API requires creating a root object before rendering.

```JavaScript
// Before
import {render} from 'react-dom';
render(<App />, document.getElementById('root'));

// After
import {createRoot} from 'react-dom/client';
const root = createRoot(document.getElementById('root'));
root.render(<App />);
```

```Bash
npx codemod@latest react/19/replace-reactdom-render
```

--------------------------------

### Execute all React 19 migration codemods

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

This command uses `npx` to run the `codemod` utility, specifically invoking the `react/19/migration-recipe`. This recipe orchestrates multiple codemods to automatically update your codebase to new React 19 APIs and patterns, simplifying the upgrade process by handling common replacements.

```bash
npx codemod@latest react/19/migration-recipe
```

--------------------------------

### Configuring React Compiler: Project-Wide vs. Directive-Based

Source: https://react.dev/reference/react-compiler/directives

This example contrasts project-wide React Compiler configuration (e.g., compilationMode: 'infer') with the use of individual directives. It recommends preferring project-level settings for broad control and reserving directives like "use no memo" for specific, well-documented edge cases or temporary workarounds.

```javascript
// ✅ Good - project-wide configuration
{
  plugins: [
    ['babel-plugin-react-compiler', {
      compilationMode: 'infer'
    }]
  ]
}

// ⚠️ Use directives only when needed
function SpecialCase() {
  "use no memo"; // Document why this is needed
  // ...
}
```

--------------------------------

### Render a list of React Fragments with keys using explicit Fragment

Source: https://react.dev/reference/react/Fragment

Demonstrates how to iterate over a list and render multiple elements for each item, grouping them with an explicit `<Fragment>` component that requires a unique `key` prop for proper list rendering.

```javascript
function Blog() {  
  return posts.map(post =>  
    <Fragment key={post.id}>  
      <PostTitle title={post.title} />  
      <PostBody body={post.body} />  
    </Fragment>  
  );
}
```

--------------------------------

### Illustrating Traditional React Component Styling with CSS

Source: https://react.dev/reference/react/useInsertionEffect

This example showcases the conventional method of styling React components. It involves assigning a `className` to a component in JavaScript and defining the corresponding styles in a separate CSS file, offering a clear contrast to CSS-in-JS approaches discussed later.

```javascript
// In your JS file:  

<button className="success" />
```

```css
// In your CSS file:  
.success { color: green; }
```

--------------------------------

### Memoizing a function using `useCallback` in React

Source: https://react.dev/reference/react/useMemo

The recommended way to memoize functions in React is by using the `useCallback` hook. This example demonstrates how `useCallback` provides a more concise syntax for achieving the same memoization as `useMemo` for functions, preventing unnecessary re-renders of child components that receive the function as a prop.

```javascript
export default function Page({ productId, referrer }) {  
  const handleSubmit = useCallback((orderDetails) => {  
    post('/product/' + productId + '/buy', {  
      referrer,  
      orderDetails  
    });  
  }, [productId, referrer]);  
  
  return <Form onSubmit={handleSubmit} />;  
}
```

--------------------------------

### Example of rendered HTML output from React Server Components

Source: https://react.dev/reference/rsc/server-components

This HTML snippet represents the final output sent to the client after Server Components have been rendered on the server. The client receives only the static HTML, not the original React component logic, optimizing initial page load and reducing client-side JavaScript.

```html

<div>  
  <span>By: The React Team</span>  
  <p>React 19 is...</p>  
</div>
```

--------------------------------

### Full React application example with lazy loading and Suspense

Source: https://react.dev/reference/react/lazy

A complete React functional component (`MarkdownEditor`) showcasing the integration of `lazy` and `Suspense`. It includes state management for toggling a lazy-loaded `MarkdownPreview` component and a custom `delayForDemo` function to simulate network latency.

```javascript
import { useState, Suspense, lazy } from 'react';
import Loading from './Loading.js';

const MarkdownPreview = lazy(() => delayForDemo(import('./MarkdownPreview.js')));

export default function MarkdownEditor() {
  const [showPreview, setShowPreview] = useState(false);
  const [markdown, setMarkdown] = useState('Hello, **world**!');
  return (
    <>
      <textarea value={markdown} onChange={e => setMarkdown(e.target.value)} />
      <label>
        <input type="checkbox" checked={showPreview} onChange={e => setShowPreview(e.target.checked)} />
        Show preview
      </label>
      <hr />
      {showPreview && (
        <Suspense fallback={<Loading />}>
          <h2>Preview</h2>
          <MarkdownPreview markdown={markdown} />
        </Suspense>
      )}
    </>
  );
}

// Add a fixed delay so you can see the loading state
function delayForDemo(promise) {
  return new Promise(resolve => {
    setTimeout(resolve, 2000);
  }).then(() => promise);
}
```

--------------------------------

### renderToString

Source: https://react.dev/reference/react-dom/server

Renders a React tree to an HTML string synchronously. This legacy API is for non-streaming environments and has limited functionality compared to streaming methods.

```APIDOC
## renderToString

### Description
Renders a React tree to a static HTML string. This is a legacy API for environments without streaming support.

### Environment
Non-streaming environments

### Usage
Import from `react-dom/server`

### Parameters
- **component** (React Component) - Required - The root React component to render

### Return Value
- **string** - The rendered HTML string

### Example
```javascript
import { renderToString } from 'react-dom/server';

const html = renderToString(<App />);
```

### Limitations
This method has limited functionality compared to streaming APIs. For better performance and features, use renderToPipeableStream (Node.js) or renderToReadableStream (Web Streams) instead.
```

--------------------------------

### React Component Default Re-render Behavior

Source: https://react.dev/reference/react/useMemo

This example illustrates how a React component re-runs its entire body, including calculations like `filterTodos`, on every re-render by default. This can lead to performance issues for expensive computations if not optimized with hooks like `useMemo`.

```jsx
function TodoList({ todos, tab, theme }) {
  const visibleTodos = filterTodos(todos, tab);
  // ...
}
```

--------------------------------

### Use `<Context>` directly as a Provider in React 19

Source: https://react.dev/blog/2024/12/05/react-19

This example illustrates the new syntax in React 19 allowing the Context object itself (e.g., `ThemeContext`) to be used directly as a provider, replacing the older `<Context.Provider>` syntax. This change simplifies the Context API's usage for providing values.

```jsx
const ThemeContext = createContext('');  
  
function App({children}) {  
  return (  
    <ThemeContext value="dark">  
      {children}  
    </ThemeContext>  
  );    
}
```

--------------------------------

### Handle Touch Events in React

Source: https://react.dev/reference/react-dom/components/common

This example illustrates how to use touch event handlers in React, including `onTouchStart`, `onTouchMove`, `onTouchEnd`, and `onTouchCancel` on a div element. The event object `e` provides specific `TouchEvent` properties (e.g., `touches`, `changedTouches`, `altKey`, `ctrlKey`, `shiftKey`) and inherited `UIEvent` properties.

```jsx
<div  

  onTouchStart={e => console.log('onTouchStart')}  

  onTouchMove={e => console.log('onTouchMove')}  

  onTouchEnd={e => console.log('onTouchEnd')}  

  onTouchCancel={e => console.log('onTouchCancel')}  

/>
```

--------------------------------

### Gradually Adopting React Compiler with 'use memo' for Components

Source: https://react.dev/reference/react-compiler/directives/use-memo

Shows a strategy for gradually adopting the React Compiler by starting with leaf components and then moving up the component tree. 'use memo' is applied to individual components, allowing developers to selectively optimize and verify behavior during a phased rollout of compiler integration.

```javascript
// Start by optimizing leaf components  
function Button({ onClick, children }) {  
  "use memo";  
  // ...  
}  
  
// Gradually move up the tree as you verify behavior  
function ButtonGroup({ buttons }) {  
  "use memo";  
  // ...  
}
```

--------------------------------

### resume

Source: https://react.dev/reference/react-dom/server

Resumes a prerendered React tree to a Readable Web Stream. Used to continue rendering from a previous prerender operation in Web Streams environments.

```APIDOC
## resume

### Description
Resumes rendering from a prerender operation to a Readable Web Stream in Web Streams environments.

### Environment
Web Streams (browsers, Deno, modern edge runtimes)

### Usage
Import from `react-dom/server`

### Parameters
- **prerenderResult** (object) - Required - Result object from a previous prerender operation
- **options** (object) - Optional - Configuration options for resuming

### Return Value
- **ReadableStream** - A Web Stream containing the resumed rendered HTML

### Example
```javascript
import { resume } from 'react-dom/server';

const stream = await resume(prerenderResult);
```
```

--------------------------------

### Utilize React Compiler Flow Syntax Mode

Source: https://react.dev/reference/react-compiler/compilationMode

For projects using Flow, this example demonstrates setting `compilationMode` to `'syntax'`. The compiler will then recognize and process functions defined using Flow's component and hook syntax.

```json
{
  compilationMode: 'syntax'
}
```

```javascript
// Compiled: Flow component syntax  
component Button(label: string) {  
  return <button>{label}</button>;  
}  
  
// Compiled: Flow hook syntax  
hook useCounter(initial: number) {  
  const [count, setCount] = useState(initial);  
  return [count, setCount];  
}  
  
// Not compiled: Regular function syntax  
function helper(data) {  
  return process(data);  
}
```

--------------------------------

### Class Component Constructor with State and Method Binding

Source: https://react.dev/reference/react/Component

Demonstrates using a constructor to initialize state and bind methods to the class instance. This is the traditional approach before modern JavaScript syntax support.

```javascript
class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = { counter: 0 };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    // ...
  }
}
```

--------------------------------

### Implicit return in arrow functions for single-expression JSX

Source: https://react.dev/learn/rendering-lists

This example highlights the implicit return feature of arrow functions when their body consists of a single expression, such as a JSX element. In such cases, the `return` keyword is not explicitly needed, making the code more concise.

```javascript
const listItems = chemists.map(person =>
  <li>...</li> // Implicit return!
);
```

--------------------------------

### Discouraged useSyncExternalStore Patterns with React Suspense

Source: https://react.dev/reference/react/useSyncExternalStore

These examples illustrate discouraged patterns where `useSyncExternalStore` is used in ways that can lead to poor user experience with React Suspense. Directly suspending based on a store value or conditionally rendering lazy components can cause disruptive loading spinners and should generally be avoided.

```javascript
const LazyProductDetailPage = lazy(() => import('./ProductDetailPage.js'));  

  

function ShoppingApp() {  

  const selectedProductId = useSyncExternalStore(...);  

  

  // ❌ Calling `use` with a Promise dependent on `selectedProductId`  

  const data = use(fetchItem(selectedProductId))  

  

  // ❌ Conditionally rendering a lazy component based on `selectedProductId`  

  return selectedProductId != null ? <LazyProductDetailPage /> : <FeaturedProducts />;  

}
```

--------------------------------

### HTML output with Client Component bundle and Server Component content

Source: https://react.dev/reference/rsc/server-components

This HTML snippet illustrates the structure of the page sent to the client, combining the rendered output of Server Components with the necessary script tag to load the Client Component bundle. The Client Components will then hydrate and become interactive in the browser, working with the props received from Server Components.

```html

<head>  
  <!-- the bundle for Client Components -->  
  <script src="bundle.js" />  
</head>  
<body>  
  <div>  
    <Expandable key={1}>  
      <p>this is the first note</p>  
    </Expandable>  
    <Expandable key={2}>  
      <p>this is the second note</p>  
    </Expandable>  
    <!--...-->  
  </div>  
</body>
```

--------------------------------

### React: Import and prefetch DNS during component rendering

Source: https://react.dev/reference/react-dom/prefetchDNS

This example shows how to import `prefetchDNS` from `react-dom` and use it within a React functional component's rendering logic. Calling `prefetchDNS` here is beneficial when anticipating that child components will load external resources from the specified host, speeding up their eventual display.

```javascript
import { prefetchDNS } from 'react-dom';  
  
function AppRoot() {  
  prefetchDNS("https://example.com");  
  return ...;  
}
```

--------------------------------

### React 19 Compiled Output with Built-in Runtime

Source: https://react.dev/reference/react-compiler/target

Example of compiled output for React 19 using the built-in compiler runtime from the react package. This demonstrates the import path for React 19's native runtime APIs.

```javascript
// Compiled output uses React 19's native APIs
import { c as _c } from 'react/compiler-runtime';
```

--------------------------------

### Access DOM node and use browser APIs with useRef

Source: https://react.dev/learn/manipulating-the-dom-with-refs

Access the DOM node stored in the ref's current property and call browser APIs on it. This example demonstrates using scrollIntoView() to scroll to an element.

```javascript
// You can use any browser APIs, for example:
myRef.current.scrollIntoView();
```

--------------------------------

### Function: useEffect(setup, dependencies?)

Source: https://react.dev/reference/react/useEffect

`useEffect` is a React Hook that lets you synchronize a component with an external system. It allows you to run side effects in function components, such as data fetching, subscriptions, or manually changing the DOM, and provides a mechanism for cleanup.

```APIDOC
## Function: useEffect(setup, dependencies?)

### Description
`useEffect` is a React Hook that lets you synchronize a component with an external system. Your setup function may also optionally return a cleanup function to handle resource deallocation when the component unmounts or dependencies change.

### Type
React Hook

### Call Signature
`useEffect(setup, dependencies?)`

### Parameters
- **setup** (function) - Required - The function containing your Effect’s logic. This function may optionally return a cleanup function. React will run your setup function after every commit with changed dependencies. After every commit with changed dependencies, React will first run the cleanup function (if provided) with the old values, and then run your setup function with the new values. After your component is removed from the DOM, React will run your cleanup function.
- **dependencies** (array) - Optional - The list of all reactive values referenced inside the `setup` code. These include props, state, and variables/functions declared directly inside your component body. React will compare each dependency with its previous value using `Object.is`. If this argument is omitted, the Effect will re-run after every commit of the component.

### Request Example
```json
{
  "js_hook_call_example": "import { useState, useEffect } from 'react';\nimport { createConnection } from './chat.js';\n\nfunction ChatRoom({ roomId }) {\n  const [serverUrl, setServerUrl] = useState('https://localhost:1234');\n\n  useEffect(() => {\n    const connection = createConnection(serverUrl, roomId);\n    connection.connect();\n    return () => {\n      connection.disconnect();\n    };\n  }, [serverUrl, roomId]);\n  // ...\n}"
}
```

### Return Value
#### Success Response (undefined)
`useEffect` returns `undefined`.

#### Response Example
```json
{
  "return_value": "undefined"
}
```
```

--------------------------------

### Demonstrate React 18 Automatic Batching

Source: https://react.dev/blog/2022/03/08/react-18-upgrade-guide

This JavaScript example showcases the automatic batching introduced in React 18 when using `createRoot`. All state updates, regardless of their origin (e.g., event handlers, `setTimeout`), are now batched into a single re-render, significantly improving performance compared to previous React versions.

```javascript
// After React 18 updates inside of timeouts, promises,  
// native event handlers or any other event are batched.  
  
function handleClick() {  
  setCount(c => c + 1);  
  setFlag(f => !f);  
  // React will only re-render once at the end (that's batching!)  
}  
  
setTimeout(() => {  
  setCount(c => c + 1);  
  setFlag(f => !f);  
  // React will only re-render once at the end (that's batching!)  
}, 1000);
```

--------------------------------

### Create Common React Component with JSX

Source: https://react.dev/reference/react-dom/components/common

Basic example of using a common browser component (div) in React with className prop. Demonstrates the fundamental syntax for wrapping content within a div element using JSX.

```jsx
<div className="wrapper">Some content</div>
```

--------------------------------

### Video Component with Navigation and Thumbnail

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Main video component that displays a thumbnail wrapped in ViewTransition, video metadata, and a like button. Includes click handler that navigates to video detail page using router navigation.

```jsx
export function Video({ video }) {
  const { navigate } = useRouter();

  return (
    <div className="video">
      <div
        className="link"
        onClick={(e) => {
          e.preventDefault();
          navigate(`/video/${video.id}`);
        }}
      >
        <Thumbnail video={video}></Thumbnail>

        <div className="info">
          <div className="video-title">{video.title}</div>
          <div className="video-description">{video.description}</div>
        </div>
      </div>
      <LikeButton video={video} />
    </div>
  );
}
```

--------------------------------

### Use Prefix for Functions That Call Other Hooks

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

Demonstrates the correct use of the 'use' prefix for custom Hooks that call other Hooks internally. In this example, 'useAuth' is properly named with the 'use' prefix because it calls the 'useContext' Hook.

```javascript
// ✅ Good: A Hook that uses other Hooks
function useAuth() {
  return useContext(Auth);
}
```

--------------------------------

### useOptimistic - Optimistically Updating Forms

Source: https://react.dev/reference/react/useOptimistic

Practical implementation guide for using useOptimistic to enhance form responsiveness by immediately displaying user input while server operations complete in the background, improving perceived performance.

```APIDOC
## useOptimistic - Optimistically Updating Forms

### Description
Demonstrates how to use the useOptimistic Hook to provide immediate UI feedback in forms. When a user submits a form, the interface updates immediately with the expected outcome while the actual server request happens in the background, creating a more responsive user experience.

### Use Case
Form submission with background processing (e.g., sending messages, posting content). The UI shows a "Sending..." indicator while the actual network request completes.

### Implementation Pattern

#### State Setup
```javascript
import { useOptimistic, useState, useRef, startTransition } from 'react';
import { deliverMessage } from './actions.js';

function Thread({ messages, sendMessageAction }) {
  const formRef = useRef();
  const [optimisticMessages, addOptimisticMessage] = useOptimistic(
    messages,
    (state, newMessage) => [
      {
        text: newMessage,
        sending: true
      },
      ...state,
    ]
  );
}
```

#### Form Action Handler
```javascript
function formAction(formData) {
  addOptimisticMessage(formData.get('message'));
  formRef.current.reset();
  startTransition(async () => {
    await sendMessageAction(formData);
  });
}
```

#### UI Rendering with Optimistic State
```javascript
return (
  <>
    <form action={formAction} ref={formRef}>
      <input type="text" name="message" placeholder="Hello!" />
      <button type="submit">Send</button>
    </form>
    {optimisticMessages.map((message, index) => (
      <div key={index}>
        {message.text}
        {!!message.sending && <small> (Sending...)</small>}
      </div>
    ))}
  </>
);
```

#### Server Action
```javascript
async function sendMessageAction(formData) {
  const sentMessage = await deliverMessage(formData.get('message'));
  startTransition(() => {
    setMessages((messages) => [{ text: sentMessage }, ...messages]);
  });
}
```

### Workflow
1. User submits form with message
2. `addOptimisticMessage` immediately adds message with `sending: true` flag
3. Form is reset for next input
4. `startTransition` wraps async server action
5. Message appears in list with "(Sending...)" label immediately
6. Server processes message in background
7. Upon confirmation, optimistic flag is removed and final state is set

### Benefits
- **Perceived Performance**: UI updates instantly without waiting for server
- **User Feedback**: "Sending..." indicator shows action is in progress
- **Responsive Experience**: Continuous form interaction without perceived delays
- **Data Synchronization**: Final state updates when server confirms success
```

--------------------------------

### Migrate ReactDOM.hydrate to ReactDOM.hydrateRoot

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Replace ReactDOM.hydrate with hydrateRoot for server-side rendering hydration in React 19. The new API takes the root container and component in reversed order compared to the legacy method.

```JavaScript
// Before
import {hydrate} from 'react-dom';
hydrate(<App />, document.getElementById('root'));

// After
import {hydrateRoot} from 'react-dom/client';
hydrateRoot(document.getElementById('root'), <App />);
```

```Bash
npx codemod@latest react/19/replace-reactdom-render
```

--------------------------------

### Using React useSyncExternalStore with an External Todo Store

Source: https://react.dev/reference/react/useSyncExternalStore

Demonstrates integrating React with a custom external todo store using `useSyncExternalStore`. The component subscribes to the `todosStore` for updates and re-renders when todos are added, showcasing how to connect React state to an external state management solution.

```javascript
import { useSyncExternalStore } from 'react';
import { todosStore } from './todoStore.js';

export default function TodosApp() {
  const todos = useSyncExternalStore(todosStore.subscribe, todosStore.getSnapshot);
  return (
    <>
      <button onClick={() => todosStore.addTodo()}>Add todo</button>
      <hr />
      <ul>
        {todos.map(todo => (
          <li key={todo.id}>{todo.text}</li>
        ))}
      </ul>
    </>
  );
}
```

--------------------------------

### useInsertionEffect Function Signature

Source: https://react.dev/reference/react/useInsertionEffect

Shows the complete function signature for useInsertionEffect with both required and optional parameters. The setup parameter contains the Effect's logic and optional cleanup function. The dependencies parameter is an optional array of reactive values that determines when the Effect re-runs.

```javascript
useInsertionEffect(setup, dependencies?)
```

--------------------------------

### useCallback with memo for skipping re-renders

Source: https://react.dev/reference/react/useCallback

Demonstrates how useCallback combined with memo prevents unnecessary re-renders of child components. The handleSubmit function is memoized with dependencies [productId, referrer], ensuring ShippingForm only re-renders when these values change. This example shows that toggling theme alone won't trigger re-renders thanks to memoization.

```javascript
import { useCallback } from 'react';
import ShippingForm from './ShippingForm.js';

export default function ProductPage({ productId, referrer, theme }) {
  const handleSubmit = useCallback((orderDetails) => {
    post('/product/' + productId + '/buy', {
      referrer,
      orderDetails,
    });
  }, [productId, referrer]);

  return (
    <div className={theme}>
      <ShippingForm onSubmit={handleSubmit} />
    </div>
  );
}

function post(url, data) {
  // Imagine this sends a request...
  console.log('POST /' + url);
  console.log(data);
}
```

--------------------------------

### Dispatching Events with `act` in React Component Tests

Source: https://react.dev/reference/react/act

This example demonstrates wrapping event dispatching (e.g., a click event) with `act` to ensure that all updates triggered by the event listener are fully processed and applied to the DOM before subsequent assertions. This is critical for accurately testing user interactions and component behavior.

```javascript
import {act} from 'react';  

import ReactDOMClient from 'react-dom/client';  

import Counter from './Counter';  

  
it.only('can render and update a counter', async () => {  

  const container = document.createElement('div');  

  document.body.appendChild(container);  

    

  await act( async () => {  

    ReactDOMClient.createRoot(container).render(<Counter />);  

  });  

    

  // ✅ Dispatch the event inside act().  

  await act(async () => {  

    button.dispatchEvent(new MouseEvent('click', { bubbles: true }));  

  });  

  

  const button = container.querySelector('button');  

  const label = container.querySelector('p');  

  expect(label.textContent).toBe('You clicked 1 times');  

  expect(document.title).toBe('You clicked 1 times');  

});
```

--------------------------------

### Basic Initialization of renderToPipeableStream in React Node.js

Source: https://react.dev/reference/react-dom/server/renderToPipeableStream

This snippet demonstrates the basic initialization of the `renderToPipeableStream` function. It shows its function signature, including a React node and optional configurations, and highlights that it returns an object containing `pipe` and `abort` methods for controlling the streaming process.

```javascript
const { pipe, abort } = renderToPipeableStream(reactNode, options?)
```

--------------------------------

### Update Shallow Renderer Import Statement

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Update import statements to use react-shallow-renderer package directly. This change separates shallow rendering testing tools from the core React test renderer.

```javascript
- import ShallowRenderer from 'react-test-renderer/shallow';
+ import ShallowRenderer from 'react-shallow-renderer';
```

--------------------------------

### Preloading an ESM module during React component rendering

Source: https://react.dev/reference/react-dom/preloadModule

This example shows how to integrate `preloadModule` within a React functional component's render logic. It's suitable for preloading modules that are known to be required as soon as the component or its children are rendered.

```javascript
import { preloadModule } from 'react-dom';  
  
function AppRoot() {  
  preloadModule("https://example.com/module.js", {as: "script"});  
  // ...  
}
```

--------------------------------

### Preloading Resources within a React Functional Component

Source: https://react.dev/reference/react-dom/preload

This example illustrates how to integrate `preload` within a React functional component. By calling `preload` during rendering, it ensures that a specified font resource is fetched as soon as the component is mounted or updated, optimizing its availability for subsequent use.

```javascript
import { preload } from 'react-dom';


function AppRoot() {

  preload("https://example.com/font.woff2", {as: "font"});

  // ...

}
```

--------------------------------

### Basic Resource Preloading with React's `preload`

Source: https://react.dev/reference/react-dom/preload

This snippet demonstrates the fundamental way to use the `preload` function. It initiates an eager fetch for a font resource, specifying its URL and resource type, thereby hinting to the browser to download it before it's explicitly needed.

```javascript
preload("https://example.com/font.woff2", {as: "font"});
```

--------------------------------

### React TaskApp Component (Partial) Using useReducer

Source: https://react.dev/learn/scaling-up-with-reducer-and-context

This partial React functional component illustrates the initial setup of a `TaskApp` using the `useReducer` hook. It defines state management with `dispatch` and event handlers for adding, changing, and deleting tasks. The code snippet is incomplete, specifically within the `return` statement's JSX structure.

```javascript
import { useReducer } from 'react';
import AddTask from './AddTask.js';
import TaskList from './TaskList.js';
  
export default function TaskApp() {
  const [tasks, dispatch] = useReducer(
    tasksReducer,
    initialTasks
  );
  
  function handleAddTask(text) {
    dispatch({
      type: 'added',
      id: nextId++,
      text: text,
    });
  }
  
  function handleChangeTask(task) {
    dispatch({
      type: 'changed',
      task: task
    });
  }
  
  function handleDeleteTask(taskId) {
    dispatch({
      type: 'deleted',
      id: taskId
    });
  }
  
  return (
    <>
      <h1>Day off in Kyoto</h1>
      <AddTask
```

--------------------------------

### Configure React Version Target in Compiler

Source: https://react.dev/reference/react-compiler/configuration

Specifies the React version (17, 18, or 19) to ensure generated code compatibility. React 18 and earlier versions require the react-compiler-runtime package to be installed separately.

```javascript
// For React 18 projects

{
  target: '18' // Also requires react-compiler-runtime package
}
```

--------------------------------

### Taint Unique Value in React

Source: https://react.dev/reference/react/experimental_taintUniqueValue

Demonstrates how to use experimental_taintUniqueValue to mark a sensitive value as tainted, preventing it from being passed to Client Components. This example shows tainting a password string with a custom error message.

```javascript
import {experimental_taintUniqueValue} from 'react';

const password = 'correct horse battery staple';

experimental_taintUniqueValue(
  'Do not pass the password to the client.',
  globalThis,
  password
);

const uppercasePassword = password.toUpperCase() // `uppercasePassword` is not tainted
```

--------------------------------

### Handle Input Events in React with onBeforeInput

Source: https://react.dev/reference/react-dom/components/common

This example shows how to use the `onBeforeInput` event handler in React on an input element. The associated event object `e` includes specific `InputEvent` properties, such as `data`, which provides the data being entered.

```jsx
<input onBeforeInput={e => console.log('onBeforeInput')} />
```

--------------------------------

### Convert HTML to Valid JSX Syntax

Source: https://react.dev/learn/describing-the-ui

Demonstrates converting invalid HTML markup to valid JSX syntax. Key differences include using className instead of class, self-closing tags with />, wrapping multiple elements in a fragment (<>), and properly closing all tags. This example shows common JSX conversion patterns when migrating existing HTML to React.

```JavaScript
export default function TodoList() {
  return (
    <>
      <h1>Hedy Lamarr's Todos</h1>
      <img
        src="https://i.imgur.com/yXOvdOSs.jpg"
        alt="Hedy Lamarr"
        className="photo"
      />
      <ul>
        <li>Invent new traffic lights</li>
        <li>Rehearse a movie scene</li>
        <li>Improve spectrum technology</li>
      </ul>
    </>
  );
}
```

--------------------------------

### Fix Import Errors - Correct Source Path Resolution

Source: https://react.dev/reference/react-compiler/gating

Shows correct patterns for specifying the source path in gating configuration. Paths can use module resolution aliases, absolute paths from project root, or relative paths depending on your project setup.

```javascript
// ❌ Wrong: Relative to babel.config.js
{
  source: './src/flags',
  importSpecifierName: 'flag'
}

// ✅ Correct: Module resolution path
{
  source: '@myapp/feature-flags',
  importSpecifierName: 'flag'
}

// ✅ Also correct: Absolute path from project root
{
  source: './src/utils/flags',
  importSpecifierName: 'flag'
}
```

--------------------------------

### Initialize State with useState Hook in React

Source: https://react.dev/learn/thinking-in-react

Create state variables in the parent component using React's useState Hook. This example initializes filterText and inStockOnly state in the FilterableProductTable component, which will be passed as props to child components.

```javascript
function FilterableProductTable({ products }) {
  const [filterText, setFilterText] = useState('');
  const [inStockOnly, setInStockOnly] = useState(false);
```

--------------------------------

### React App.js with Conditional Rendering (Unmounting) Sidebar

Source: https://react.dev/reference/react/Activity

A full React `App.js` example demonstrating conditional rendering where the `Sidebar` component is unmounted when `isShowingSidebar` is false. Toggling the sidebar causes its internal state to be lost upon re-rendering.

```jsx
import { useState } from 'react';
import Sidebar from './Sidebar.js';

export default function App() {
  const [isShowingSidebar, setIsShowingSidebar] = useState(true);

  return (
    <>
      {isShowingSidebar && (
        <Sidebar />
      )}

      <main>
        <button onClick={() => setIsShowingSidebar(!isShowingSidebar)}>
          Toggle sidebar
        </button>
        <h1>Main content</h1>
      </main>
    </>
  );
}
```

--------------------------------

### Form Action with function prop

Source: https://react.dev/blog/2024/12/05/react-19

Demonstrates the simplified syntax for using Actions with form elements in React 19. Functions passed to the action prop are automatically treated as Actions, handling form submission and reset without additional setup.

```JavaScript
<form action={actionFunction}>
```

--------------------------------

### Implement a Counter with React useState

Source: https://react.dev/learn/referencing-values-with-refs

This example demonstrates how to create a simple counter component using React's `useState` hook. Changing the state variable `count` via `setCount` triggers a re-render of the component, updating the displayed value on the UI.

```javascript
import { useState } from 'react';

export default function Counter() {
  const [count, setCount] = useState(0);

  function handleClick() {
    setCount(count + 1);
  }

  return (
    <button onClick={handleClick}>
      You clicked {count} times
    </button>
  );
}
```

--------------------------------

### React App with Toggleable Chat Room using Empty useEffect Dependencies

Source: https://react.dev/learn/lifecycle-of-reactive-effects

This example demonstrates a complete React application where a `ChatRoom` component with an `useEffect` hook (using empty dependencies) is conditionally rendered. The `App` component manages the visibility of the `ChatRoom` using `useState`, showcasing how the effect connects and disconnects as the component mounts and unmounts.

```javascript
import { useState, useEffect } from 'react';
import { createConnection } from './chat.js';

const serverUrl = 'https://localhost:1234';
const roomId = 'general';

function ChatRoom() {
  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => connection.disconnect();
  }, []);
  return <h1>Welcome to the {roomId} room!</h1>;
}

export default function App() {
  const [show, setShow] = useState(false);
  return (
    <>
      <button onClick={() => setShow(!show)}>
        {show ? 'Close chat' : 'Open chat'}
      </button>
      {show && <hr />}
      {show && <ChatRoom />}
    </>
  );
}
```

--------------------------------

### Handle Product Purchase with Event Handler in React

Source: https://react.dev/learn/synchronizing-with-effects

This JavaScript function demonstrates the correct way to handle user-triggered actions like purchasing a product. The `fetch` POST request is placed within an event handler (e.g., for a button click), ensuring that the action is performed only once and directly in response to a specific user interaction, not as a side effect of component rendering.

```javascript
  function handleClick() {  

    // ✅ Buying is an event because it is caused by a particular interaction.  

    fetch('/api/buy', { method: 'POST' });  

  }
```

--------------------------------

### Configure Testing Environment with IS_REACT_ACT_ENVIRONMENT

Source: https://react.dev/blog/2022/03/08/react-18-upgrade-guide

Set up the global IS_REACT_ACT_ENVIRONMENT flag in test setup files to configure React for unit testing environments. This tells React to log helpful warnings if updates aren't wrapped with act(). Set to true for unit tests or false for end-to-end tests simulating full browser environments.

```javascript
// In your test setup file

globalThis.IS_REACT_ACT_ENVIRONMENT = true;
```

--------------------------------

### resumeAndPrerenderToNodeStream - Node.js Streams (Experimental)

Source: https://react.dev/reference/react-dom/static

Experimental API that continues a prerendered React tree to static HTML with a Node.js Stream. Available in Node.js environments only and recommended for server-side rendering.

```APIDOC
## resumeAndPrerenderToNodeStream (Experimental)

### Description
Continues a prerendered React tree to static HTML with a Node.js Stream.

### Method
Function

### Environment
Node.js environments with Node.js Streams support

### Status
Experimental - API may change in future releases

### Parameters
#### Input Parameters
- **component** (React.ReactNode) - Required - The React component tree to resume and render
- **options** (object) - Optional - Configuration options for rendering

### Returns
- **Stream** - A Node.js Stream containing the static HTML

### Notes
- Experimental API subject to change
- Builds upon prerendered content to generate final HTML
- Recommended for Node.js environments
- Better performance than Web Streams compatibility layer
```

--------------------------------

### Wrap Client Component with Suspense for Promise Resolution (React)

Source: https://react.dev/reference/react/use

This example shows a Client Component (`MessageContainer`) that orchestrates the display of a message while handling loading states. It wraps the `Message` component, which consumes a promise via the `use` API, with `Suspense` to provide a loading fallback.

```javascript
"use client";

import { use, Suspense } from "react";

function Message({ messagePromise }) {
  const messageContent = use(messagePromise);
  return <p>Here is the message: {messageContent}</p>;
}

export function MessageContainer({ messagePromise }) {
  return (
    <Suspense fallback={<p>⌛Downloading message...</p>}>
      <Message messagePromise={messagePromise} />
    </Suspense>
  );
}
```

--------------------------------

### cacheSignal() - Get Cache Abort Signal

Source: https://react.dev/reference/react/cacheSignal

Returns an AbortSignal that is aborted when React finishes rendering. Use this signal with fetch requests and async operations to cancel work that is no longer needed after rendering completes.

```APIDOC
## cacheSignal()

### Description
Returns an AbortSignal for use during React Server Component rendering. The signal is aborted when React finishes rendering, allowing cancellation of in-flight requests and async work.

### Usage Context
React Server Components only. Returns `null` in Client Components and when called outside of rendering.

### Parameters
This function does not accept any parameters.

### Returns
- **AbortSignal | null** - Returns an AbortSignal if called during rendering, otherwise returns null

### Request Example
```javascript
import { cacheSignal } from 'react';

async function Component() {
  const signal = cacheSignal();
  await fetch(url, { signal });
}
```

### Response Behavior
The returned AbortSignal is aborted when:
- React has successfully completed rendering
- The render was aborted
- The render has failed

### Caveats
- Currently for React Server Components only; returns null in Client Components
- Returns null when called outside of rendering context
- Do not assume it will always be null on the client in future versions
- Cannot abort async work started outside of rendering
```

--------------------------------

### Compare JavaScript Primitive Values

Source: https://react.dev/learn/removing-effect-dependencies

This example demonstrates how JavaScript compares primitive values like strings by their content, not by reference. This behavior is crucial for understanding why primitive values are safe and predictable dependencies for React's useEffect hook.

```javascript
// During the first render
const roomId1 = 'music';

// During the next render
const roomId2 = 'music';

// These two strings are the same!
console.log(Object.is(roomId1, roomId2)); // true
```

--------------------------------

### Basic Unoptimized Component Re-rendering Example

Source: https://react.dev/reference/react/useDeferredValue

Shows a basic text input with a slow component that re-renders on every keystroke without optimization. The SlowList receives new props with each input change, causing janky typing experience.

```JavaScript
function App() {
  const [text, setText] = useState('');
  return (
    <>
      <input value={text} onChange={e => setText(e.target.value)} />
      <SlowList text={text} />
    </>
  );
}
```

--------------------------------

### Hydrate Server-Rendered React App with hydrateRoot

Source: https://react.dev/reference/react-dom/client/createRoot

Proper setup for hydrating server-rendered HTML in React applications. Uses hydrateRoot instead of createRoot to attach event handlers and interactivity to existing server-generated DOM without recreating it. Prevents performance issues like lost focus, scroll positions, and user input.

```javascript
import { hydrateRoot } from 'react-dom/client';

import App from './App.js';


hydrateRoot(
  document.getElementById('root'),
  <App />
);
```

--------------------------------

### Default Target Configuration - React 19

Source: https://react.dev/reference/react-compiler/target

Default configuration for React 19, which requires no additional setup. The compiler automatically uses React 19's built-in runtime APIs without requiring the react-compiler-runtime package.

```javascript
{
  // defaults to target: '19'
}
```

--------------------------------

### Apply CSS for Basic Fade-in Styling

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

This CSS snippet provides basic styling for a 'welcome' element, including color, padding, text alignment, and font size. While not directly implementing the fade-in animation itself, it sets up the visual foundation for the element that would be animated, often in conjunction with CSS animations or transitions.

```css
.welcome {
  color: white;
  padding: 50px;
  text-align: center;
  font-size: 50px;
}
```

--------------------------------

### Preconnect in Event Handler with react-dom

Source: https://react.dev/reference/react-dom/preconnect

Demonstrates calling preconnect within an event handler before navigating to a new page or state that requires external resources. This approach starts the connection process earlier than waiting for component rendering, improving perceived performance.

```JavaScript
import { preconnect } from 'react-dom';

function CallToAction() {
  const onClick = () => {
    preconnect('http://example.com');
    startWizard();
  }
  return (
    <button onClick={onClick}>Start Wizard</button>
  );
}
```

--------------------------------

### Create and render multiple React roots on same page

Source: https://react.dev/reference/react-dom/client/createRoot

Creates separate React roots for different DOM nodes and renders distinct components into each. Useful when integrating React into partially React-built pages. Uses createRoot to initialize roots and render() to display components.

```javascript
import './styles.css';
import { createRoot } from 'react-dom/client';
import { Comments, Navigation } from './Components.js';

const navDomNode = document.getElementById('navigation');
const navRoot = createRoot(navDomNode);
navRoot.render(<Navigation />);

const commentDomNode = document.getElementById('comments');
const commentRoot = createRoot(commentDomNode);
commentRoot.render(<Comments />);
```

--------------------------------

### Migrate act import from react-dom/test-utils to react

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Move the act function import from react-dom/test-utils to the react package. This change simplifies testing utilities and consolidates the API surface. Use the provided codemod for automated migration.

```JavaScript
- import {act} from 'react-dom/test-utils'
+ import {act} from 'react';
```

```Bash
npx codemod@latest react/19/replace-act-import
```

--------------------------------

### Node.js Handler for Resuming React Server-Side Rendering

Source: https://react.dev/reference/react-dom/server/resumeToPipeableStream

This example illustrates a complete Node.js handler function that utilizes `resumeToPipeableStream` to render a pre-rendered React application. It imports necessary modules, retrieves the `postponedState`, and uses the `onShellReady` callback to pipe the generated HTML stream to the HTTP response, enabling efficient streaming of the React application's content.

```javascript
import { resume } from 'react-dom/server';

import {getPostponedState} from './storage';



async function handler(request, response) {

  const postponed = await getPostponedState(request);

  const {pipe} = resumeToPipeableStream(<App />, postponed, {

    onShellReady: () => {

      pipe(response);

    }

  });

}
```

--------------------------------

### Update react-server-dom-turbopack with npm

Source: https://react.dev/blog/2025/12/03/critical-security-vulnerability-in-react-server-components

Install the latest versions of React, React DOM, and react-server-dom-turbopack packages using npm. This updates the Turbopack bundler integration for React Server Components to the latest secure version.

```shell
npm install react@latest react-dom@latest react-server-dom-turbopack@latest
```

--------------------------------

### Install React 18 Release Candidate using npm

Source: https://react.dev/blog/2021/12/17/react-conf-2021-recap

This command upgrades your project's React and React DOM dependencies to the Release Candidate (RC) version of React 18. This allows developers to test new features and provide feedback before the stable release.

```bash
npm install react@rc react-dom@rc
```

--------------------------------

### Valid React Compiler Configuration

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/config

Example of correct React Compiler configuration with valid option names and appropriate values. This configuration follows the lint rule requirements and will compile without validation errors.

```javascript
// ✅ Valid compiler configuration
module.exports = {
  plugins: [
    ['babel-plugin-react-compiler', {
      compilationMode: 'infer',
      panicThreshold: 'critical_errors'
    }]
  ]
};
```

--------------------------------

### Import and Consume React Context in a Component

Source: https://react.dev/reference/react/createContext

This example shows a functional component (`Button.js`) importing a previously exported context (`ThemeContext`) and consuming its current value using the `useContext` hook. This allows the component to react to context changes without prop drilling.

```javascript
// Button.js

import { ThemeContext } from './Contexts.js';



function Button() {

  const theme = useContext(ThemeContext);

  // ...

}
```

--------------------------------

### Update react-server-dom-webpack with npm

Source: https://react.dev/blog/2025/12/03/critical-security-vulnerability-in-react-server-components

Install the latest versions of React, React DOM, and react-server-dom-webpack packages using npm. This updates the Webpack bundler integration for React Server Components to the latest secure version.

```shell
npm install react@latest react-dom@latest react-server-dom-webpack@latest
```

--------------------------------

### Create an Express.js API Endpoint for File Content

Source: https://react.dev/reference/rsc/server-components

This Node.js Express server-side snippet defines an API route to asynchronously read and serve content from a local markdown file based on the request parameter. It supports the client-side data fetching example by providing the content.

```javascript
// api.js  
app.get(`/api/content/:page`, async (req, res) => {  
  const page = req.params.page;  
  const content = await file.readFile(`${page}.md`);  
  res.send({content});  
});
```

--------------------------------

### Import Default Export with Arbitrary Name

Source: https://react.dev/learn/importing-and-exporting-components

Demonstrates that when importing a default export, you can use any name you want. This example imports the Button component's default export but names it 'Banana', which will still receive the same default export functionality.

```javascript
import Banana from './Button.js';
```

--------------------------------

### Import and apply React memo to a functional component

Source: https://react.dev/reference/react/memo

This example demonstrates how to import `memo` from 'react' and wrap a functional component, `SomeComponent`, to create a memoized version. The memoized component will prevent re-renders if its props remain unchanged, relying on a shallow comparison by default.

```javascript
import { memo } from 'react';

const SomeComponent = memo(function SomeComponent(props) {
  // ...
});
```

--------------------------------

### Create custom React component with createElement

Source: https://react.dev/reference/react/createElement

Creates a custom React component by passing a component function as the type parameter to createElement instead of a string. This allows rendering of custom components with props. The example renders a Greeting component with a name prop.

```javascript
export default function App() {
  return createElement(Greeting, { name: 'Taylor' });
}
```

--------------------------------

### React Compiler: Incremental Adoption

Source: https://react.dev/reference/react-compiler/configuration

Explains how to incrementally adopt the React Compiler by initially targeting specific directories or only functions explicitly marked for optimization.

```APIDOC
## Common Configuration Pattern: Incremental Adoption

### Description
This pattern allows for a gradual rollout of the React Compiler by initially limiting its scope. You can start by only compiling functions explicitly marked for optimization or targeting specific parts of your codebase, expanding coverage over time.

### Method
Babel Plugin Configuration

### Endpoint
`babel-plugin-react-compiler` options object

### Parameters
#### Request Body
- **compilationMode** (string) - Required - Sets the compilation strategy for incremental adoption.
  - **'annotation'**: Only compile functions explicitly marked with `"use memo"` or similar directives.

### Request Example
```json
{
  "compilationMode": "annotation"
}
```

### Response
#### Success Response (N/A)
Compiler is active, but its optimizations are limited to annotated functions or specified scopes.

#### Response Example
N/A
```

--------------------------------

### Pass Asset Map via `bootstrapScriptContent` for Client Hydration (Node.js/React)

Source: https://react.dev/reference/react-dom/static/prerender

This server-side example shows how to serialize the `assetMap` and inject it directly into the HTML stream using the `bootstrapScriptContent` option. This makes the `assetMap` available globally on the client-side before hydration, ensuring both client and server use the same asset paths.

```javascript
// You'd need to get this JSON from your build tooling.  
const assetMap = {  
  'styles.css': '/styles.123456.css',  
  'main.js': '/main.123456.js'  
};  
  
async function handler(request) {  
  const {prelude} = await prerender(<App assetMap={assetMap} />, {  
    // Careful: It's safe to stringify() this because this data isn't user-generated.  
    bootstrapScriptContent: `window.assetMap = ${JSON.stringify(assetMap)};`,  
    bootstrapScripts: [assetMap['/main.js']],  
  });  
  return new Response(prelude, {  
    headers: { 'content-type': 'text/html' },  
  });  
}
```

--------------------------------

### Complete React Application with useContext and Context Provider

Source: https://react.dev/reference/react/useContext

A comprehensive example demonstrating the entire flow of React Context: creating a context, providing a default value, using a `Provider` to override that value, and consuming it in deeply nested components (`Panel`, `Button`) via the `useContext` hook. This eliminates prop drilling for shared data like themes.

```javascript
import { createContext, useContext } from 'react';

const ThemeContext = createContext(null);

export default function MyApp() {
  return (
    <ThemeContext value="dark">
      <Form />
    </ThemeContext>
  )
}

function Form() {
  return (
    <Panel title="Welcome">
      <Button>Sign up</Button>
      <Button>Log in</Button>
    </Panel>
  );
}

function Panel({ title, children }) {
  const theme = useContext(ThemeContext);
  const className = 'panel-' + theme;
  return (
    <section className={className}>
      <h1>{title}</h1>
      {children}
    </section>
  )
}

function Button({ children }) {
  const theme = useContext(ThemeContext);
  const className = 'button-' + theme;
  return (
    <button className={className}>
      {children}
    </button>
  );
}
```

--------------------------------

### Event Listener Subscription with Cleanup

Source: https://react.dev/learn/synchronizing-with-effects

Demonstrates subscribing to window events with proper cleanup. The cleanup function removes the event listener, ensuring only one active subscription exists at any time. This pattern maintains the same behavior across development and production environments.

```JavaScript
useEffect(() => {
  function handleScroll(e) {
    console.log(window.scrollX, window.scrollY);
  }
  window.addEventListener('scroll', handleScroll);
  return () => window.removeEventListener('scroll', handleScroll);
}, []);
```

--------------------------------

### Node.js Express API for Client-Side Data Fetching

Source: https://react.dev/reference/rsc/server-components

This Node.js code illustrates simple Express.js API endpoints (`/api/notes/:id`, `/api/authors/:id`) that serve note and author data from a database. These endpoints are designed to be consumed by client-side components making `fetch` requests, as shown in the previous example.

```javascript

// api  
import db from './database';  

app.get(`/api/notes/:id`, async (req, res) => {  
  const note = await db.notes.get(id);  
  res.send({note});  
});  

app.get(`/api/authors/:id`, async (req, res) => {  
  const author = await db.authors.get(id);  
  res.send({author});  
});
```

--------------------------------

### Example JSON Product Data Structure

Source: https://react.dev/learn/thinking-in-react

This JSON array represents a typical data structure for product information, often received from an API. It serves as the input data model for building a React user interface, demonstrating fields like category, price, stock status, and product name.

```json
[
  { "category": "Fruits", "price": "$1", "stocked": true, "name": "Apple" },
  { "category": "Fruits", "price": "$1", "stocked": true, "name": "Dragonfruit" },
  { "category": "Fruits", "price": "$2", "stocked": false, "name": "Passionfruit" },
  { "category": "Vegetables", "price": "$2", "stocked": true, "name": "Spinach" },
  { "category": "Vegetables", "price": "$4", "stocked": false, "name": "Pumpkin" },
  { "category": "Vegetables", "price": "$1", "stocked": true, "name": "Peas" }
]
```

--------------------------------

### Replace ReactDOM.findDOMNode with useRef

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Migrate from the legacy findDOMNode method to React refs using useRef hook. This provides better performance, enables proper refactoring, and maintains abstraction levels. The ref-based approach is more explicit and type-safe.

```JavaScript
// Before
import {findDOMNode} from 'react-dom';

function AutoselectingInput() {
  useEffect(() => {
    const input = findDOMNode(this);
    input.select()
  }, []);
  return <input defaultValue="Hello" />;
}

// After
function AutoselectingInput() {
  const ref = useRef(null);
  useEffect(() => {
    ref.current.select();
  }, []);
  return <input ref={ref} defaultValue="Hello" />
}
```

--------------------------------

### Handle unsound element.props access with codemod

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Runs an additional codemod to migrate unsound access patterns to element.props in React 19 TypeScript files. Use this when the main preset-19 codemod doesn't cover all element.props related issues.

```bash
npx types-react-codemod@latest react-element-default-any-props ./path-to-your-react-ts-files
```

--------------------------------

### React App.js using Activity Boundary for Sidebar State Preservation

Source: https://react.dev/reference/react/Activity

An updated `App.js` example demonstrating the use of the `Activity` component to wrap the `Sidebar`. This ensures that the `Sidebar`'s internal state is preserved when it's hidden and later revealed, without being unmounted.

```jsx
import { Activity, useState } from 'react';

import Sidebar from './Sidebar.js';

export default function App() {
  const [isShowingSidebar, setIsShowingSidebar] = useState(true);

  return (
    <>
      <Activity mode={isShowingSidebar ? 'visible' : 'hidden'}>
        <Sidebar />
      </Activity>

      <main>
        <button onClick={() => setIsShowingSidebar(!isShowingSidebar)}>
          Toggle sidebar
        </button>
        <h1>Main content</h1>
      </main>
    </>
  );
}
```

--------------------------------

### Initiate Partial Pre-rendering with `prerender` in React DOM

Source: https://react.dev/blog/2025/10/01/react-19-2

The `prerender` API enables pre-rendering static parts of a React application ahead of time for serving from a CDN, while allowing dynamic content to be filled in later. It takes a React element and an `AbortController` signal, returning a `prelude` (the static shell) and a `postponed` state that can be saved for later resumption.

```javascript
const {prelude, postponed} = await prerender(<App />, {
  signal: controller.signal,
});

// Save the postponed state for later
await savePostponedState(postponed);

// Send prelude to client or CDN.
```

--------------------------------

### Update react-server-dom-parcel with npm

Source: https://react.dev/blog/2025/12/03/critical-security-vulnerability-in-react-server-components

Install the latest versions of React, React DOM, and react-server-dom-parcel packages using npm. This updates the Parcel bundler integration for React Server Components to the latest secure version.

```shell
npm install react@latest react-dom@latest react-server-dom-parcel@latest
```

--------------------------------

### Preinit an ESM Module within a React Component (JSX)

Source: https://react.dev/reference/react-dom/preinitModule

This example shows how to import and use `preinitModule` within a React functional component. Calling `preinitModule` during the component's rendering phase allows for eager fetching and evaluation of an ESM module if its usage is anticipated by the component or its children. The module will be executed as soon as it finishes downloading.

```jsx
import { preinitModule } from 'react-dom';  
  
function AppRoot() {  
  preinitModule("https://example.com/module.js", {as: "script"});  
  // ...  
}
```

--------------------------------

### Render React <link> Component for Favicon

Source: https://react.dev/reference/react-dom/components/link

This example demonstrates rendering the React `<link>` component to specify a favicon for the web page. It uses `rel="icon"` to define the relationship and `href` to point to the icon file, which React will typically place in the document's `<head>`.

```html
<link rel="icon" href="favicon.ico" />
```

--------------------------------

### createRoot(domNode, options?)

Source: https://react.dev/reference/react-dom/client/createRoot

Initializes a React root in a specified browser DOM node, enabling React to manage its content. This is the entry point for rendering client-side React applications.

```APIDOC
## Function: `createRoot(domNode, options?)`

### Description
Call `createRoot` to create a React root for displaying content inside a browser DOM element. React will create a root for the `domNode`, and take over managing the DOM inside it. After you’ve created a root, you need to call `root.render` to display a React component inside of it.

### Parameters
#### Arguments
- **domNode** (DOM element) - Required - A DOM element. React will create a root for this DOM element and allow you to call functions on the root, such as `render` to display rendered React content.
- **options** (object) - Optional - An object with options for this React root.
    - **onCaughtError** (function) - Optional - Callback called when React catches an error in an Error Boundary. Called with the `error` caught by the Error Boundary, and an `errorInfo` object containing the `componentStack`.
    - **onUncaughtError** (function) - Optional - Callback called when an error is thrown and not caught by an Error Boundary. Called with the `error` that was thrown, and an `errorInfo` object containing the `componentStack`.
    - **onRecoverableError** (function) - Optional - Callback called when React automatically recovers from errors. Called with an `error` React throws, and an `errorInfo` object containing the `componentStack`. Some recoverable errors may include the original error cause as `error.cause`.
    - **identifierPrefix** (string) - Optional - A string prefix React uses for IDs generated by `useId`. Useful to avoid conflicts when using multiple roots on the same page.

### Request Example
```javascript
import { createRoot } from 'react-dom/client';

const domNode = document.getElementById('root');
const root = createRoot(domNode);
// You would then call root.render() to display content
```

### Response
#### Return Value
`createRoot` returns an object with two methods: `render` and `unmount`.

#### Response Example
```json
{
  "methods": ["render", "unmount"]
}
```
```

--------------------------------

### Pass Non-String Values to Custom HTML Element

Source: https://react.dev/reference/react-dom/components

Shows how non-string JavaScript values passed to custom elements are serialized by default. This example demonstrates passing an array value that will be converted to a string representation using the toString() method.

```jsx
<my-element value={[1,2,3]}></my-element>
```

--------------------------------

### Update State with Setter Function

Source: https://react.dev/learn/state-a-components-memory

Use the setter function (setIndex in this example) to update state values. Calling the setter function updates the state variable and triggers React to re-render the component with the new data.

```javascript
function handleClick() {
  setIndex(index + 1);
}
```

--------------------------------

### React Browser Output with Nested Components

Source: https://react.dev/learn/your-first-component

Shows the final HTML output that the browser renders when React components are nested. Demonstrates how the Gallery parent component renders multiple Profile child components, each containing img elements.

```html
<section>
  <h1>Amazing scientists</h1>
  <img src="https://i.imgur.com/MK3eW3As.jpg" alt="Katherine Johnson" />
  <img src="https://i.imgur.com/MK3eW3As.jpg" alt="Katherine Johnson" />
  <img src="https://i.imgur.com/MK3eW3As.jpg" alt="Katherine Johnson" />
</section>
```

--------------------------------

### Apply Default React Compiler Inference Mode

Source: https://react.dev/reference/react-compiler/compilationMode

This section illustrates how to set `compilationMode` to `'infer'`, which is the default. It provides examples of functions that will be compiled based on React's naming conventions and hook usage, as well as functions that will be skipped.

```json
{
  compilationMode: 'infer'
}
```

```javascript
// ✅ Compiled: Named like a component + returns JSX  
function Button(props) {  
  return <button>{props.label}</button>;  
}  
  
// ✅ Compiled: Named like a hook + calls hooks  
function useCounter() {  
  const [count, setCount] = useState(0);  
  return [count, setCount];  
}  
  
// ✅ Compiled: Explicit directive  
function expensiveCalculation(data) {  
  "use memo";  
  return data.reduce(/* ... */);  
}  
  
// ❌ Not compiled: Not a component/hook pattern  
function calculateTotal(items) {  
  return items.reduce((a, b) => a + b, 0);  
}
```

--------------------------------

### Render Lists of Components in React

Source: https://react.dev/learn/describing-the-ui

Explains how to display multiple similar components from a collection of data. It demonstrates using JavaScript's `map()` method to transform an array of data into an array of React components, emphasizing the critical role of the `key` prop for efficient list rendering and reconciliation.

```javascript
import { people } from './data.js';
import { getImageUrl } from './utils.js';

export default function List() {
  const listItems = people.map(person =>
    <li key={person.id}>
      <img
        src={getImageUrl(person)}
        alt={person.name}
      />
      <p>
        <b>{person.name}:</b>
        {' ' + person.profession + ' '}
        known for {person.accomplishment}
      </p>
    </li>
  );
  return (
    <article>
      <h1>Scientists</h1>
      <ul>{listItems}</ul>
    </article>
  );
}
```

--------------------------------

### Implement React Tic-Tac-Toe Game Logic and UI (App.js)

Source: https://react.dev/learn/tutorial-tic-tac-toe

This comprehensive React application defines the full Tic-Tac-Toe game. It consists of a `Square` component for rendering individual game cells, a `Board` component responsible for displaying the 3x3 grid and managing click events, and a `Game` component that orchestrates the overall game flow, including turn tracking, move history, and rendering the current game state. A `calculateWinner` utility function is included to determine if a player has achieved a winning combination on the board.

```javascript
import { useState } from 'react';

function Square({ value, onSquareClick }) {
  return (
    <button className="square" onClick={onSquareClick}>
      {value}
    </button>
  );
}

function Board({ xIsNext, squares, onPlay }) {
  function handleClick(i) {
    if (calculateWinner(squares) || squares[i]) {
      return;
    }
    const nextSquares = squares.slice();
    if (xIsNext) {
      nextSquares[i] = 'X';
    } else {
      nextSquares[i] = 'O';
    }
    onPlay(nextSquares);
  }

  const winner = calculateWinner(squares);
  let status;
  if (winner) {
    status = 'Winner: ' + winner;
  } else {
    status = 'Next player: ' + (xIsNext ? 'X' : 'O');
  }

  return (
    <>
      <div className="status">{status}</div>
      <div className="board-row">
        <Square value={squares[0]} onSquareClick={() => handleClick(0)} />
        <Square value={squares[1]} onSquareClick={() => handleClick(1)} />
        <Square value={squares[2]} onSquareClick={() => handleClick(2)} />
      </div>
      <div className="board-row">
        <Square value={squares[3]} onSquareClick={() => handleClick(3)} />
        <Square value={squares[4]} onSquareClick={() => handleClick(4)} />
        <Square value={squares[5]} onSquareClick={() => handleClick(5)} />
      </div>
      <div className="board-row">
        <Square value={squares[6]} onSquareClick={() => handleClick(6)} />
        <Square value={squares[7]} onSquareClick={() => handleClick(7)} />
        <Square value={squares[8]} onSquareClick={() => handleClick(8)} />
      </div>
    </>
  );
}

export default function Game() {
  const [xIsNext, setXIsNext] = useState(true);
  const [history, setHistory] = useState([Array(9).fill(null)]);
  const currentSquares = history[history.length - 1];

  function handlePlay(nextSquares) {
    setHistory([...history, nextSquares]);
    setXIsNext(!xIsNext);
  }

  return (
    <div className="game">
      <div className="game-board">
        <Board xIsNext={xIsNext} squares={currentSquares} onPlay={handlePlay} />
      </div>
      <div className="game-info">
        <ol>{/*TODO*/}</ol>
      </div>
    </div>
  );
}

function calculateWinner(squares) {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}
```

--------------------------------

### Basic React App Component Structure without View Transitions

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

This React JavaScript snippet presents a simple `App` component that conditionally renders `Home` or `TalkDetails` based on the current URL. This example explicitly notes that it does not yet include any animation logic for transitions between views.

```javascript
import TalkDetails from './Details'; import Home from './Home'; import {useRouter} from './router';

export default function App() {
  const {url} = useRouter();

  // 🚩This version doesn't include any animations yet
  return url === '/' ? <Home /> : <TalkDetails />;
}
```

--------------------------------

### Correctly Running React Effect Once on Mount

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/exhaustive-deps

These examples demonstrate two valid patterns for running a `useEffect` hook once on mount while adhering to the `exhaustive-deps` rule. The recommended approach is to include all dependencies, allowing the effect to re-run if they change. Alternatively, a `useRef` guard can be used to explicitly ensure the effect runs only once, even if dependencies are present.

```javascript
// ✅ Include dependency  
useEffect(() => {  
  sendAnalytics(userId);  
}, [userId]);
```

```javascript
// ✅ Or use a ref guard inside an effect  
const sent = useRef(false);  
  
useEffect(() => {  
  if (sent.current) {  
    return;  
  }  
  
  sent.current = true;  
  sendAnalytics(userId);  
}, [userId]);
```

--------------------------------

### Simplified startTransition Implementation Pattern

Source: https://react.dev/reference/react/useTransition

Shows the conceptual implementation of how React's startTransition works internally. Demonstrates how isInsideTransition flag is used to distinguish between Transition and urgent state updates.

```javascript
let isInsideTransition = false;

function startTransition(scope) {
  isInsideTransition = true;
  scope();
  isInsideTransition = false;
}

function setState() {
  if (isInsideTransition) {
    // ... schedule a Transition state update ...
  } else {
    // ... schedule an urgent state update ...
  }
}
```

--------------------------------

### React useEffect for Dynamic Resource Synchronization with Dependency Array

Source: https://react.dev/learn/escape-hatches

This React example demonstrates a `ChatRoom` component that uses the `useEffect` hook to manage a connection to a chat server. The effect establishes a connection when the component mounts or when the `roomId` prop changes, and disconnects when the component unmounts or before the effect re-runs. The `App` component showcases how to dynamically change the `roomId` via a dropdown, triggering the `useEffect` to re-synchronize the chat connection.

```jsx
import { useState, useEffect } from 'react';
import { createConnection } from './chat.js';

const serverUrl = 'https://localhost:1234';

function ChatRoom({ roomId }) {
  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => connection.disconnect();
  }, [roomId]);

  return <h1>Welcome to the {roomId} room!</h1>;
}

export default function App() {
  const [roomId, setRoomId] = useState('general');
  return (
    <>
      <label>
        Choose the chat room:{' '}
        <select
          value={roomId}
          onChange={e => setRoomId(e.target.value)}
        >
          <option value="general">general</option>
          <option value="travel">travel</option>
          <option value="music">music</option>
        </select>
      </label>
      <hr />
      <ChatRoom roomId={roomId} />
    </>
  );
}

```

--------------------------------

### Invalid Gating Configuration - Missing Required Fields

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/gating

Demonstrates an invalid gating configuration where the 'source' field is missing from the gating object. The gating configuration requires both 'importSpecifierName' and 'source' properties to be valid. This example shows a common error when setting up selective component compilation.

```javascript
module.exports = {
  plugins: [
    ['babel-plugin-react-compiler', {
      gating: {
        importSpecifierName: '__experimental_useCompiler'
        // Missing 'source' field
      }
    }]
  ]
};
```

--------------------------------

### Suspense with Albums Component Example

Source: https://react.dev/reference/react/Suspense

Demonstrates a practical implementation where an ArtistPage component uses Suspense to display a loading spinner while the Albums component fetches and renders data. The Loading component shows a placeholder until album data is ready, then React automatically displays the Albums component with fetched data.

```jsx
import { Suspense } from 'react';
import Albums from './Albums.js';

export default function ArtistPage({ artist }) {
  return (
    <>
      <h1>{artist.name}</h1>
      <Suspense fallback={<Loading />}>
        <Albums artistId={artist.id} />
      </Suspense>
    </>
  );
}

function Loading() {
  return <h2>🌀 Loading...</h2>;
}
```

--------------------------------

### Create React root with dynamically created DOM node

Source: https://react.dev/reference/react-dom/client/createRoot

Creates a new DOM node programmatically using document.createElement(), initializes a React root, renders a component into it, and appends it to the document body. Allows flexible placement of React components anywhere in the DOM.

```javascript
const domNode = document.createElement('div');

const root = createRoot(domNode);

root.render(<Comment />);

document.body.appendChild(domNode);
```

--------------------------------

### Attach ref to JSX element in React

Source: https://react.dev/learn/manipulating-the-dom-with-refs

Pass the ref as the ref attribute to a JSX element to get access to its underlying DOM node. React will populate myRef.current with the DOM node reference when the component mounts.

```javascript
<div ref={myRef}>
```

--------------------------------

### Client-Side Rendering Alternative

Source: https://react.dev/reference/react-dom/server/renderToString

Shows how to properly render React components to HTML on the client without importing react-dom/server, which unnecessarily increases bundle size. Uses createRoot and flushSync instead.

```APIDOC
## Client-Side HTML Rendering

### Description
When you need to render a React component to HTML string on the client, avoid using renderToString as it increases bundle size. Instead, use createRoot and read from the DOM.

### Incorrect Approach (Not Recommended)
```javascript
// ❌ Unnecessary: importing react-dom/server on the client
import { renderToString } from 'react-dom/server';

const html = renderToString(<MyIcon />);
console.log(html); // For example, "<svg>...</svg>"
```

### Correct Approach
```javascript
import { createRoot } from 'react-dom/client';
import { flushSync } from 'react-dom';

const div = document.createElement('div');
const root = createRoot(div);

flushSync(() => {
  root.render(<MyIcon />);
});

console.log(div.innerHTML); // For example, "<svg>...</svg>"
```

### Important
- The `flushSync` call is necessary to ensure the DOM is updated before reading the `innerHTML` property
- This approach avoids importing server-only code on the client
- Results in smaller bundle size
```

--------------------------------

### Handle Data Loading with Suspense for prerenderToNodeStream (React)

Source: https://react.dev/reference/react-dom/static/prerenderToNodeStream

This example illustrates how `prerenderToNodeStream` automatically waits for all Suspense-enabled components to resolve their data before finalizing the static HTML output. The `ProfilePage` component uses a `<Suspense>` boundary to wait for the `<Posts />` component, ensuring its content is included in the initial HTML.

```jsx
function ProfilePage() {  
  return (  
    <ProfileLayout>  
      <ProfileCover />  
      <Sidebar>  
        <Friends />  
        <Photos />  
      </Sidebar>  
      <Suspense fallback={<PostsGlimmer />}>  
        <Posts />  
      </Suspense>  
    </ProfileLayout>  
  );  
}
```

--------------------------------

### Implement a Counter (without re-render) with React useRef

Source: https://react.dev/learn/referencing-values-with-refs

This example illustrates an incorrect use of `useRef` for a UI-dependent counter. While `ref.current` can be mutated, changing its value does not trigger a component re-render, meaning the UI will not update to reflect the new count.

```javascript
import { useRef } from 'react';

export default function Counter() {
  let countRef = useRef(0);

  function handleClick() {
    // This doesn't re-render the component!
    countRef.current = countRef.current + 1;
  }

  return (
    <button onClick={handleClick}>
      You clicked {countRef.current} times
    </button>
  );
}
```

--------------------------------

### Good: React application initialization at module level

Source: https://react.dev/learn/you-might-not-need-an-effect

This pattern demonstrates running application-wide initialization logic at the module level, before the `App` component renders. It includes a check (`typeof window !== 'undefined'`) to ensure the code only executes in a browser environment, preventing issues during server-side rendering. This method guarantees that functions like `checkAuthToken()` and `loadDataFromLocalStorage()` run only once when the module is imported, making it suitable for truly global, one-time setup.

```javascript
if (typeof window !== 'undefined') { // Check if we're running in the browser.  
   // ✅ Only runs once per app load  
  checkAuthToken();  
  loadDataFromLocalStorage();  
}  
  
function App() {  
  // ...  
}
```

--------------------------------

### Call React `resumeAndPrerender` to get HTML stream and postpone state

Source: https://react.dev/reference/react-dom/static/resumeAndPrerender

This code demonstrates the basic asynchronous invocation of React's `resumeAndPrerender` function. It destructures the returned object to obtain the `prelude` Web Stream, which contains the rendered HTML, and the `postpone` object, which holds the current state for potential future resumptions.

```javascript
const { prelude,postpone } = await resumeAndPrerender(reactNode, postponedState, options?)
```

--------------------------------

### Demonstrating React `useEffect` with `roomId` dependency

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

This snippet illustrates a common use case for the React `useEffect` hook, managing a connection based on a `roomId`. It shows how to connect to a service when the component mounts or `roomId` changes, and disconnect using the cleanup function. The description highlights the distinction between viewing effects from a component's lifecycle perspective versus the effect's own perspective.

```javascript
useEffect(() => {

  // Your Effect connected to the room specified with roomId...

  const connection = createConnection(serverUrl, roomId);

  connection.connect();

  return () => {

    // ...until it disconnected

    connection.disconnect();

  };

}, [roomId]);
```

--------------------------------

### Read Resource Values with use() API in React

Source: https://react.dev/reference/react/apis

The `use()` API enables components to read values from resources like Promises or context without storing them in state. This example demonstrates reading both a message from a Promise and theme information from context within a component.

```jsx
function MessageComponent({ messagePromise }) {
  const message = use(messagePromise);
  const theme = use(ThemeContext);
  // ...
}
```

--------------------------------

### Migrate Module Pattern Factories to Regular Functions

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Convert module pattern factories (deprecated v16.9.0) that return render objects to standard function components. This pattern was rarely used and increased bundle size unnecessarily.

```javascript
// Before
function FactoryComponent() {
  return { render() { return <div />; } }
}
```

```javascript
// After
function FactoryComponent() {
  return <div />;
}
```

--------------------------------

### Development Debugging with panicThreshold - JavaScript/React

Source: https://react.dev/reference/react-compiler/panicThreshold

Shows how to configure panicThreshold dynamically for development and production environments. Includes environment-based threshold switching and a logger callback to capture compiler errors during development for debugging purposes.

```javascript
const isDevelopment = process.env.NODE_ENV === 'development';

{
  panicThreshold: isDevelopment ? 'critical_errors' : 'none',
  logger: {
    logEvent(filename, event) {
      if (isDevelopment && event.kind === 'CompileError') {
        // ...
      }
    }
  }
}
```

--------------------------------

### Focus Input on Component Mount - React useRef and useEffect

Source: https://react.dev/learn/synchronizing-with-effects

Demonstrates using useRef to get a reference to a DOM element and useEffect to call the focus() method when the component mounts. The commented code shows a common mistake: calling focus() directly in the component body runs after every render, not just on mount. The solution wraps the focus() call in useEffect with an empty dependency array to ensure it runs only once when the component first appears on screen.

```javascript
import { useEffect, useRef } from 'react';

export default function MyInput({ value, onChange }) {
  const ref = useRef(null);

  // TODO: This doesn't quite work. Fix it.
  // ref.current.focus()

  return (
    <input
      ref={ref}
      value={value}
      onChange={onChange}
    />
  );
}
```

--------------------------------

### Demonstrate Impure React Component Behavior

Source: https://react.dev/learn/describing-the-ui

Illustrates an example of an impure React component where a global variable (`guest`) is modified directly within the component's render logic. This demonstrates a common anti-pattern that leads to unpredictable behavior and makes components harder to test and debug, violating the principle of pure functions.

```javascript
let guest = 0;

function Cup() {
  // Bad: changing a preexisting variable!
  guest = guest + 1;
  return <h2>Tea cup for guest #{guest}</h2>;
}

export default function TeaSet() {
  return (
    <>
      <Cup />
      <Cup />
      <Cup />
    </>
  );
}
```

--------------------------------

### Complete React Tic-Tac-Toe App.js After Initial State Lift

Source: https://react.dev/learn/tutorial-tic-tac-toe

This comprehensive snippet presents the `App.js` file after lifting the state of the Tic-Tac-Toe board to the `Board` component. It includes the `useState` hook for board state and the `Square` component receiving its value via props. This demonstrates the initial state management refactor, centralizing game logic in the parent `Board` component.

```javascript
import { useState } from 'react';

function Square({ value }) {
  return <button className="square">{value}</button>;
}

export default function Board() {
  const [squares, setSquares] = useState(Array(9).fill(null));
  return (
    <>
      <div className="board-row">
        <Square value={squares[0]} />
        <Square value={squares[1]} />
        <Square value={squares[2]} />
      </div>
      <div className="board-row">
        <Square value={squares[3]} />
        <Square value={squares[4]} />
        <Square value={squares[5]} />
      </div>
      <div className="board-row">
        <Square value={squares[6]} />
        <Square value={squares[7]} />
        <Square value={squares[8]} />
      </div>
    </>
  );
}
```

--------------------------------

### Capturing Owner Stack within a React Component

Source: https://react.dev/reference/react/captureOwnerStack

This example shows how to use `React.captureOwnerStack()` within a functional React component. It demonstrates conditionally calling the function only in development mode (`process.env.NODE_ENV !== 'production'`) and logging the resulting owner stack to the console.

```javascript
import * as React from 'react';

function Component() {
  if (process.env.NODE_ENV !== 'production') {
    const ownerStack = React.captureOwnerStack();
    console.log(ownerStack);
  }
}
```

--------------------------------

### Basic Routing with useState in React

Source: https://react.dev/blog/2025/02/14/sunsetting-create-react-app

Demonstrates a simple routing implementation using React's useState hook to switch between components. This approach is limited as it doesn't create shareable URLs and becomes difficult to maintain as the app grows. Each route change only updates state without updating the browser URL.

```javascript
import {useState} from 'react';

import Home from './Home';
import Dashboard from './Dashboard';

export default function App() {
  // ❌ Routing in state does not create URLs
  const [route, setRoute] = useState('home');
  return (
    <div>
      {route === 'home' && <Home />}
      {route === 'dashboard' && <Dashboard />}
    </div>
  )
}
```

--------------------------------

### Browser Support Information

Source: https://react.dev/reference/react-dom/client

Compatibility information for React DOM client APIs across different browser versions. React supports all popular browsers with polyfills available for older browser versions.

```APIDOC
## Browser Support

### Supported Browsers
React supports all popular browsers, including:
- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Internet Explorer 9 and above

### Legacy Browser Support
For older browsers such as IE 9 and IE 10, polyfills are required:

```javascript
// Example polyfill setup for IE 9+
import 'react-polyfill';
import { createRoot } from 'react-dom/client';
```

### Compatibility Notes
- IE 9 and IE 10 require additional polyfills for full React functionality
- Modern browsers have built-in support for all React features
- Test your application across target browsers before deployment
```

--------------------------------

### Conditional Activity Rendering with ViewTransition in React

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Shows a basic example of using Activity components within ViewTransition to conditionally render different pages based on the current URL. The Home component displays when on the root path, while Details pages are rendered in hidden mode for pre-rendering. This pattern enables smooth page transitions with pre-loaded content.

```javascript
<ViewTransition>
  <Activity mode={url === '/' ? 'visible' : 'hidden'}>
    <Home />
  </Activity>
  <Activity mode={url === '/details/1' ? 'visible' : 'hidden'}>
    <Details id={id} />
  </Activity>
  <Activity mode={url === '/details/1' ? 'visible' : 'hidden'}>
    <Details id={id} />
  </Activity>
</ViewTransition>
```

--------------------------------

### Logical AND Operator for Conditional Rendering

Source: https://react.dev/learn/conditional-rendering

Demonstrates using the && operator to render JSX only when a condition is true, rendering nothing otherwise. This is useful for simple cases where you want to show or hide a single element. The example conditionally renders a checkmark only when isPacked is true.

```JavaScript
return (
  <li className="item">
    {name} {isPacked && '✅'}
  </li>
);
```

--------------------------------

### PureComponent with Conditional Props Rendering

Source: https://react.dev/reference/react/PureComponent

Demonstrates a PureComponent that only re-renders when specific props change. In this example, the Greeting component re-renders when the 'name' prop updates but skips re-rendering when unrelated props like 'address' change in the parent component.

```jsx
import { PureComponent, useState } from 'react';

class Greeting extends PureComponent {
  render() {
    console.log("Greeting was rendered at", new Date().toLocaleTimeString());
    return <h3>Hello{this.props.name && ', '}{this.props.name}!</h3>;
  }
}

export default function MyApp() {
  const [name, setName] = useState('');
  const [address, setAddress] = useState('');
  return (
    <>
      <label>
        Name{': '}
        <input value={name} onChange={e => setName(e.target.value)} />
      </label>
      <label>
        Address{': '}
        <input value={address} onChange={e => setAddress(e.target.value)} />
      </label>
      <Greeting name={name} />
    </>
  );
}
```

--------------------------------

### Basic React Component for Displaying Count Prop

Source: https://react.dev/reference/react/useState

This simple React functional component, `CountLabel`, accepts a `count` prop and renders its value within an `<h1>` tag. It serves as a foundational example before introducing stateful logic.

```jsx
export default function CountLabel({ count }) {  
  return <h1>{count}</h1>  
}
```

--------------------------------

### Demonstrating Correct React Hook Dependency Arrays

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/exhaustive-deps

These examples show the correct way to specify dependency arrays for React hooks like `useEffect`. By including all referenced variables in the dependency array, the hook ensures that effects re-run whenever those dependencies change, preventing stale closures.

```javascript
// ✅ All dependencies included  
useEffect(() => {  
  console.log(count);  
}, [count]);  
  
// ✅ All dependencies included  
useEffect(() => {  
  fetchUser(userId);  
}, [userId]);
```

--------------------------------

### Optimized Data Fetching with Route Loaders

Source: https://react.dev/blog/2025/02/14/sunsetting-create-react-app

Demonstrates the recommended approach for data fetching using route loaders with a data fetching library. The loader function fetches data before the route renders, enabling parallel fetching of data and route code. This pattern reduces time to content visibility and improves user experience by eliminating network waterfalls.

```javascript
export async function loader() {
  const response = await fetch(`/api/data`);
  const data = await response.json();
  return data;
}

// ✅ Fetching data in parallel while the code is downloading
export default function Dashboard({loaderData}) {
  return (
    <div>
      {loaderData.map(item => <div key={item.id}>{item.name}</div>)}
    </div>
  )
}
```

--------------------------------

### Complete ChatRoom Component with Non-Reactive Dependencies

Source: https://react.dev/learn/removing-effect-dependencies

A complete working example of a ChatRoom component where both serverUrl and roomId are declared as constants outside the component. This allows the useEffect to have an empty dependency array since neither value is reactive or changes between renders.

```javascript
import { useState, useEffect } from 'react';
import { createConnection } from './chat.js';

const serverUrl = 'https://localhost:1234';
const roomId = 'music';

export default function ChatRoom() {
  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => connection.disconnect();
  }, []);
  return <h1>Welcome to the {roomId} room!</h1>;
}
```

--------------------------------

### Migrate String Refs to Ref Callbacks

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Replace string refs (deprecated v16.3.0) with ref callback functions in class components. String refs have multiple downsides and are removed in React 19 to simplify the API.

```javascript
// Before
class MyComponent extends React.Component {
  componentDidMount() {
    this.refs.input.focus();
  }

  render() {
    return <input ref='input' />;
  }
}
```

```javascript
// After
class MyComponent extends React.Component {
  componentDidMount() {
    this.input.focus();
  }

  render() {
    return <input ref={input => this.input = input} />;
  }
}
```

--------------------------------

### Creating React Root with createRoot API

Source: https://react.dev/blog/2022/03/29/react-v18

Illustrates the new createRoot method exported from react-dom/client for creating a root element to render or unmount. This replaces ReactDOM.render and is required for accessing new React 18 features. The method accepts an onRecoverableError callback option for error logging during rendering.

```javascript
import { createRoot } from 'react-dom/client';

const container = document.getElementById('root');
const root = createRoot(container);
root.render(<App />);
```

--------------------------------

### Creating Pure React Components for a Recipe Display

Source: https://react.dev/learn/keeping-components-pure

This example showcases pure React components for displaying a recipe. The `Recipe` component renders JSX based solely on its `drinkers` prop, ensuring consistent output for the same input. The `App` component demonstrates its usage by rendering the recipe for different numbers of servings.

```javascript
function Recipe({ drinkers }) {
  return (
    <ol>    
      <li>Boil {drinkers} cups of water.</li>
      <li>Add {drinkers} spoons of tea and {0.5 * drinkers} spoons of spice.</li>
      <li>Add {0.5 * drinkers} cups of milk to boil and sugar to taste.</li>
    </ol>
  );
}

export default function App() {
  return (
    <section>
      <h1>Spiced Chai Recipe</h1>
      <h2>For two</h2>
      <Recipe drinkers={2} />
      <h2>For a gathering</h2>
      <Recipe drinkers={4} />
    </section>
  );
}
```

--------------------------------

### Fix root.render() Second Argument Error in React

Source: https://react.dev/link/hydration-mismatch

Demonstrates the common mistake of passing options to root.render() instead of hydrateRoot(). The root.render() method only accepts one argument (the React node), while hydrateRoot() accepts options as a third parameter. This example shows both the incorrect and correct approaches for hydrating server-rendered HTML with error handling options.

```javascript
// 🚩 Wrong: root.render only takes one argument.
root.render(App, {onUncaughtError});

// ✅ Correct: pass options to hydrateRoot.
const root = hydrateRoot(container, <App />, {onUncaughtError});
```

--------------------------------

### Complete Fruit and Vegetable Picker Form in React

Source: https://react.dev/reference/react-dom/components/select

Full working example combining single and multiple select boxes in a React component. Demonstrates managing multiple state variables (selectedFruit and selectedVegs), handling both single and multiple selections, and displaying selected values. Includes proper label associations and output rendering.

```jsx
import { useState } from 'react';

export default function FruitPicker() {
  const [selectedFruit, setSelectedFruit] = useState('orange');
  const [selectedVegs, setSelectedVegs] = useState(['corn', 'tomato']);
  return (
    <>
      <label>
        Pick a fruit:
        <select
          value={selectedFruit}
          onChange={e => setSelectedFruit(e.target.value)}
        >
          <option value="apple">Apple</option>
          <option value="banana">Banana</option>
          <option value="orange">Orange</option>
        </select>
      </label>
      <hr />
      <label>
        Pick all your favorite vegetables:
        <select
          multiple={true}
          value={selectedVegs}
          onChange={e => {
            const options = [...e.target.selectedOptions];
            const values = options.map(option => option.value);
            setSelectedVegs(values);
          }}
        >
          <option value="cucumber">Cucumber</option>
          <option value="corn">Corn</option>
          <option value="tomato">Tomato</option>
        </select>
      </label>
      <hr />
      <p>Your favorite fruit: {selectedFruit}</p>
      <p>Your favorite vegetables: {selectedVegs.join(', ')}</p>
    </>
  );
}
```

--------------------------------

### Optimizing React components by removing manual useMemo with React Compiler

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/preserve-manual-memoization

This example illustrates how to refactor a React component by removing manual `useMemo` when using React Compiler. The initial code uses `useMemo` for sorting, while the optimized version removes it, relying on the compiler to handle the memoization efficiently.

```javascript
// Do I still need this?  
function Component({items, sortBy}) {  
  const sorted = useMemo(() => {  
    return [...items].sort((a, b) => {  
      return a[sortBy] - b[sortBy];  
    });  
  }, [items, sortBy]);  
  
  return <List items={sorted} />;  
}
```

```javascript
// ✅ Better: Let the compiler optimize  
function Component({items, sortBy}) {  
  const sorted = [...items].sort((a, b) => {  
    return a[sortBy] - b[sortBy];  
  });  
  
  return <List items={sorted} />;  
}
```

--------------------------------

### Adding a Transition Type within React's startTransition

Source: https://react.dev/reference/react/addTransitionType

This example shows the basic usage of `addTransitionType` within `startTransition` to associate a specific type ('my-transition-type') with a state update, allowing for later identification and customization of the transition's behavior.

```javascript
startTransition(() => {  
  addTransitionType('my-transition-type');  
  setState(newState);  
});
```

--------------------------------

### useDeferredValue with useState in SearchPage Component

Source: https://react.dev/reference/react/useDeferredValue

Shows a complete example of using useDeferredValue with useState in a SearchPage component. The hook defers a query value to prevent unnecessary re-renders, allowing the UI to remain responsive while processing search results in the background.

```javascript
import { useState, useDeferredValue } from 'react';

function SearchPage() {
  const [query, setQuery] = useState('');
  const deferredQuery = useDeferredValue(query);
  // ...
}
```

--------------------------------

### Async Server Components with Suspense and Data Fetching

Source: https://react.dev/index

Demonstrates Next.js full-stack pattern using async server components for data fetching from database and Suspense boundaries for loading states. The component fetches conference data and talks asynchronously, passing videos to child components.

```JavaScript
import { db } from './database.js';
import { Suspense } from 'react';

async function ConferencePage({ slug }) {
  const conf = await db.Confs.find({ slug });
  return (
    <ConferenceLayout conf={conf}>
      <Suspense fallback={<TalksLoading />}>
        <Talks confId={conf.id} />
      </Suspense>
    </ConferenceLayout>
  );
}

async function Talks({ confId }) {
  const talks = await db.Talks.findAll({ confId });
  const videos = talks.map(talk => talk.video);
  return <SearchableVideoList videos={videos} />;
}
```

--------------------------------

### Multi-Line JSX Return with Parentheses

Source: https://react.dev/learn/your-first-component

Shows the required syntax for returning JSX markup that spans multiple lines. When markup extends beyond the return keyword, it must be wrapped in parentheses to prevent JavaScript from ignoring code on subsequent lines.

```jsx
return (
  <div>
    <img src="https://i.imgur.com/MK3eW3As.jpg" alt="Katherine Johnson" />
  </div>
);
```

--------------------------------

### useTransition Hook for Managing Async State Updates

Source: https://react.dev/reference/react/useTransition

Example of using useTransition to handle async state updates with proper pending state tracking. Demonstrates wrapping async operations in startTransition to manage loading states and handle race conditions with multiple rapid updates.

```javascript
import { useState, useTransition } from "react";
import { updateQuantity } from "./api";
import Item from "./Item";
import Total from "./Total";

export default function App({}) {
  const [quantity, setQuantity] = useState(1);
  const [isPending, startTransition] = useTransition();
  const [clientQuantity, setClientQuantity] = useState(1);

  const updateQuantityAction = newQuantity => {
    setClientQuantity(newQuantity);

    startTransition(async () => {
      const savedQuantity = await updateQuantity(newQuantity);
      startTransition(() => {
        setQuantity(savedQuantity);
      });
    });
  };

  return (
    <div>
      <h1>Checkout</h1>
      <Item action={updateQuantityAction}/>
      <hr />
      <Total clientQuantity={clientQuantity} savedQuantity={quantity} isPending={isPending} />
    </div>
  );
}
```

--------------------------------

### React Effect with Different Dependencies Execution

Source: https://react.dev/learn/synchronizing-with-effects

Demonstrates Effect execution when dependencies change. React detects the difference using Object.is() comparison, runs cleanup from the previous Effect, then executes the new Effect with updated dependencies.

```javascript
// Effect for the third render (roomId = "travel")
() => {
  const connection = createConnection('travel');
  connection.connect();
  return () => connection.disconnect();
},
// Dependencies for the third render (roomId = "travel")
['travel']
```

--------------------------------

### Avatar Component with Dynamic Styling in React

Source: https://react.dev/reference/react-dom/components/common

Complete Avatar component example showing how to combine className and inline style attributes. Demonstrates passing user data as props and applying both static and dynamic styles to render an image with size and appearance based on component props.

```javascript
export default function Avatar({ user }) {
  return (
    <img
      src={user.imageUrl}
      alt={'Photo of ' + user.name}
      className="avatar"
      style={{
        width: user.imageSize,
        height: user.imageSize
      }}
    />
  );
}
```

--------------------------------

### Sync Non-React Widget State with useEffect

Source: https://react.dev/learn/synchronizing-with-effects

Demonstrates syncing a non-React widget property with React state using useEffect. In this example, a map component's zoom level is synchronized with React state. No cleanup is needed since calling setZoomLevel twice with the same value is idempotent.

```JavaScript
useEffect(() => {
  const map = mapRef.current;
  map.setZoomLevel(zoomLevel);
}, [zoomLevel]);
```

--------------------------------

### Optimize React Re-renders with shouldComponentUpdate

Source: https://react.dev/reference/react/Component

Provides an example of implementing `shouldComponentUpdate` to prevent unnecessary re-renders in a React class component. The method manually compares `nextProps` and `nextState` with current props and state, returning `false` if no relevant changes are detected.

```javascript
class Rectangle extends Component {  

  state = {  

    isHovered: false  

  };  

  

  shouldComponentUpdate(nextProps, nextState) {  

    if (  

      nextProps.position.x === this.props.position.x &&  

      nextProps.position.y === this.props.position.y &&  

      nextProps.size.width === this.props.size.width &&  

      nextProps.size.height === this.props.size.height &&  

      nextState.isHovered === this.state.isHovered  

    ) {  

      // Nothing has changed, so a re-render is unnecessary  

      return false;  

    }  

    return true;  

  }  

  

  // ...  

}
```

--------------------------------

### Best Practice: External Store Subscription with useSyncExternalStore

Source: https://react.dev/learn/you-might-not-need-an-effect

Demonstrates the recommended approach using useSyncExternalStore Hook to subscribe to external data stores like navigator.onLine. This built-in Hook handles subscription management, server-side rendering, and prevents common pitfalls associated with manual Effect-based subscriptions.

```javascript
function subscribe(callback) {
  window.addEventListener('online', callback);
  window.addEventListener('offline', callback);
  return () => {
    window.removeEventListener('online', callback);
    window.removeEventListener('offline', callback);
  };
}

function useOnlineStatus() {
  // ✅ Good: Subscribing to an external store with a built-in Hook
  return useSyncExternalStore(
    subscribe, // React won't resubscribe for as long as you pass the same function
    () => navigator.onLine, // How to get the value on the client
    () => true // How to get the value on the server
  );
}

function ChatIndicator() {
  const isOnline = useOnlineStatus();
  // ...
}
```

--------------------------------

### useEffect Without Dependency Array Anti-Pattern

Source: https://react.dev/reference/react/useEffect

Example of incorrect useEffect usage that causes the effect to run after every component re-render. Demonstrates the common mistake of omitting the dependency array parameter, which results in excessive effect execution.

```javascript
useEffect(() => {
  // ...
}); // 🚩 No dependency array: re-runs after every commit!
```

--------------------------------

### Best Practice: Extracting purpose-driven custom Hooks in React

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

This example illustrates the ideal way to abstract complex logic into custom Hooks. Instead of generic 'lifecycle' Hooks, `useChatRoom` and `useImpressionLog` are named after their specific, high-level purposes, making the calling component more declarative, readable, and constraining the Hook's functionality to a clear use case.

```javascript
function ChatRoom({ roomId }) {  
  const [serverUrl, setServerUrl] = useState('https://localhost:1234');  
  
  // ✅ Great: custom Hooks named after their purpose  
  useChatRoom({ serverUrl, roomId });  
  useImpressionLog('visit_chat', { roomId });  
  // ...  
}
```

--------------------------------

### Define Function Inside React Component for Effect Setup (Problematic)

Source: https://react.dev/reference/react/useCallback

Illustrates a common pattern where a helper function (`createOptions`) is defined within a React component and then called inside a `useEffect`. If this helper function is declared as a dependency of the effect, it will cause the effect to re-run on every render because the function reference changes, potentially leading to performance issues or infinite loops.

```javascript
function ChatRoom({ roomId }) {  
  const [message, setMessage] = useState('');  
  
  function createOptions() {  
    return {  
      serverUrl: 'https://localhost:1234',  
      roomId: roomId  
    };  
  }  
  
  useEffect(() => {  
    const options = createOptions();  
    const connection = createConnection(options);  
    connection.connect();  
    // ...
  }, [createOptions]); // 🔴 Problem: This dependency changes on every render  
  // ...
```

--------------------------------

### Conditionally Rendering (Unmounting) React Components

Source: https://react.dev/reference/react/Activity

This common React pattern conditionally renders a component. If the condition becomes false, the component is unmounted, destroying its internal state. This example shows how a `Sidebar` component is rendered only when `isShowingSidebar` is true.

```jsx
{isShowingSidebar && (

  <Sidebar />  

)}
```

--------------------------------

### Basic TodoList Component with Child List

Source: https://react.dev/reference/react/useMemo

A TodoList component that renders a List child component with visibleTodos as a prop. This example demonstrates the default React behavior where parent re-renders cause all child components to re-render recursively, even when their props haven't changed.

```javascript
export default function TodoList({ todos, tab, theme }) {
  // ...
  return (
    <div className={theme}>
      <List items={visibleTodos} />
    </div>
  );
}
```

--------------------------------

### Minimize React Props Changes with useMemo

Source: https://react.dev/reference/react/memo

To effectively use `memo`, props passed to the component should be minimized to change as infrequently as possible. This example shows how to use `useMemo` to create an object prop (`person`) only when its dependencies (`name`, `age`) change, preventing unnecessary re-renders of the memoized `Profile` component due to new object references.

```javascript
function Page() {  
  const [name, setName] = useState('Taylor');  
  const [age, setAge] = useState(42);  

  const person = useMemo(  
    () => ({ name, age }),  
    [name, age]  
  );  

  return <Profile person={person} />;  
}  

const Profile = memo(function Profile({ person }) {  
  // ...  
});
```

--------------------------------

### Demonstrating Memoization Breakage with `useForm().watch()` in React

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/incompatible-library

This example illustrates how using `useForm().watch()` inside a `useMemo` hook leads to a 'frozen' UI. The `watch` function exhibits interior mutability, meaning its internal state can change without `watch` itself changing referentially, thus preventing `useMemo` from re-evaluating.

```javascript
function Form() {  
  const { watch } = useForm();  
  
  // ❌ This value will never update, even when 'name' field changes  
  const name = useMemo(() => watch('name'), [watch]);  
  
  return <div>Name: {name}</div>; // UI appears "frozen"  
}
```

--------------------------------

### Define Context providers using <Context> in React 19

Source: https://react.dev/blog/2024/04/25/react-19

Illustrates the streamlined syntax in React 19 for defining Context providers, enabling the direct rendering of `<Context>` with a `value` prop instead of the verbose `<Context.Provider>`. This update aims to simplify context creation and usage within applications.

```javascript
const ThemeContext = createContext('');

function App({children}) {
  return (
    <ThemeContext value="dark">
      {children}
    </ThemeContext>
  );
}
```

--------------------------------

### Optimistically Updating Forms with useOptimistic

Source: https://react.dev/reference/react/useOptimistic

Complete example showing how to use useOptimistic for form submissions with immediate UI feedback. Demonstrates message sending with a 'Sending...' indicator that appears optimistically before server confirmation. Uses startTransition for background async operations and formRef for form reset.

```javascript
import { useOptimistic, useState, useRef, startTransition } from "react";
import { deliverMessage } from "./actions.js";

function Thread({ messages, sendMessageAction }) {
  const formRef = useRef();
  function formAction(formData) {
    addOptimisticMessage(formData.get("message"));
    formRef.current.reset();
    startTransition(async () => {
      await sendMessageAction(formData);
    });
  }
  const [optimisticMessages, addOptimisticMessage] = useOptimistic(
    messages,
    (state, newMessage) => [
      {
        text: newMessage,
        sending: true
      },
      ...state,
    ]
  );

  return (
    <>
      <form action={formAction} ref={formRef}>
        <input type="text" name="message" placeholder="Hello!" />
        <button type="submit">Send</button>
      </form>
      {optimisticMessages.map((message, index) => (
        <div key={index}>
          {message.text}
          {!!message.sending && <small> (Sending...)</small>}
        </div>
      ))}
    </>
  );
}

export default function App() {
  const [messages, setMessages] = useState([
    { text: "Hello there!", sending: false, key: 1 }
  ]);
  async function sendMessageAction(formData) {
    const sentMessage = await deliverMessage(formData.get("message"));
    startTransition(() => {
      setMessages((messages) => [{ text: sentMessage }, ...messages]);
    })
  }
  return <Thread messages={messages} sendMessageAction={sendMessageAction} />;
}
```

--------------------------------

### View Rendered Output of a React Server Component

Source: https://react.dev/reference/rsc/server-components

This HTML snippet demonstrates the final output sent to the client after a Server Component has processed and rendered static content. It shows that only the resulting HTML, stripped of original component logic or expensive libraries, is delivered.

```html
<div><!-- html for markdown --></div>
```

--------------------------------

### useActionState with Form Action - React

Source: https://react.dev/reference/react/useActionState

Complete example showing how to implement useActionState with an async action function that increments state. The Hook is called at the component top level and the returned formAction is passed to a form button via the formAction prop.

```javascript
import { useActionState } from "react";

async function increment(previousState, formData) {
  return previousState + 1;
}

function StatefulForm({}) {
  const [state, formAction] = useActionState(increment, 0);
  return (
    <form>
      {state}
      <button formAction={formAction}>Increment</button>
    </form>
  )
}
```

--------------------------------

### Set Document Title in React Component

Source: https://react.dev/reference/react-dom/components/title

Shows how to use the <title> component within a functional React component to set the page title. The example demonstrates rendering <title> alongside other page content, with React automatically managing its placement in the document head.

```jsx
import ShowRenderedHTML from './ShowRenderedHTML.js';

export default function ContactUsPage() {
  return (
    <ShowRenderedHTML>
      <title>My Site: Contact Us</title>
      <h1>Contact Us</h1>
      <p>Email us at support@example.com</p>
    </ShowRenderedHTML>
  );
}
```

--------------------------------

### Animate Element on Enter/Exit with ViewTransition

Source: https://react.dev/reference/react/ViewTransition

Demonstrates a complete example of triggering enter/exit animations when a ViewTransition component is added or removed. Uses useState and startTransition to toggle a child component, which activates enter animation on render and exit animation on removal.

```jsx
import {
  ViewTransition,
  useState,
  startTransition
} from 'react';
import {Video} from "./Video";
import videos from "./data"

function Item() {
  return (
    <ViewTransition>
      <Video video={videos[0]}/>
    </ViewTransition>
  );
}

export default function Component() {
  const [showItem, setShowItem] = useState(false);
  return (
    <>
      <button
        onClick={() => {
          startTransition(() => {
            setShowItem((prev) => !prev);
          });
        }}
      >{showItem ? '➖' : '➕'}</button>

      {showItem ? <Item /> : null}
    </>
  );
}
```

--------------------------------

### Migrate Legacy Context to Modern Context API

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Replace deprecated Legacy Context APIs (contextTypes, getChildContext) with React.createContext and contextType. Legacy Context was deprecated in v16.6.0 and removed in React 19 due to subtle bugs and performance concerns.

```javascript
// Before
import PropTypes from 'prop-types';

class Parent extends React.Component {
  static childContextTypes = {
    foo: PropTypes.string.isRequired,
  };

  getChildContext() {
    return { foo: 'bar' };
  }

  render() {
    return <Child />;
  }
}

class Child extends React.Component {
  static contextTypes = {
    foo: PropTypes.string.isRequired,
  };

  render() {
    return <div>{this.context.foo}</div>;
  }
}
```

```javascript
// After
const FooContext = React.createContext();

class Parent extends React.Component {
  render() {
    return (
      <FooContext.Provider value='bar'>
        <Child />
      </FooContext.Provider>
    );
  }
}

class Child extends React.Component {
  static contextType = FooContext;

  render() {
    return <div>{this.context}</div>;
  }
}
```

--------------------------------

### Create Custom Hook with useSyncExternalStore in React

Source: https://react.dev/reference/react/useSyncExternalStore

Demonstrates how to create a custom Hook that wraps useSyncExternalStore to track external state like network online status. This approach allows multiple components to reuse the same store connection logic without duplication.

```javascript
import { useSyncExternalStore } from 'react';

export function useOnlineStatus() {
  const isOnline = useSyncExternalStore(subscribe, getSnapshot);
  return isOnline;
}

function getSnapshot() {
  // ...
}

function subscribe(callback) {
  // ...
}
```

--------------------------------

### Customize ViewTransition Animation Duration with CSS

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Customizes the ViewTransition cross-fade animation by defining a named animation in CSS using view transition pseudo-elements. The example slows down the fade animation to 500ms by targeting ::view-transition-old and ::view-transition-new classes.

```javascript
import { ViewTransition } from "react";
import Details from "./Details";
import Home from "./Home";
import { useRouter } from "./router";

export default function App() {
  const { url } = useRouter();

  // Define a default animation of .slow-fade.
  // See animations.css for the animation definition.
  return (
    <ViewTransition default="slow-fade">
      {url === '/' ? <Home /> : <Details />}
    </ViewTransition>
  );
}
```

```css
::view-transition-old(.slow-fade) {
    animation-duration: 500ms;
}

::view-transition-new(.slow-fade) {
    animation-duration: 500ms;
}
```

--------------------------------

### Tab component without Suspense in React

Source: https://react.dev/reference/react/Activity

Shows a tabs example where React must hydrate the entire page at once. If Home or Video components are slow to render, tab buttons become unresponsive during hydration. This demonstrates the performance problem that Suspense and Activity boundaries solve.

```JavaScript
function Page() {
  const [activeTab, setActiveTab] = useState('home');
  return (
    <>
      <TabButton onClick={() => setActiveTab('home')}>
        Home
      </TabButton>
      <TabButton onClick={() => setActiveTab('video')}>
        Video
      </TabButton>
      {activeTab === 'home' && (
        <Home />
      )}
      {activeTab === 'video' && (
        <Video />
      )}
    </>
  )
}
```

--------------------------------

### Complete React Tic-Tac-Toe App.js with State Management

Source: https://react.dev/learn/tutorial-tic-tac-toe

This comprehensive code block presents the full `App.js` file, integrating the stateful `Square` component and the updated `Board` component. It demonstrates how `useState` enables each `Square` to manage its own 'X' or 'O' state independently, forming the foundation of a functional Tic-Tac-Toe game.

```javascript
import { useState } from 'react';

function Square() {
  const [value, setValue] = useState(null);

  function handleClick() {
    setValue('X');
  }

  return (
    <button
      className="square"
      onClick={handleClick}
    >
      {value}
    </button>
  );
}

export default function Board() {
  return (
    <>
      <div className="board-row">
        <Square />
        <Square />
        <Square />
      </div>
      <div className="board-row">
        <Square />
        <Square />
        <Square />
      </div>
      <div className="board-row">
        <Square />
        <Square />
        <Square />
      </div>
    </>
  );
}

```

--------------------------------

### Update element.ref to element.props.ref in React 19

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

React 19 now treats ref as a regular prop instead of a special property. Access refs through element.props.ref instead of element.ref to avoid deprecation warnings and prepare for future versions.

```JavaScript
// Before
const ref = element.ref;

// After
const ref = element.props.ref;
```

--------------------------------

### Use JavaScript Variables in JSX with Curly Braces

Source: https://react.dev/learn/describing-the-ui

Illustrates how to embed JavaScript expressions within JSX using curly braces. The example shows accessing object properties for dynamic content and inline styles, demonstrating how to reference variables, apply conditional logic, and bind dynamic data to JSX elements.

```JavaScript
const person = {
  name: 'Gregorio Y. Zara',
  theme: {
    backgroundColor: 'black',
    color: 'pink'
  }
};

export default function TodoList() {
  return (
    <div style={person.theme}>
      <h1>{person.name}'s Todos</h1>
      <img
        className="avatar"
        src="https://i.imgur.com/7vQD0fPs.jpg"
        alt="Gregorio Y. Zara"
      />
      <ul>
        <li>Improve the videophone</li>
        <li>Prepare aeronautics lectures</li>
        <li>Work on the alcohol-fuelled engine</li>
      </ul>
    </div>
  );
}
```

--------------------------------

### Migrate TypeScript types to React 19 using codemod

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Uses the types-react-codemod tool to automatically migrate deprecated TypeScript types and breaking changes to React 19. Run this command in your project root to apply the preset-19 migration rules.

```bash
npx types-react-codemod@latest preset-19 ./path-to-app
```

--------------------------------

### Complete Filterable Product Table with React State Management

Source: https://react.dev/learn/thinking-in-react

Full implementation of a filterable product table demonstrating state initialization, prop passing, and component composition. Includes FilterableProductTable parent component managing state, SearchBar for input, and ProductTable for rendering filtered products with category rows.

```javascript
import { useState } from 'react';

function FilterableProductTable({ products }) {
  const [filterText, setFilterText] = useState('');
  const [inStockOnly, setInStockOnly] = useState(false);

  return (
    <div>
      <SearchBar
        filterText={filterText}
        inStockOnly={inStockOnly} />
      <ProductTable
        products={products}
        filterText={filterText}
        inStockOnly={inStockOnly} />
    </div>
  );
}

function ProductCategoryRow({ category }) {
  return (
    <tr>
      <th colSpan="2">
        {category}
      </th>
    </tr>
  );
}

function ProductRow({ product }) {
  const name = product.stocked ? product.name :
    <span style={{ color: 'red' }}>
      {product.name}
    </span>;

  return (
    <tr>
      <td>{name}</td>
      <td>{product.price}</td>
    </tr>
  );
}

function ProductTable({ products, filterText, inStockOnly }) {
  const rows = [];
  let lastCategory = null;

  products.forEach((product) => {
    if (
      product.name.toLowerCase().indexOf(
        filterText.toLowerCase()
      ) === -1
    ) {
      return;
    }
    if (inStockOnly && !product.stocked) {
      return;
    }
    if (product.category !== lastCategory) {
      rows.push(
        <ProductCategoryRow
          category={product.category}
          key={product.category} />
      );
    }
    rows.push(
      <ProductRow
        product={product}
        key={product.name} />
    );
    lastCategory = product.category;
  });

  return (
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>
  );
}

function SearchBar({ filterText, inStockOnly }) {
  return (
    <form>
      <input
        type="text"
        value={filterText}
        placeholder="Search..." />
      <label>
        <input
          type="checkbox"
          checked={inStockOnly} />
        {' '}
        Only show products in stock
      </label>
    </form>
  );
}
```

--------------------------------

### Complete Controlled Form Component in React

Source: https://react.dev/reference/react-dom/components/input

Full example of a form with multiple controlled inputs (text and number types) managed by separate state variables. Includes conditional rendering based on input values and demonstrates proper state initialization with empty strings and default values.

```JavaScript
import { useState } from 'react';

export default function Form() {
  const [firstName, setFirstName] = useState('');
  const [age, setAge] = useState('20');
  const ageAsNumber = Number(age);
  return (
    <>
      <label>
        First name:
        <input
          value={firstName}
          onChange={e => setFirstName(e.target.value)}
        />
      </label>
      <label>
        Age:
        <input
          value={age}
          onChange={e => setAge(e.target.value)}
          type="number"
        />
        <button onClick={() => setAge(ageAsNumber + 10)}>
          Add 10 years
        </button>
      </label>
      {firstName !== '' &&
        <p>Your name is {firstName}.</p>
      }
      {ageAsNumber > 0 &&
        <p>Your age is {ageAsNumber}.</p>
      }
    </>
  );
}
```

--------------------------------

### Configure default slow-fade animation with ViewTransition in React

Source: https://react.dev/reference/react/ViewTransition

Sets up a ViewTransition component with a custom slow-fade animation lasting 500ms. This example shows how to apply custom animation durations using CSS view transition classes and the default prop.

```JSX
import {
  ViewTransition,
  useState,
  startTransition
} from 'react';
import {Video} from "./Video";
import videos from "./data"

function Item() {
  return (
    <ViewTransition default="slow-fade">
      <Video video={videos[0]}/>
    </ViewTransition>
  );
}

export default function Component() {
  const [showItem, setShowItem] = useState(false);
  return (
    <>
      <button
        onClick={() => {
          startTransition(() => {
            setShowItem((prev) => !prev);
          });
        }}
      >{showItem ? '➖' : '➕'}</button>

      {showItem ? <Item /> : null}
    </>
  );
}
```

```CSS
::view-transition-old(.slow-fade) {
    animation-duration: 500ms;
}

::view-transition-new(.slow-fade) {
    animation-duration: 500ms;
}
```

--------------------------------

### React JSX Task Component Prop Drilling Example

Source: https://react.dev/learn/scaling-up-with-reducer-and-context

Continuing the 'prop drilling' illustration, this JSX fragment shows how a `task` object and event handlers (`onChange`, `onDelete`) are passed from `TaskList` to a further nested `Task` component. This highlights the repetitive nature of passing props through intermediate components.

```javascript
<Task  
  task={task}  
  onChange={onChangeTask}  
  onDelete={onDeleteTask}  
/>
```

--------------------------------

### Invalid HTML to JSX Conversion Challenge

Source: https://react.dev/learn/writing-markup-with-jsx

Example of common JSX mistakes including using HTML class attribute instead of className, improper nesting of semantic tags, and self-closing br tags. Demonstrates the need for conversion from HTML to valid JSX syntax.

```jsx
export default function Bio() {
  return (
    <div class="intro">
      <h1>Welcome to my website!</h1>
    </div>
    <p class="summary">
      You can find my thoughts here.
      <br><br>
      <b>And <i>pictures</b></i> of scientists!
    </p>
  );
}
```

--------------------------------

### Migrate hydrate to hydrateRoot for SSR

Source: https://react.dev/blog/2022/03/08/react-18-upgrade-guide

Update server-side rendering hydration from the deprecated hydrate API to the new hydrateRoot API in React 18. The new API combines container setup and hydration in a single call without requiring a separate root.render() call.

```javascript
// Before
import { hydrate } from 'react-dom';
const container = document.getElementById('app');
hydrate(<App tab="home" />, container);

// After
import { hydrateRoot } from 'react-dom/client';
const container = document.getElementById('app');
const root = hydrateRoot(container, <App tab="home" />);
```

--------------------------------

### React: Use Error Boundary for rendering errors

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/error-boundaries

This example illustrates the correct method for handling errors that arise during React component rendering. By wrapping components with an `ErrorBoundary`, errors thrown within the child components or their hooks are caught. This allows for a graceful fallback UI without crashing the application.

```JavaScript
function Parent() {
  return (
    <ErrorBoundary>
      <ChildComponent />
    </ErrorBoundary>
  );
}
```

--------------------------------

### React Contact Component Demonstrating DOM State Loss

Source: https://react.dev/reference/react/Activity

A simple `Contact` component featuring a `textarea`. When this component is unmounted (e.g., by switching tabs in a traditional setup), any text typed into the `textarea` is lost because its internal DOM state is reset.

```jsx
export default function Contact() {
  return (
    <div>
      <p>Send me a message!</p>

      <textarea />

      <p>You can find me online here:</p>
      <ul>
        <li>admin@mysite.com</li>
        <li>+123456789</li>
      </ul>
    </div>
  );
}
```

--------------------------------

### Displaying Multiple React Component States Simultaneously

Source: https://react.dev/learn/reacting-to-input-with-state

This React component (`App.js`) demonstrates how to render multiple instances of a `Form` component, each with a different `status` prop, to visualize all possible states on a single page. This approach is useful for creating 'living styleguides' or 'storybooks' for UI components, facilitating development and testing.

```javascript
import Form from './Form.js';

let statuses = [
  'empty',
  'typing',
  'submitting',
  'success',
  'error',
];

export default function App() {
  return (
    <>
      {statuses.map(status => (
        <section key={status}>
          <h4>Form ({status}):</h4>
          <Form status={status} />
        </section>
      ))}
    </>
  );
}
```

--------------------------------

### Connect to external system with useEffect Hook

Source: https://react.dev/reference/react/hooks

The useEffect Hook connects a component to external systems and handles synchronization. This example demonstrates setting up a connection to a chat room and properly cleaning up by disconnecting when the component unmounts or roomId changes. The dependency array ensures the effect runs only when roomId changes.

```JavaScript
function ChatRoom({ roomId }) {
  useEffect(() => {
    const connection = createConnection(roomId);
    connection.connect();
    return () => connection.disconnect();
  }, [roomId]);
  // ...
}
```

--------------------------------

### Implementing a Basic Stopwatch with `useState` in React

Source: https://react.dev/learn/referencing-values-with-refs

This React component demonstrates a stopwatch that uses `useState` to track `startTime` and `now`. The `handleStart` function initializes the times and uses `setInterval` to continuously update `now`, thereby re-rendering the component and displaying elapsed time.

```javascript
import { useState } from 'react';

export default function Stopwatch() {
  const [startTime, setStartTime] = useState(null);
  const [now, setNow] = useState(null);

  function handleStart() {
    // Start counting.
    setStartTime(Date.now());
    setNow(Date.now());

    setInterval(() => {
      // Update the current time every 10ms.
      setNow(Date.now());
    }, 10);
  }

  let secondsPassed = 0;
  if (startTime != null && now != null) {
    secondsPassed = (now - startTime) / 1000;
  }

  return (
    <>
      <h1>Time passed: {secondsPassed.toFixed(3)}</h1>
      <button onClick={handleStart}>
        Start
      </button>
    </>
  );
}
```

--------------------------------

### Attempting to Run React Effect Once with Missing Dependencies

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/exhaustive-deps

This example shows an incorrect approach to running a `useEffect` hook only once on mount. Omitting a necessary dependency like `userId` from the array, while intending to run the effect once, violates the `exhaustive-deps` rule and can lead to stale data being used in the effect.

```javascript
// ❌ Missing dependency  
useEffect(() => {  
  sendAnalytics(userId);  
}, []); // Missing 'userId'
```

--------------------------------

### Ternary Operator for Conditional JSX Rendering

Source: https://react.dev/learn/conditional-rendering

Demonstrates using the ternary operator to render different JSX based on a boolean condition. This approach is useful when you need to render one of two different outputs. The example shows rendering a checkmark conditionally based on the isPacked prop.

```JavaScript
return (
  <li className="item">
    {isPacked ? name + ' ✅' : name}
  </li>
);
```

--------------------------------

### Integrating Owner Stack into Custom Error Overlay Initialization (index.js)

Source: https://react.dev/reference/react/captureOwnerStack

This `index.js` snippet demonstrates the setup for integrating `captureOwnerStack` into a custom error overlay at the application's entry point. It globally patches `console.error` to capture the Owner Stack alongside standard error messages, then utilizes an `onConsoleError` utility for further processing and display.

```javascript
import { captureOwnerStack } from "react";
import { createRoot } from "react-dom/client";
import App from './App';
import { onConsoleError } from "./errorOverlay";
import './styles.css';

const originalConsoleError = console.error;
console.error = function patchedConsoleError(...args) {
  originalConsoleError.apply(console, args);
  const ownerStack = captureOwnerStack();
  onConsoleError({
    // Keep in mind that in a real application, console.error can be
    // called with multiple arguments which you should account for.
    consoleMessage: args[0],
    ownerStack,
  });
};

const container = document.getElementById("root");
createRoot(container).render(<App />);
```

--------------------------------

### Define React Profile Page Structure

Source: https://react.dev/reference/react-dom/server/renderToReadableStream

This React component defines a basic profile page structure, rendering `ProfileLayout`, `ProfileCover`, `Sidebar` (with `Friends` and `Photos`), and `Posts` components. In this initial setup, the entire page waits for all data, including potentially slow `Posts` data, to load before rendering anything to the user.

```javascript
function ProfilePage() {  
  return (  
    <ProfileLayout>  
      <ProfileCover />  
      <Sidebar>  
        <Friends />  
        <Photos />  
      </Sidebar>  
      <Posts />  
    </ProfileLayout>  
  );  
}
```

--------------------------------

### Define React Context Fallback Defaults

Source: https://react.dev/reference/react/useContext

Shows how to define default values when creating a React Context using `createContext()`. These defaults are used when no provider is found in the component tree, providing a fallback and preventing errors. Examples include using `null` and a meaningful string like `'light'`.

```javascript
const ThemeContext = createContext(null);
```

```javascript
const ThemeContext = createContext('light');
```

--------------------------------

### Migrate 'act' import from 'react-dom/test-utils' to 'react'

Source: https://react.dev/warnings/react-dom-test-utils

The `act` utility function for testing React components has been deprecated in `react-dom/test-utils`. Developers should update their imports to get `act` directly from the `react` package to ensure compatibility and use the current best practice.

```javascript
import {act} from 'react-dom/test-utils';
```

```javascript
import {act} from 'react';
```

--------------------------------

### Convert Default React Import to Named Import

Source: https://react.dev/link/new-jsx-transform

Example demonstrating how the codemod converts default React imports to destructured named imports when React methods like useState are used. This change prepares code for future React versions with ES Modules support.

```javascript
import React from 'react';

function App() {
  const [text, setText] = React.useState('Hello World');
  return <h1>{text}</h1>;
}
```

```javascript
import { useState } from 'react';

function App() {
  const [text, setText] = useState('Hello World');
  return <h1>{text}</h1>;
}
```

--------------------------------

### Designing React APIs with Immutable State for Memoization Compatibility

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/incompatible-library

This example demonstrates a recommended pattern for library APIs that return immutable state and explicit update functions. When the state (`field`) is updated, its reference changes, allowing `useMemo` to correctly re-evaluate dependent values and ensuring compatibility with React's memoization model.

```javascript
function Component() {  
  const { field, updateField } = useLibrary();  
  // this is always safe to memo  
  const greeting = useMemo(() => `Hello, ${field.name}!`, [field.name]);  
  
  return (  
    <div>  
      <input  
        value={field.name}  
        onChange={(e) => updateField('name', e.target.value)}  
      />  
      <p>{greeting}</p>  
    </div>  
  );
}
```

--------------------------------

### Single-Line JSX Return Statement

Source: https://react.dev/learn/your-first-component

Demonstrates the compact syntax for returning JSX markup on a single line after the return keyword. This approach works when all markup fits on one line without additional nesting.

```jsx
return <img src="https://i.imgur.com/MK3eW3As.jpg" alt="Katherine Johnson" />;
```

--------------------------------

### Taint `process.env` to prevent client exposure in React

Source: https://react.dev/reference/react/experimental_taintObjectReference

This example demonstrates using `experimental_taintObjectReference` to mark the entire `process.env` object as tainted. This prevents the sensitive environment variables from being inadvertently passed to any Client Component, triggering an error with a custom message if an attempt is made.

```javascript
import {experimental_taintObjectReference} from 'react';

experimental_taintObjectReference(
  'Do not pass ALL environment variables to the client.',
  process.env
);
```

--------------------------------

### Safely Use Props by Creating a Local Copy in React

Source: https://react.dev/reference/rules/components-and-hooks-must-be-pure

This example shows the correct pattern for working with props when a modified version is needed. Instead of mutating the original prop, a local copy (`url`) is created and modified. This preserves the immutability of the original prop, ensuring predictable component behavior.

```javascript
function Post({ item }) {  
  const url = new Url(item.url, base); // ✅ Good: make a copy instead  
  return <Link url={url}>{item.title}</Link>;  
}
```

--------------------------------

### Unsafe Server Component Data Fetching Pattern

Source: https://react.dev/reference/react/experimental_taintObjectReference

This example demonstrates an unsafe pattern where sensitive user data is fetched on the server and passed directly to a Client Component without restriction. The getUser function retrieves complete user records from the database, and the Profile component passes the entire user object to InfoCard, potentially exposing sensitive information that should not be accessible on the client side.

```javascript
// api.js
export async function getUser(id) {
  const user = await db`SELECT * FROM users WHERE id = ${id}`;
  return user;
}

// Usage in Server Component
import { getUser } from 'api.js';
import { InfoCard } from 'components.js';

export async function Profile(props) {
  const user = await getUser(props.userId);
  // DO NOT DO THIS - passes entire user object to Client Component
  return <InfoCard user={user} />;
}

// components.js (Client Component)
"use client";

export async function InfoCard({ user }) {
  return <div>{user.name}</div>;
}
```

--------------------------------

### React Component Using Prop Directly Without Mirroring

Source: https://react.dev/learn/choosing-the-state-structure

This example demonstrates the recommended way to use a prop (`messageColor`) directly within a React component. By using the prop directly, the component automatically reflects any updates from its parent, ensuring consistency and predictability. This approach avoids the pitfalls of mirroring props into state when the prop is meant to be dynamic.

```javascript
function Message({ messageColor }) {  

  const color = messageColor;

```

--------------------------------

### Updating React State with the set Function

Source: https://react.dev/reference/react/useState

This example illustrates how to update a state variable in a React component by calling its associated `set` function. When `setName('Robin')` is called, React schedules a re-render of the component with the new state value, which will then be reflected in the UI.

```javascript
function handleClick() {
  setName('Robin');
}
```

--------------------------------

### Implement comprehensive error reporting system with multiple handlers

Source: https://react.dev/reference/react-dom/client/createRoot

Sets up production error reporting using onCaughtError, onRecoverableError, and onUncaughtError handlers in createRoot. Captures different error types and routes them to custom reporting functions for monitoring and debugging.

```javascript
import { createRoot } from "react-dom/client";
import App from "./App.js";
import {
  onCaughtErrorProd,
  onRecoverableErrorProd,
  onUncaughtErrorProd
} from "./reportError";

const container = document.getElementById("root");
const root = createRoot(container, {
  onCaughtError: onCaughtErrorProd,
  onRecoverableError: onRecoverableErrorProd,
  onUncaughtError: onUncaughtErrorProd
});
root.render(<App />);
```

--------------------------------

### Planning for Removal of Temporary React Compiler Directives

Source: https://react.dev/reference/react-compiler/directives

This example demonstrates how to implement a temporary "use no memo" directive as a workaround. It emphasizes the best practice of adding a TODO comment to track its future removal, ensuring that such directives are not permanently left in the codebase once the underlying issue is resolved.

```javascript
function TemporaryWorkaround() {
  "use no memo"; // TODO: Remove after upgrading ThirdPartyLib to v2.0
  return <ThirdPartyComponent />;
}
```

--------------------------------

### Resolve React Compiler Inference Mode Compilation Issues

Source: https://react.dev/reference/react-compiler/compilationMode

When using `compilationMode: 'infer'`, this example highlights common reasons why functions might not be compiled. It provides corrected versions demonstrating how proper naming conventions (PascalCase for components) and adherence to hook rules enable compilation.

```javascript
// ❌ Won't be compiled: lowercase name  
function button(props) {  
  return <button>{props.label}</button>;  
}  
  
// ✅ Will be compiled: PascalCase name  
function Button(props) {  
  return <button>{props.label}</button>;  
}  
  
// ❌ Won't be compiled: doesn't create JSX or call hooks  
function useData() {  
  return window.localStorage.getItem('data');  
}  
  
// ✅ Will be compiled: calls a hook  
function useData() {  
  const [data] = useState(() => window.localStorage.getItem('data'));  
  return data;  
}
```

--------------------------------

### Resource Preloading APIs in React 19

Source: https://react.dev/blog/2024/12/05/react-19

Demonstrates React 19's resource preloading functions including preinit for eager script loading, preload for fonts and stylesheets, prefetchDNS for DNS prefetching, and preconnect for establishing early connections. These APIs optimize page performance by instructing the browser to load resources as early as possible during initial document load and client-side updates.

```javascript
import { prefetchDNS, preconnect, preload, preinit } from 'react-dom'

function MyComponent() {
  preinit('https://.../path/to/some/script.js', {as: 'script' }) // loads and executes this script eagerly
  preload('https://.../path/to/font.woff', { as: 'font' }) // preloads this font
  preload('https://.../path/to/stylesheet.css', { as: 'style' }) // preloads this stylesheet
  prefetchDNS('https://...') // when you may not actually request anything from this host
  preconnect('https://...') // when you will request something but aren't sure what
}
```

--------------------------------

### Control React `<progress>` indicator with various states

Source: https://react.dev/reference/react-dom/components/progress

This example showcases different ways to control the React `<progress>` component. It illustrates setting determinate progress with `value` and `max` props, and displaying an indeterminate state by passing `value={null}`. The component renders multiple progress bars to demonstrate these variations.

```jsx
export default function App() {
  return (
    <>
      <progress value={0} />
      <progress value={0.5} />
      <progress value={0.7} />
      <progress value={75} max={100} />
      <progress value={1} />
      <progress value={null} />
    </>
  );
}
```

--------------------------------

### SSR Inject Asset Map into Client Global Scope for Hydration (Node.js/React)

Source: https://react.dev/reference/react-dom/server/renderToReadableStream

This server-side rendering example extends asset map handling by injecting the `assetMap` directly into the client's global scope (`window.assetMap`) using the `bootstrapScriptContent` option. This allows client-side hydration code to access the same asset map, preventing hydration errors when the client needs to re-render with the correct dynamic asset paths.

```javascript
// You'd need to get this JSON from your build tooling.  
const assetMap = {  
  'styles.css': '/styles.123456.css',  
  'main.js': '/main.123456.js'  
};
  
async function handler(request) {  
  const stream = await renderToReadableStream(<App assetMap={assetMap} />, {  
    // Careful: It's safe to stringify() this because this data isn't user-generated.  
    bootstrapScriptContent: `window.assetMap = ${JSON.stringify(assetMap)};`,  
    bootstrapScripts: [assetMap['/main.js']],  
  });  
  return new Response(stream, {  
    headers: { 'content-type': 'text/html' },  
  });  
}
```

--------------------------------

### Hydrating a React application to server-rendered HTML

Source: https://react.dev/link/hydration-mismatch

This example demonstrates how to import `hydrateRoot` from `react-dom/client` and use it to attach React to a pre-existing DOM element, typically one rendered by a server. It initializes React on the specified `domNode` with a given `reactNode`, allowing React to take control of the DOM within that element. This is crucial for applications using server-side rendering to become interactive on the client.

```javascript
import { hydrateRoot } from 'react-dom/client';

const domNode = document.getElementById('root');
const root = hydrateRoot(domNode, reactNode);
```

--------------------------------

### Measure Memoized Calculation Performance with console.time in React

Source: https://react.dev/learn/you-might-not-need-an-effect

This example demonstrates how to measure the performance of a memoized calculation using `console.time` and `console.timeEnd` in conjunction with the `useMemo` hook in React. This helps verify the effectiveness of `useMemo` by showing whether the calculation is skipped on subsequent renders when dependencies remain unchanged, thereby improving performance on updates.

```javascript
console.time('filter array');  
const visibleTodos = useMemo(() => {  
  return getFilteredTodos(todos, filter); // Skipped if todos and filter haven't changed  
}, [todos, filter]);  
console.timeEnd('filter array');
```

--------------------------------

### Memoizing a Function with React cache for Server Components

Source: https://react.dev/reference/react/cache

This example shows how to use React's `cache` to memoize an expensive calculation, `calculateMetrics`, outside of a component. The `getMetrics` function will only execute `calculateMetrics` when called with new arguments; otherwise, it returns a cached result, optimizing performance in React Server Components.

```javascript
import {cache} from 'react';  

import calculateMetrics from 'lib/metrics';  

  

const getMetrics = cache(calculateMetrics);  

  

function Chart({data}) {  

  const report = getMetrics(data);  

  // ...  

}
```

--------------------------------

### Valid Module-Level Component and Hook Definitions in React

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/component-hook-factories

Examples of correct code patterns showing components and hooks defined at the module level instead of inside other functions. This ensures each component or hook maintains a single identity across renders, preserving state and improving performance.

```javascript
// ✅ Component defined at module level
function Component({ defaultValue }) {
  // ...
}

// ✅ Custom hook at module level
function useData(endpoint) {
  // ...
}
```

--------------------------------

### Pass Props to React Components

Source: https://react.dev/learn/describing-the-ui

Demonstrates how parent components pass data to child components using props. Props can be any JavaScript value, including objects and numbers, enabling flexible communication between components. This example shows passing a 'person' object and 'size' number to an Avatar component.

```javascript
import { getImageUrl } from './utils.js'

export default function Profile() {
  return (
    <Card>
      <Avatar
        size={100}
        person={{
          name: 'Katsuko Saruhashi',
          imageId: 'YfeOqp2'
        }}
      />
    </Card>
  );
}

function Avatar({ person, size }) {
  return (
    <img
      className="avatar"
      src={getImageUrl(person)}
      alt={person.name}
      width={size}
      height={size}
    />
  );
}

function Card({ children }) {
  return (
    <div className="card">
      {children}
    </div>
  );
}
```

--------------------------------

### Routing with React Router and createBrowserRouter

Source: https://react.dev/blog/2025/02/14/sunsetting-create-react-app

Shows the recommended approach for routing using React Router library with createBrowserRouter. This creates actual URLs for each route, enables shareable links, and provides a foundation for advanced features like nested routes, route guards, and transitions. The RouterProvider component wraps the app with routing functionality.

```javascript
import {RouterProvider, createBrowserRouter} from 'react-router';

import Home from './Home';
import Dashboard from './Dashboard';

// ✅ Each route has it's own URL
const router = createBrowserRouter([
  {path: '/', element: <Home />},
  {path: '/dashboard', element: <Dashboard />}
]);

export default function App() {
  return (
    <RouterProvider value={router} />
  )
}
```

--------------------------------

### Update Memoized React Component with Context Changes

Source: https://react.dev/reference/react/memo

This example demonstrates that a memoized component will still re-render when a context it consumes changes. It uses `createContext`, `useContext`, `useState`, and `memo` to manage a theme, showing that the `Greeting` component re-renders when the `ThemeContext` value is updated by the parent `MyApp` component.

```javascript
import { createContext, memo, useContext, useState } from 'react';

const ThemeContext = createContext(null);

export default function MyApp() {
  const [theme, setTheme] = useState('dark');

  function handleClick() {
    setTheme(theme === 'dark' ? 'light' : 'dark');
  }

  return (
    <ThemeContext value={theme}>
      <button onClick={handleClick}>
        Switch theme
      </button>
      <Greeting name="Taylor" />
    </ThemeContext>
  );
}

const Greeting = memo(function Greeting({ name }) {
  console.log("Greeting was rendered at", new Date().toLocaleTimeString());
  const theme = useContext(ThemeContext);
  return (
    <h3 className={theme}>Hello, {name}!</h3>
  );
});
```

--------------------------------

### Render React Components Correctly with JSX

Source: https://react.dev/reference/rules/react-calls-components-and-hooks

This example demonstrates the correct and incorrect ways to use React components. Components should always be included directly within JSX and never called as regular functions. React manages the component's lifecycle and rendering based on its presence in the JSX tree, which allows for optimization, state management, and maintaining component identity.

```javascript
function BlogPost() {  
  return <Layout><Article /></Layout>; // ✅ Good: Only use components in JSX  
}
```

```javascript
function BlogPost() {  
  return <Layout>{Article()}</Layout>; // 🔴 Bad: Never call them directly  
}
```

--------------------------------

### Initialize useReducer Hook with reducer and initial state

Source: https://react.dev/reference/react/useReducer

Basic setup of the useReducer Hook at the top level of a component. The reducer function specifies how state updates occur, and initialArg provides the initial state value. This pattern establishes state management for complex component logic.

```javascript
const [state, dispatch] = useReducer(reducer, initialArg, init?)
```

--------------------------------

### Form Component with Repetitive State and Handler Logic

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

Shows a React Form component managing firstName and lastName state with individual change handlers for each field. This example illustrates the repetitive pattern that can be extracted into a custom hook to reduce code duplication and improve maintainability.

```javascript
import { useState } from 'react';

export default function Form() {
  const [firstName, setFirstName] = useState('Mary');
  const [lastName, setLastName] = useState('Poppins');

  function handleFirstNameChange(e) {
    setFirstName(e.target.value);
  }

  function handleLastNameChange(e) {
    setLastName(e.target.value);
  }

  return (
    <>
      <label>
        First name:
        <input value={firstName} onChange={handleFirstNameChange} />
      </label>
      <label>
        Last name:
        <input value={lastName} onChange={handleLastNameChange} />
      </label>
      <p><b>Good morning, {firstName} {lastName}.</b></p>
    </>
  );
}
```

--------------------------------

### React App indicating pending Transitions with `useTransition` hook

Source: https://react.dev/reference/react/Suspense

This React example enhances the user experience by using the `useTransition` hook to detect when a transition is pending. The `isPending` flag can be used to provide visual feedback, such as changing the `Layout` styling, informing the user that new content is loading without hiding the current view.

```javascript
import { Suspense, useState, useTransition } from 'react';
import IndexPage from './IndexPage.js';
import ArtistPage from './ArtistPage.js';
import Layout from './Layout.js';

export default function App() {
  return (
    <Suspense fallback={<BigSpinner />}>
      <Router />
    </Suspense>
  );
}

function Router() {
  const [page, setPage] = useState('/');
  const [isPending, startTransition] = useTransition();

  function navigate(url) {
    startTransition(() => {
      setPage(url);
    });
  }

  let content;
  if (page === '/') {
    content = (
      <IndexPage navigate={navigate} />
    );
  } else if (page === '/the-beatles') {
    content = (
      <ArtistPage
        artist={{
          id: 'the-beatles',
          name: 'The Beatles',
        }}
      />
    );
  }
  return (
    <Layout isPending={isPending}>
      {content}
    </Layout>
  );
}

function BigSpinner() {
  return <h2>🌀 Loading...</h2>;
}
```

--------------------------------

### useImperativeHandle Hook Basic Syntax

Source: https://react.dev/reference/react/useImperativeHandle

Demonstrates the basic syntax for calling useImperativeHandle at the top level of a component. The hook accepts a ref prop, a createHandle function that returns the custom handle object, and an optional dependencies array. This example shows the minimal structure needed to customize what the ref exposes.

```javascript
import { useImperativeHandle } from 'react';

function MyInput({ ref }) {
  useImperativeHandle(ref, () => {
    return {
      // ... your methods ...
    };
  }, []);
  // ...
}
```

--------------------------------

### Define and use reducer function with useReducer

Source: https://react.dev/reference/react/useReducer

Complete example demonstrating how to import useReducer, define a pure reducer function that handles state transitions based on actions, and initialize it within a component. The reducer function receives current state and action, returning the next state.

```javascript
import { useReducer } from 'react';

function reducer(state, action) {
  // ...
}

function MyComponent() {
  const [state, dispatch] = useReducer(reducer, { age: 42 });
  // ...
}
```

--------------------------------

### Read context with useContext Hook

Source: https://react.dev/reference/react/hooks

The useContext Hook allows a component to read and subscribe to context values from distant parent components without prop drilling. This example demonstrates accessing a ThemeContext in a Button component to retrieve the current UI theme.

```JavaScript
function Button() {
  const theme = useContext(ThemeContext);
  // ...
}
```

--------------------------------

### Basic <title> Component Usage

Source: https://react.dev/reference/react-dom/components/title

Demonstrates how to render the <title> component to set the document title. The component accepts text as children and React will automatically place it in the document head.

```APIDOC
## <title> Component

### Description
The built-in browser `<title>` component lets you specify the title of the document from any component in your React application.

### Component
`<title>`

### Props
- **children** (text | number | object with toString method) - Required - The text content that will become the document title. Must be a single string value, not multiple elements.
- **All common element props** - Optional - Supports standard HTML element attributes

### Usage Example
```jsx
import ShowRenderedHTML from './ShowRenderedHTML.js';

export default function ContactUsPage() {
  return (
    <ShowRenderedHTML>
      <title>My Site: Contact Us</title>
      <h1>Contact Us</h1>
      <p>Email us at support@example.com</p>
    </ShowRenderedHTML>
  );
}
```

### Special Rendering Behavior
- React automatically places the `<title>` DOM element in the document's `<head>`, regardless of where it is rendered in the React tree
- Only one `<title>` should be rendered at a time; multiple titles will cause undefined browser behavior
- Exception: No special behavior if `<title>` is within an `<svg>` component
- Exception: No special behavior if `<title>` has an `itemProp` prop

### Important Notes
- Children must be a single string value, not multiple JSX elements
- Use string interpolation for dynamic titles: `<title>{\`Results page ${pageNumber}\`}</title>`
- Do NOT use JSX curly braces with multiple elements: `<title>Results page {pageNumber}</title>` will cause an error
```

--------------------------------

### React: Memoizing `useEffect` object dependency with `useMemo` for efficiency

Source: https://react.dev/reference/react/useMemo

This example demonstrates how `useMemo` can be used to memoize an object literal (`options`) that serves as a dependency for a `useEffect` hook. By memoizing the object, the `useEffect` only re-runs when `roomId` (the dependency of `useMemo`) changes, preventing unnecessary re-executions caused by new object references on every render.

```javascript
import { useState, useEffect, useMemo } from 'react';

function ChatRoom({ roomId }) {  
  const [message, setMessage] = useState('');  

  const options = useMemo(() => {  
    return {  
      serverUrl: 'https://localhost:1234',  
      roomId: roomId  
    };  
  }, [roomId]); // ✅ Only changes when roomId changes  

  useEffect(() => {  
    const connection = createConnection(options);  
    connection.connect();  
    return () => connection.disconnect();  
  }, [options]); // ✅ Only changes when options changes  
  // ...
}
```

--------------------------------

### Complete React Tic-Tac-Toe Board Component with Turn Logic

Source: https://react.dev/learn/tutorial-tic-tac-toe

Full Board component implementation featuring turn management, square click handling, and rendering of a 3x3 grid with Square child components. Manages both game state (squares and turn) and prevents invalid moves through validation.

```JavaScript
import { useState } from 'react';

function Square({value, onSquareClick}) {
  return (
    <button className="square" onClick={onSquareClick}>
      {value}
    </button>
  );
}

export default function Board() {
  const [xIsNext, setXIsNext] = useState(true);
  const [squares, setSquares] = useState(Array(9).fill(null));

  function handleClick(i) {
    if (squares[i]) {
      return;
    }
    const nextSquares = squares.slice();
    if (xIsNext) {
      nextSquares[i] = 'X';
    } else {
      nextSquares[i] = 'O';
    }
    setSquares(nextSquares);
    setXIsNext(!xIsNext);
  }

  return (
    <>
      <div className="board-row">
        <Square value={squares[0]} onSquareClick={() => handleClick(0)} />
        <Square value={squares[1]} onSquareClick={() => handleClick(1)} />
        <Square value={squares[2]} onSquareClick={() => handleClick(2)} />
      </div>
      <div className="board-row">
        <Square value={squares[3]} onSquareClick={() => handleClick(3)} />
        <Square value={squares[4]} onSquareClick={() => handleClick(4)} />
        <Square value={squares[5]} onSquareClick={() => handleClick(5)} />
      </div>
      <div className="board-row">
        <Square value={squares[6]} onSquareClick={() => handleClick(6)} />
        <Square value={squares[7]} onSquareClick={() => handleClick(7)} />
        <Square value={squares[8]} onSquareClick={() => handleClick(8)} />
      </div>
    </>
  );
}
```

--------------------------------

### Generate and apply dynamic inline CSS in React components

Source: https://react.dev/reference/react-dom/components/style

This example illustrates how to dynamically create and apply CSS rules within a React component using the `<style>` component. It utilizes the `useId` hook to scope styles uniquely, and `href` and `precedence` props for React to optimize stylesheet placement and de-duplication in the document head. The generated CSS depends on the `colors` prop passed to the `PieChart` component.

```javascript
import ShowRenderedHTML from './ShowRenderedHTML.js';
import { useId } from 'react';

function PieChart({data, colors}) {
  const id = useId();
  const stylesheet = colors.map((color, index) =>
    `#${id} .color-${index}: \{ color: \"${color}\"; \}`
  ).join();
  return (
    <>
      <style href={"PieChart-" + JSON.stringify(colors)} precedence="medium">
        {stylesheet}
      </style>
      <svg id={id}>
        …
      </svg>
    </>
  );
}

export default function App() {
  return (
    <ShowRenderedHTML>
      <PieChart data="..." colors={['red', 'green', 'blue']} />
    </ShowRenderedHTML>
  );
}
```

--------------------------------

### Rendering React Tree to Readable Stream in a Web Handler (React)

Source: https://react.dev/reference/react-dom/server/renderToReadableStream

This example demonstrates how to use `renderToReadableStream` within an asynchronous function to render a React `<App />` component to a Readable Web Stream. It imports the function from `react-dom/server` and configures `bootstrapScripts` for client-side hydration, returning a standard Web Response with appropriate headers.

```javascript
import { renderToReadableStream } from 'react-dom/server';

async function handler(request) {
  const stream = await renderToReadableStream(<App />, {
    bootstrapScripts: ['/main.js']
  });
  return new Response(stream, {
    headers: { 'content-type': 'text/html' },
  });
}
```

--------------------------------

### Configure React act() Global Environment for Testing

Source: https://react.dev/reference/react/act

Set the global IS_REACT_ACT_ENVIRONMENT flag to true in your test environment's global setup file to enable act() functionality. This configuration is required to ensure act() is only used in appropriate testing environments and prevents console warnings about unsupported testing environments.

```javascript
global.IS_REACT_ACT_ENVIRONMENT=true
```

--------------------------------

### Basic useDeferredValue Hook Usage in React

Source: https://react.dev/reference/react/useDeferredValue

Demonstrates how to import and use useDeferredValue at the top level of a React component to get a deferred version of a value. This is the fundamental pattern for deferring UI updates in search pages or similar scenarios where input values need to be processed.

```javascript
const deferredValue = useDeferredValue(value)
```

--------------------------------

### Simplified useState Implementation in JavaScript

Source: https://react.dev/learn/state-a-components-memory

A simplified demonstration of how React's useState hook works internally using an array to store state pairs and an index to track which state to return. This example shows the core mechanism: on the first render, state pairs are created and stored; on subsequent renders, existing pairs are retrieved in the same order. The code includes a Gallery component that uses multiple useState calls and an updateDOM function to simulate React's re-rendering behavior.

```javascript
let componentHooks = [];
let currentHookIndex = 0;

// How useState works inside React (simplified).
function useState(initialState) {
  let pair = componentHooks[currentHookIndex];
  if (pair) {
    // This is not the first render,
    // so the state pair already exists.
    // Return it and prepare for next Hook call.
    currentHookIndex++;
    return pair;
  }

  // This is the first time we're rendering,
  // so create a state pair and store it.
  pair = [initialState, setState];

  function setState(nextState) {
    // When the user requests a state change,
    // put the new value into the pair.
    pair[0] = nextState;
    updateDOM();
  }

  // Store the pair for future renders
  // and prepare for the next Hook call.
  componentHooks[currentHookIndex] = pair;
  currentHookIndex++;
  return pair;
}

function Gallery() {
  // Each useState() call will get the next pair.
  const [index, setIndex] = useState(0);
  const [showMore, setShowMore] = useState(false);

  function handleNextClick() {
    setIndex(index + 1);
  }

  function handleMoreClick() {
    setShowMore(!showMore);
  }

  let sculpture = sculptureList[index];
  // This example doesn't use React, so
  // return an output object instead of JSX.
  return {
    onNextClick: handleNextClick,
    onMoreClick: handleMoreClick,
    header: `${sculpture.name} by ${sculpture.artist}`,
    counter: `${index + 1} of ${sculptureList.length}`,
    more: `${showMore ? 'Hide' : 'Show'} details`,
    description: showMore ? sculpture.description : null,
    imageSrc: sculpture.url,
    imageAlt: sculpture.alt
  };
}

function updateDOM() {
  // Reset the current Hook index
  // before rendering the component.
  currentHookIndex = 0;
  let output = Gallery();

  // Update the DOM to match the output.
  // This is the part React does for you.
  nextButton.onclick = output.onNextClick;
  header.textContent = output.header;
  moreButton.onclick = output.onMoreClick;
  moreButton.textContent = output.more;
  image.src = output.imageSrc;
  image.alt = output.imageAlt;
  if (output.description !== null) {
    description.textContent = output.description;
    description.style.display = '';
  } else {
    description.style.display = 'none';
  }
}

let nextButton = document.getElementById('nextButton');
let header = document.getElementById('header');
let moreButton = document.getElementById('moreButton');
let description = document.getElementById('description');
let image = document.getElementById('image');
let sculptureList = [{
  name: 'Homenaje a la Neurocirugía',
  artist: 'Marta Colvin Andrade',
  description: 'Although Colvin is predominantly known for abstract themes that allude to pre-Hispanic symbols, this gigantic sculpture, an homage to neurosurgery, is one of her most recognizable public art pieces.',
  url: 'https://i.imgur.com/Mx7dA2Y.jpg',
  alt: 'A bronze statue of two crossed hands delicately holding a human brain in their fingertips.'
}, {
  name: 'Floralis Genérica',
  artist: 'Eduardo Catalano',
  description: 'This enormous (75 ft. or 23m) silver flower is located in Buenos Aires. It is designed to move, closing its petals in the evening or when strong winds blow and opening them in the morning.',
  url: 'https://i.imgur.com/ZF6s192m.jpg',
  alt: 'A gigantic metallic flower sculpture with reflective mirror-like petals and strong stamens.'
}, {
  name: 'Eternal Presence',
  artist: 'John Woodrow Wilson',
  description: 'Wilson was known for his preoccupation with equality, social justice, as well as the essential and spiritual qualities of humankind. This massive (7ft. or 2,13m) bronze represents what he described as "a symbolic Black presence infused with a sense of universal humanity."',
  url: 'https://i.imgur.com/aTtVpES.jpg',
  alt: 'A tall wooden sculpture depicting a human figure. The sculpture is distinctive for its extremely high polished shiny surface.'
}];
```

--------------------------------

### Documenting React Compiler Directive Usage

Source: https://react.dev/reference/react-compiler/directives

This snippet highlights the importance of documenting why a React Compiler directive, especially "use no memo", is used. It shows a good practice of adding comments, including TODOs and issue references, to explain the rationale behind opting out of compilation, contrasted with a poorly documented example.

```javascript
// ✅ Good - clear explanation
function DataGrid() {
  "use no memo"; // TODO: Remove after fixing issue with dynamic row heights (JIRA-123)
  // Complex grid implementation
}

// ❌ Bad - no explanation
function Mystery() {
  "use no memo";
  // ...
}
```

--------------------------------

### Class Component with Context - Panel and Button Example

Source: https://react.dev/reference/react/Component

Demonstrates class components using `static contextType` to read from React Context. The Panel and Button components access theme context via `this.context` and use it to dynamically set CSS class names. This pattern requires manual context type assignment for each class component.

```JavaScript
import { createContext, Component } from 'react';

const ThemeContext = createContext(null);

class Panel extends Component {
  static contextType = ThemeContext;

  render() {
    const theme = this.context;
    const className = 'panel-' + theme;
    return (
      <section className={className}>
        <h1>{this.props.title}</h1>
        {this.props.children}
      </section>
    );    
  }
}

class Button extends Component {
  static contextType = ThemeContext;

  render() {
    const theme = this.context;
    const className = 'button-' + theme;
    return (
      <button className={className}>
        {this.props.children}
      </button>
    );
  }
}

function Form() {
  return (
    <Panel title="Welcome">
      <Button>Sign up</Button>
      <Button>Log in</Button>
    </Panel>
  );
}

export default function MyApp() {
  return (
    <ThemeContext value="dark">
      <Form />
    </ThemeContext>
  )
}
```

--------------------------------

### Create Multiple React Apps with Unique ID Prefixes using createRoot

Source: https://react.dev/reference/react/useId

Shows how to render multiple independent React applications on a single page by passing identifierPrefix to createRoot. Each app receives a distinct prefix to ensure IDs generated by useId never clash between applications. This is essential when multiple React apps coexist on the same page.

```javascript
import { createRoot } from 'react-dom/client';
import App from './App.js';
import './styles.css';

const root1 = createRoot(document.getElementById('root1'), {
  identifierPrefix: 'my-first-app-'
});
root1.render(<App />);

const root2 = createRoot(document.getElementById('root2'), {
  identifierPrefix: 'my-second-app-'
});
root2.render(<App />);
```

--------------------------------

### React component example of ViewTransition with Suspense for lazy loading

Source: https://react.dev/reference/react/ViewTransition

This React component illustrates how to use <ViewTransition> in conjunction with <Suspense> and startTransition to animate the loading and display of asynchronously fetched content. It shows a button toggling the visibility of a lazy-loaded video, with a placeholder shown during loading and a smooth transition when the content appears.

```jsx
import {
  ViewTransition,
  useState,
  startTransition,
  Suspense
} from 'react';
import {Video, VideoPlaceholder} from "./Video";
import {useLazyVideoData} from "./data"

function LazyVideo() {
  const video = useLazyVideoData();
  return (
    <Video video={video}/>
  );
}

export default function Component() {
  const [showItem, setShowItem] = useState(false);
  return (
    <>
      <button
        onClick={() => {
          startTransition(() => {
            setShowItem((prev) => !prev);
          });
        }}
      >{showItem ? '➖' : '➕'}</button>
      {showItem ? (
        <ViewTransition>
          <Suspense fallback={<VideoPlaceholder />}>
            <LazyVideo />
          </Suspense>
        </ViewTransition>
      ) : null}
    </>
  );
}
```

--------------------------------

### Handle Local Array Mutation in React Component

Source: https://react.dev/reference/rules/components-and-hooks-must-be-pure

This example demonstrates that local mutation of variables within a React component's render function is acceptable. The `items` array is created anew with each render, ensuring that changes are not remembered across renders and maintaining idempotence.

```javascript
function FriendList({ friends }) {  
  const items = []; // ✅ Good: locally created  
  for (let i = 0; i < friends.length; i++) {  
    const friend = friends[i];  
    items.push(  
      <Friend key={friend.id} friend={friend} />  
    ); // ✅ Good: local mutation is okay  
  }  
  return <section>{items}</section>;  
}
```

--------------------------------

### Mark Module as Client Code with 'use client' Directive

Source: https://react.dev/reference/rsc/use-client

Demonstrates how to use the 'use client' directive at the top of a React module to mark it and its dependencies as client-rendered code. This example shows a RichTextEditor component that imports useState hook and other client-side dependencies. The directive must be placed before any imports or code (comments are permitted).

```javascript
'use client';

import { useState } from 'react';
import { formatDate } from './formatters';
import Button from './button';

export default function RichTextEditor({ timestamp, text }) {
  const date = formatDate(timestamp);
  // ...
  const editButton = <Button />;
  // ...
}
```

--------------------------------

### Handle Mouse Events in React Components

Source: https://react.dev/reference/react-dom/components/common

Demonstrates multiple mouse event handlers (onMouseEnter, onMouseLeave, onClick, onMouseDown, onMouseUp, onMouseOver) on React elements. The example shows event binding on both parent and child elements to illustrate event propagation and when each event fires during mouse interactions.

```JavaScript
export default function MouseExample() {
  return (
    <div
      onMouseEnter={e => console.log('onMouseEnter (parent)')}
      onMouseLeave={e => console.log('onMouseLeave (parent)')}
    >
      <button
        onClick={e => console.log('onClick (first button)')}
        onMouseDown={e => console.log('onMouseDown (first button)')}
        onMouseEnter={e => console.log('onMouseEnter (first button)')}
        onMouseLeave={e => console.log('onMouseLeave (first button)')}
        onMouseOver={e => console.log('onMouseOver (first button)')}
        onMouseUp={e => console.log('onMouseUp (first button)')}
      >
        First button
      </button>
      <button
        onClick={e => console.log('onClick (second button)')}
        onMouseDown={e => console.log('onMouseDown (second button)')}
        onMouseEnter={e => console.log('onMouseEnter (second button)')}
        onMouseLeave={e => console.log('onMouseLeave (second button)')}
        onMouseOver={e => console.log('onMouseOver (second button)')}
        onMouseUp={e => console.log('onMouseUp (second button)')}
      >
        Second button
      </button>
    </div>
  );
}
```

--------------------------------

### Gradual Adoption Strategy for React Compiler Directives

Source: https://react.dev/reference/react-compiler/directives

This snippet outlines a strategy for gradually adopting the React Compiler in a large codebase. It suggests starting with annotation mode to explicitly opt in stable components with "use memo", and later transitioning to infer mode, using "use no memo" to temporarily exclude problematic components while addressing underlying issues.

```javascript
// Start with annotation mode
{
  compilationMode: 'annotation'
}

// Opt in stable components
function StableComponent() {
  "use memo";
  // Well-tested component
}

// Later, switch to infer mode and opt out problematic ones
function ProblematicComponent() {
  "use no memo"; // Fix issues before removing
  // ...
}
```

--------------------------------

### preinit function import and basic usage

Source: https://react.dev/reference/react-dom/preinit

Import the preinit function from react-dom and call it with a resource URL and options object. The function provides the browser a hint to download and execute the specified resource (script or stylesheet) immediately.

```javascript
import { preinit } from 'react-dom';

function AppRoot() {
  preinit("https://example.com/script.js", {as: "script"});
  // ...
}
```

--------------------------------

### Incorrect `useMemo` dependency on a non-memoized object in React

Source: https://react.dev/reference/react/useMemo

This example demonstrates an anti-pattern where a `useMemo` hook depends on an object (`searchOptions`) created directly within the component body. Because the object reference changes on every re-render, the memoization is defeated, leading to unnecessary recalculations of `visibleItems`.

```javascript
function Dropdown({ allItems, text }) {  
  const searchOptions = { matchMode: 'whole-word', text };  
  
  const visibleItems = useMemo(() => {  
    return searchItems(allItems, searchOptions);  
  }, [allItems, searchOptions]); // 🚩 Caution: Dependency on an object created in the component body  
  // ...
}
```

--------------------------------

### App-Specific Event Handler Prop Naming in React Components

Source: https://react.dev/learn/responding-to-events

This React example showcases the use of app-specific event handler prop names, such as `onPlayMovie` and `onUploadImage`, passed to a `Toolbar` component. This approach abstracts the specific actions at a higher level, providing flexibility for the `Toolbar` to implement these actions using various internal mechanisms, such as passing them down to child `Button` components. This improves component reusability and maintainability by decoupling the action's definition from its execution details.

```javascript
export default function App() {
  return (
    <Toolbar
      onPlayMovie={() => alert('Playing!')}
      onUploadImage={() => alert('Uploading!')}
    />
  );
}

function Toolbar({ onPlayMovie, onUploadImage }) {
  return (
    <div>
      <Button onClick={onPlayMovie}>
        Play Movie
      </Button>
      <Button onClick={onUploadImage}>
        Upload Image
      </Button>
    </div>
  );
}

function Button({ onClick, children }) {
  return (
    <button onClick={onClick}>
      {children}
    </button>
  );
}
```

--------------------------------

### ReactElement Props Type Default Changed to Unknown

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

ReactElement props now default to unknown instead of any when no type argument is provided. This affects legacy code that relies on unsound prop access. Code with explicit type arguments remains unaffected.

```typescript
type Example2 = ReactElement<{ id: string }>["props"];
//   ^? { id: string }
```

```typescript
type Example = ReactElement["props"];
//   ^? Before, was 'any', now 'unknown'
```

--------------------------------

### Identifying Invalid React Patterns with Incompatible Libraries

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/incompatible-library

This section provides examples of common library usages, specifically `react-hook-form`'s `watch` and `TanStack Table`'s `useReactTable`, that are considered incompatible with React's memoization due to interior mutability. These patterns will break automatic and manual memoization.

```javascript
// ❌ react-hook-form `watch`  
function Component() {  
  const {watch} = useForm();  
  const value = watch('field'); // Interior mutability  
  return <div>{value}</div>;  
}  
  
// ❌ TanStack Table `useReactTable`  
function Component({data}) {  
  const table = useReactTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),  
  });  
  // table instance uses interior mutability  
  return <Table table={table} />;
}
```

--------------------------------

### JavaScript Ref Current Value Direct Mutation Example

Source: https://react.dev/learn/referencing-values-with-refs

This snippet demonstrates the synchronous nature of `ref.current` mutation in JavaScript. Unlike React state, changes to `ref.current` are immediately reflected, highlighting that refs are plain JavaScript objects and behave accordingly. This allows for direct and instant value updates.

```javascript
ref.current = 5;  

console.log(ref.current); // 5
```

--------------------------------

### Handle Clipboard API events in React JSX

Source: https://react.dev/reference/react-dom/components/common

This example shows how to use event handlers for Clipboard API events in React, specifically `onCopy`, `onCut`, and `onPaste`. These handlers receive a React event object extended with `ClipboardEvent` properties, such as `clipboardData`, which allows access to clipboard contents.

```javascript
<input
  onCopy={e => console.log('onCopy')}
  onCut={e => console.log('onCut')}
  onPaste={e => console.log('onPaste')}
/>
```

--------------------------------

### Configuring React Compiler's Compilation Mode in Babel

Source: https://react.dev/reference/react-compiler/directives/use-memo

Provides an example of how to configure the `babel-plugin-react-compiler` in `babel.config.js` to set the `compilationMode`. This setting dictates how the React Compiler processes components, with options like 'annotation', 'infer', or 'all', influencing how 'use memo' directives are interpreted and applied.

```javascript
// babel.config.js  
module.exports = {  
  plugins: [  
    ['babel-plugin-react-compiler', {  
      compilationMode: 'annotation' // or 'infer' or 'all'  
    }]  
  ]  
};
```

--------------------------------

### Enhancing Custom Error Overlay by Patching console.error

Source: https://react.dev/reference/react/captureOwnerStack

This example shows how to patch `console.error` to intercept error messages and augment them with the Owner Stack captured using `captureOwnerStack()`. This allows custom error overlays to provide more detailed debugging information specifically about the React component ownership chain.

```javascript
import { captureOwnerStack } from "react";
import { instrumentedConsoleError } from "./errorOverlay";

const originalConsoleError = console.error;
console.error = function patchedConsoleError(...args) {
  originalConsoleError.apply(console, args);
  const ownerStack = captureOwnerStack();
  onConsoleError({
    // Keep in mind that in a real application, console.error can be
    // called with multiple arguments which you should account for.
    consoleMessage: args[0],
    ownerStack,
  });
};
```

--------------------------------

### Generate Static HTML with React DOM prerender API

Source: https://react.dev/blog/2024/04/25/react-19

React 19 introduces new `react-dom/static` APIs, including `prerender`, designed for static site generation. These APIs improve upon `renderToString` by waiting for all data to load before returning a complete static HTML stream. This example demonstrates how to use `prerender` in a Web Stream environment to generate an HTML response for a React application, suitable for static content delivery.

```javascript
import { prerender } from 'react-dom/static';  

async function handler(request) {  
  const {prelude} = await prerender(<App />, {  
    bootstrapScripts: ['/main.js']  
  });  
  return new Response(prelude, {  
    headers: { 'content-type': 'text/html' },  
  });  
}
```

--------------------------------

### Opt-out of React 18 Automatic Batching using flushSync

Source: https://react.dev/blog/2022/03/08/react-18-upgrade-guide

This JavaScript example demonstrates how to explicitly opt out of React 18's automatic batching behavior using the `flushSync` utility from `react-dom`. By wrapping state updates in `flushSync`, React will immediately re-render after each update, ensuring the DOM is updated synchronously.

```javascript
import { flushSync } from 'react-dom';  
  
function handleClick() {  
  flushSync(() => {  
    setCounter(c => c + 1);  
  });  
  // React has updated the DOM by now  
  flushSync(() => {  
    setFlag(f => !f);  
  });  
  // React has updated the DOM by now  
}
```

--------------------------------

### React JSX TaskList Component Prop Drilling Example

Source: https://react.dev/learn/scaling-up-with-reducer-and-context

This snippet demonstrates the 'prop drilling' pattern where `tasks` state and event handler functions (`onChangeTask`, `onDeleteTask`) are explicitly passed down from a parent component (`TaskApp`) to a child component (`TaskList`) via props. This can become cumbersome in deeply nested component trees.

```javascript
<TaskList  
  tasks={tasks}  
  onChangeTask={handleChangeTask}  
  onDeleteTask={handleDeleteTask}  
/>
```

--------------------------------

### Skip Recalculation with useMemo in React

Source: https://react.dev/reference/react/useMemo

Example demonstrating useMemo usage to skip expensive recalculations when dependencies haven't changed. The filterTodos function is memoized to prevent re-execution when only the theme changes, improving performance for slow calculations. Depends on React's useMemo hook and a filterTodos utility function.

```javascript
import { useMemo } from 'react';
import { filterTodos } from './utils.js'

export default function TodoList({ todos, theme, tab }) {
  const visibleTodos = useMemo(
    () => filterTodos(todos, tab),
    [todos, tab]
  );
  return (
    <div className={theme}>
      <p><b>Note: <code>filterTodos</code> is artificially slowed down!</b></p>
      <ul>
        {visibleTodos.map(todo => (
          <li key={todo.id}>
            {todo.completed ?
              <s>{todo.text}</s> :
              todo.text
            }
          </li>
        ))}
      </ul>
    </div>
  );
}
```

--------------------------------

### Missing Dependency Linter Error Example

Source: https://react.dev/learn/removing-effect-dependencies

Shows an incorrect useEffect with an empty dependency array when roomId is actually used inside the Effect. React's linter will flag this as an error because roomId is a reactive value that may change over re-renders, and omitting it will introduce bugs.

```javascript
const serverUrl = 'https://localhost:1234';

function ChatRoom({ roomId }) {
  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => connection.disconnect();
  }, []); // 🔴 React Hook useEffect has a missing dependency: 'roomId'
  // ...
}
```

--------------------------------

### Basic `startTransition` Call Signature

Source: https://react.dev/reference/react/startTransition

Illustrates the fundamental call signature for React's `startTransition` function, which takes an `action` function as its sole argument. This action encapsulates state updates to be marked as non-blocking transitions.

```JavaScript
startTransition(action)
```

--------------------------------

### Resume React Prerendered Tree to Web Stream in Handler (JavaScript)

Source: https://react.dev/reference/react-dom/server/resume

Illustrates how to use the `resume` function within an asynchronous server handler. It imports `resume` from 'react-dom/server', retrieves `postponedState` from storage, and pipes the resulting `resumeStream` to a `writable` Web Stream to complete rendering.

```javascript
import { resume } from 'react-dom/server';  
import {getPostponedState} from './storage';  

async function handler(request, writable) {  
  const postponed = await getPostponedState(request);  
  const resumeStream = await resume(<App />, postponed);  
  return resumeStream.pipeTo(writable)  
}
```

--------------------------------

### Styling React View Transitions with CSS based on Transition Type

Source: https://react.dev/reference/react/addTransitionType

This example shows how to use `addTransitionType` to enable CSS-based animation customization for View Transitions. The React component sets a 'my-transition-type', which can then be targeted in CSS using the `:active-view-transition-type()` pseudo-class to apply specific styles during the transition.

```javascript
function Component() {  
  return (  
    <ViewTransition>  
      <div>Hello</div>  
    </ViewTransition>  
  );  
}  
  
startTransition(() => {  
  addTransitionType('my-transition-type');  
  setShow(true);  
});
```

```css
:root:active-view-transition-type(my-transition-type) {  
  &::view-transition-...(...) {  
    ...  
  }  
}
```

--------------------------------

### Demonstrating Invalid React Hook Dependency Arrays

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/exhaustive-deps

These examples illustrate common mistakes in React hook usage, where `useEffect` or `useMemo` hooks are missing crucial dependencies in their dependency arrays. This leads to stale closures and unexpected behavior, as the hook doesn't re-run when referenced values change.

```javascript
// ❌ Missing dependency  
useEffect(() => {  
  console.log(count);  
}, []); // Missing 'count'  
  
// ❌ Missing prop  
useEffect(() => {  
  fetchUser(userId);  
}, []); // Missing 'userId'  
  
// ❌ Incomplete dependencies  
useMemo(() => {  
  return items.sort(sortOrder);  
}, [items]); // Missing 'sortOrder'
```

--------------------------------

### Constructor Method

Source: https://react.dev/reference/react/Component

Runs before the class component mounts. Used to initialize state and bind methods. Modern syntax often eliminates the need for explicit constructors.

```APIDOC
## constructor(props)

### Description
The constructor is called before the component mounts. Typically used for two purposes: declaring state and binding class methods.

### Signature
```javascript
constructor(props) {
  super(props);
  this.state = { counter: 0 };
  this.handleClick = this.handleClick.bind(this);
}
```

### Parameters
- **props** (object) - Required - Initial props passed to the component

### Best Practices
- Always call `super(props)` first
- Initialize state by assigning object to `this.state`
- Bind methods if using traditional function syntax
- Do not include side effects or subscriptions

### Modern Alternative
Use public class field syntax to avoid explicit constructor:
```javascript
class Counter extends Component {
  state = { counter: 0 };
  
  handleClick = () => {
    // method body
  }
}
```
```

--------------------------------

### Moving Dot Component with Grouped State in React

Source: https://react.dev/learn/choosing-the-state-structure

A complete React component example that tracks cursor position using grouped state in a single position object. The component updates both x and y coordinates simultaneously when the pointer moves, demonstrating the benefit of grouping related state variables that change together.

```javascript
import { useState } from 'react';

export default function MovingDot() {
  const [position, setPosition] = useState({
    x: 0,
    y: 0
  });
  return (
    <div
      onPointerMove={e => {
        setPosition({
          x: e.clientX,
          y: e.clientY
        });
      }}
      style={{
        position: 'relative',
        width: '100vw',
        height: '100vh',
      }}>
      <div style={{
        position: 'absolute',
        backgroundColor: 'red',
        borderRadius: '50%',
        transform: `translate(${position.x}px, ${position.y}px)`,
        left: -10,
        top: -10,
        width: 20,
        height: 20,
      }} />
    </div>
  )
}
```

--------------------------------

### React App.js using Activity Boundary for Tab DOM State Preservation

Source: https://react.dev/reference/react/Activity

This `App.js` example uses `Activity` boundaries to wrap different tab components (`Home`, `Contact`). This approach preserves the DOM state of each tab, such as text in a `textarea`, even when switching between tabs, preventing data loss.

```jsx
import { Activity, useState } from 'react';
import TabButton from './TabButton.js';
import Home from './Home.js';
import Contact from './Contact.js';

export default function App() {
  const [activeTab, setActiveTab] = useState('contact');

  return (
    <>
      <TabButton
        isActive={activeTab === 'home'}
        onClick={() => setActiveTab('home')}
      >
        Home
      </TabButton>
      <TabButton
        isActive={activeTab === 'contact'}
        onClick={() => setActiveTab('contact')}
      >
        Contact
      </TabButton>

      <hr />

      <Activity mode={activeTab === 'home' ? 'visible' : 'hidden'}>
        <Home />
      </Activity>
      <Activity mode={activeTab === 'contact' ? 'visible' : 'hidden'}>
        <Contact />
      </Activity>
    </>
  );
}
```

--------------------------------

### Pitfall: Incorrect cacheSignal usage outside React rendering

Source: https://react.dev/reference/react/cacheSignal

This example highlights a common pitfall where `cacheSignal` is called outside the React component's render function. In such cases, the signal may not correctly abort the request when the component rendering finishes, leading to unintended behavior.

```javascript
import {cacheSignal} from 'react';

// 🚩 Pitfall: The request will not actually be aborted if the rendering of `Component` is finished.

const response = fetch(url, { signal: cacheSignal() });

async function Component() {

  await response;

}
```

--------------------------------

### Cache Expensive Calculations with useMemo in React (Single-line)

Source: https://react.dev/learn/you-might-not-need-an-effect

This example illustrates a concise way to apply the `useMemo` hook for memoizing expensive calculations in a React component. By wrapping the `getFilteredTodos()` call, the result is cached and only recomputed when `todos` or `filter` dependencies change, optimizing performance by avoiding redundant work on re-renders.

```javascript
import { useMemo, useState } from 'react';  
  
function TodoList({ todos, filter }) {  
  const [newTodo, setNewTodo] = useState('');  
  // ✅ Does not re-run getFilteredTodos() unless todos or filter change  
  const visibleTodos = useMemo(() => getFilteredTodos(todos, filter), [todos, filter]);  
  // ...  
}
```

--------------------------------

### Complete Searchable Video List Component

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Full React component implementing a searchable video list with animations. Combines ViewTransition, useDeferredValue, and filtering logic to create an animated search experience. Includes search input handling, video rendering, and empty state display.

```JavaScript
import { useId, useState, use, useDeferredValue, ViewTransition } from "react";
import { Video } from "./Videos";
import Layout from "./Layout";
import { fetchVideos } from "./data";
import { IconSearch } from "./Icons";

function SearchList({searchText, videos}) {
  const deferredSearchText = useDeferredValue(searchText);
  const filteredVideos = filterVideos(videos, deferredSearchText);
  return (
    <div className="video-list">
      <div className="videos">
        {filteredVideos.map((video) => (
          <ViewTransition key={video.id}>
            <Video video={video} />
          </ViewTransition>
        ))}
      </div>
      {filteredVideos.length === 0 && (
        <div className="no-results">No results</div>
      )}
    </div>
  );
}

export default function Home() {
  const videos = use(fetchVideos());
  const count = videos.length;
  const [searchText, setSearchText] = useState('');

  return (
    <Layout heading={<div className="fit">{count} Videos</div>}>
      <SearchInput value={searchText} onChange={setSearchText} />
      <SearchList videos={videos} searchText={searchText} />
    </Layout>
  );
}

function SearchInput({ value, onChange }) {
  const id = useId();
  return (
    <form className="search" onSubmit={(e) => e.preventDefault()}>
      <label htmlFor={id} className="sr-only">
        Search
      </label>
      <div className="search-input">
        <div className="search-icon">
          <IconSearch />
        </div>
        <input
          type="text"
          id={id}
          placeholder="Search"
          value={value}
          onChange={(e) => onChange(e.target.value)}
        />
      </div>
    </form>
  );
}

function filterVideos(videos, query) {
  const keywords = query
    .toLowerCase()
    .split(" ")
    .filter((s) => s !== "");
  if (keywords.length === 0) {
    return videos;
  }
  return videos.filter((video) => {
    const words = (video.title + " " + video.description)
      .toLowerCase()
      .split(" ");
    return keywords.every((kw) => words.some((w) => w.includes(kw)));
  });
}
```

--------------------------------

### Use JavaScript Variables for Dynamic Attributes in React JSX

Source: https://react.dev/learn/javascript-in-jsx-with-curly-braces

This example illustrates how to dynamically set attribute values in React JSX by referencing JavaScript variables. It defines 'avatar' and 'description' variables and embeds them into the 'src' and 'alt' attributes using curly braces {}.

```JavaScript
export default function Avatar() {
  const avatar = 'https://i.imgur.com/7vQD0fPs.jpg';
  const description = 'Gregorio Y. Zara';
  return (
    <img
      className="avatar"
      src={avatar}
      alt={description}
    />
  );
}
```

--------------------------------

### Render Custom HTML Element with String Attribute

Source: https://react.dev/reference/react-dom/components

Demonstrates rendering a custom HTML element with a string value passed as an attribute in React JSX. By default, React passes values bound in JSX as attributes on custom elements. This example shows the basic syntax for custom element rendering.

```jsx
<my-element value="Hello, world!"></my-element>
```

--------------------------------

### Import and Export React Components

Source: https://react.dev/learn/describing-the-ui

Shows how to split components into separate files for better code organization and maintainability. The Gallery component imports the Profile component from a separate file, demonstrating the modular approach to component management in larger React applications.

```JavaScript
import Profile from './Profile.js';

export default function Gallery() {
  return (
    <section>
      <h1>Amazing scientists</h1>
      <Profile />
      <Profile />
      <Profile />
    </section>
  );
}
```

--------------------------------

### Render a basic React `<progress>` component

Source: https://react.dev/reference/react-dom/components/progress

This snippet demonstrates the fundamental usage of the React `<progress>` component. It shows how to render a progress indicator with a specified `value` prop, indicating a determinate state.

```jsx
<progress value={0.5} />
```

--------------------------------

### Import and initialize useRef hooks in a React component

Source: https://react.dev/reference/react/useRef

This example demonstrates how to import `useRef` and declare multiple ref objects within a functional React component. Each ref can be initialized with a different value, such as a number or `null`, for various purposes like storing interval IDs or DOM element references.

```javascript
import { useRef } from 'react';

function MyComponent() {
  const intervalRef = useRef(0);
  const inputRef = useRef(null);
  // ...
}
```

--------------------------------

### Importing and Calling `useId` in a React Component

Source: https://react.dev/reference/react/useId

This example illustrates how to import the `useId` hook from 'react' and call it at the top level of a functional component. The generated unique ID, `passwordHintId`, is then available for use within the component's render logic, typically for linking elements via accessibility attributes.

```javascript
import { useId } from 'react';

function PasswordField() {
  const passwordHintId = useId();
  // ...
```

--------------------------------

### Convert Children to Array with Children.toArray in React

Source: https://react.dev/reference/react/Children

Converts the children data structure into a regular JavaScript array using Children.toArray, enabling manipulation with built-in array methods like filter, sort, or reverse. This example demonstrates reversing the order of children.

```javascript
import { Children } from 'react';

export default function ReversedList({ children }) {
  const result = Children.toArray(children);
  result.reverse();
  return result;
}
```

--------------------------------

### resumeToPipeableStream

Source: https://react.dev/reference/react-dom/server

Resumes a prerendered React tree to a pipeable Node.js Stream. Used to continue rendering from a previous prerenderToNodeStream operation in Node.js environments.

```APIDOC
## resumeToPipeableStream

### Description
Resumes rendering from a prerenderToNodeStream operation to a pipeable Node.js Stream.

### Environment
Node.js Streams

### Usage
Import from `react-dom/server`

### Parameters
- **prerenderResult** (object) - Required - Result object from a previous prerenderToNodeStream operation
- **options** (object) - Optional - Configuration options for resuming

### Return Value
- **PipeableStream** - A Node.js Stream that can be piped to response objects

### Example
```javascript
import { resumeToPipeableStream } from 'react-dom/server';

const stream = resumeToPipeableStream(prerenderResult);
stream.pipe(response);
```
```

--------------------------------

### Basic Suspense Component Usage in React

Source: https://react.dev/reference/react/Suspense

Wraps child components with a fallback UI that displays until the children finish loading. When the data or code is ready, React automatically switches from the fallback to the rendered children. This example shows a basic Suspense boundary with a Loading component as the fallback.

```jsx
<Suspense fallback={<Loading />}>
  <SomeComponent />
</Suspense>
```

--------------------------------

### Sharing Data Snapshots Across Components with React `cache`

Source: https://react.dev/reference/react/cache

This example demonstrates how to use `cache` with data-fetching functions (like `fetch`) to share a consistent snapshot of data across multiple components. When multiple components request the same data via a memoized function, only one actual request is made, and the result is cached and shared, ensuring data consistency and reducing network overhead.

```jsx
import {cache} from 'react';  
import {fetchTemperature} from './api.js';  

  

const getTemperature = cache(async (city) => {  
	return await fetchTemperature(city);  
});  

  

async function AnimatedWeatherCard({city}) {  
	const temperature = await getTemperature(city);  
	// ...  
}  

  

async function MinimalWeatherCard({city}) {  
	const temperature = await getTemperature(city);  
	// ...  
}
```

--------------------------------

### Correctly Display Live Time in React Using `useState` and `useEffect`

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/purity

This example provides the correct method for displaying a live-updating current time in a React component while preserving its purity. It leverages `useState` to manage the time state and `useEffect` with `setInterval` to update the time asynchronously, ensuring the component's render function remains pure and consistent.

```javascript
function Clock() {  
  const [time, setTime] = useState(() => Date.now());  
  
  useEffect(() => {  
    const interval = setInterval(() => {  
      setTime(Date.now());  
    }, 1000);  
  
    return () => clearInterval(interval);  
  }, []);  
  
  return <div>Current time: {time}</div>;  
}
```

--------------------------------

### Group text and React components using Fragment shorthand

Source: https://react.dev/reference/react/Fragment

Explains how to combine plain text content with React components within a single Fragment. This allows for flexible rendering of inline elements without an enclosing DOM element.

```javascript
function DateRangePicker({ start, end }) {  
  return (  
    <>
      From  
      <DatePicker date={start} />  
      to  
      <DatePicker date={end} />  
    </>  
  );
}
```

--------------------------------

### useRef Requires Argument in React 19 TypeScript

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

useRef now requires a mandatory argument to simplify its type signature. Previously optional, it now behaves like createContext. All refs are mutable with the unified RefObject type, eliminating read-only issues with null-initialized refs.

```typescript
// @ts-expect-error: Expected 1 argument but saw none
useRef();

// Passes
useRef(undefined);

// @ts-expect-error: Expected 1 argument but saw none
createContext();

// Passes
createContext(undefined);
```

```typescript
const ref = useRef<number>(null);

// Cannot assign to 'current' because it is a read-only property
ref.current = 1;
```

```typescript
interface RefObject<T> {
  current: T
}

declare function useRef<T>: RefObject<T>
```

--------------------------------

### Implement custom error handling with React 19 createRoot

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

This JavaScript code demonstrates how to configure custom error handling callbacks when creating a React root using `createRoot`. The `onUncaughtError` and `onCaughtError` options allow developers to implement specific logging or reporting mechanisms for errors that are either not handled by an Error Boundary or are caught by one, respectively. This provides granular control over error reporting in React 19.

```javascript
const root = createRoot(container, {
  onUncaughtError: (error, errorInfo) => {
    // ... log error report
  },
  onCaughtError: (error, errorInfo) => {
    // ... log error report
  }
});
```

--------------------------------

### MobX `observer` Pattern Breaking React Memoization

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/incompatible-library

This example highlights how MobX's `observer` pattern, while ergonomic, can lead to memoization issues in React by making assumptions that conflict with React's core update mechanisms. Components wrapped with `observer` might not work as expected with automatic memoization, although the linter does not yet detect this specific pattern.

```javascript
// ❌ MobX `observer`  
const Component = observer(() => {  
  const [timer] = useState(() => new Timer());  
  return <span>Seconds passed: {timer.secondsPassed}</span>;  
});
```

--------------------------------

### Focus Input Element with Ref Click Handler in React

Source: https://react.dev/learn/manipulating-the-dom-with-refs

Shows how to use a ref to call methods on a DOM element from a parent component. This example creates a click handler that calls the focus() method on an input element through the ref. The MyForm component manages the ref and provides a button that focuses the input when clicked.

```javascript
import { useRef } from 'react';

function MyInput({ ref }) {
  return <input ref={ref} />;
}

export default function MyForm() {
  const inputRef = useRef(null);

  function handleClick() {
    inputRef.current.focus();
  }

  return (
    <>
      <MyInput ref={inputRef} />
      <button onClick={handleClick}>
        Focus the input
      </button>
    </>
  );
}
```

--------------------------------

### Client-side React hydration with hydrateRoot

Source: https://react.dev/reference/react-dom/static/prerenderToNodeStream

Initializes React on the client by attaching event listeners to the server-generated static HTML. Converts the static HTML into an interactive React application by hydrating the entire document.

```JavaScript
import { hydrateRoot } from 'react-dom/client';
import App from './App.js';

hydrateRoot(document, <App />);
```

--------------------------------

### Handle DOM Events with React.ChangeEvent in TypeScript

Source: https://react.dev/learn/typescript

Demonstrates how to type DOM event handlers in React using React.ChangeEvent. This example shows handling input change events with explicit type annotation for the event parameter. The event type is inferred from the input element type passed as a generic parameter.

```typescript
import { useState } from 'react';

export default function Form() {
  const [value, setValue] = useState("Change me");

  function handleChange(event: React.ChangeEvent<HTMLInputElement>) {
    setValue(event.currentTarget.value);
  }

  return (
    <>
      <input value={value} onChange={handleChange} />
      <p>Value: {value}</p>
    </>
  );
}
```

--------------------------------

### React Form Component with Redundant Full Name State

Source: https://react.dev/learn/choosing-the-state-structure

This example demonstrates a React form component that manages `firstName`, `lastName`, and a redundant `fullName` state variable. The `fullName` is updated imperatively in event handlers, which can lead to inconsistencies and makes the state harder to reason about. This pattern should be avoided.

```javascript
import { useState } from 'react';

export default function Form() {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [fullName, setFullName] = useState('');

  function handleFirstNameChange(e) {
    setFirstName(e.target.value);
    setFullName(e.target.value + ' ' + lastName);
  }

  function handleLastNameChange(e) {
    setLastName(e.target.value);
    setFullName(firstName + ' ' + e.target.value);
  }

  return (
    <>
      <h2>Let’s check you in</h2>
      <label>
        First name:{' '}
        <input
          value={firstName}
          onChange={handleFirstNameChange}
        />
      </label>
      <label>
        Last name:{' '}
        <input
          value={lastName}
          onChange={handleLastNameChange}
        />
      </label>
      <p>
        Your ticket will be issued to: <b>{fullName}</b>
      </p>
    </>
  );
}
```

--------------------------------

### Complete Counter Component with useReducer

Source: https://react.dev/reference/react/useReducer

Full working example of a React counter component using useReducer. The reducer handles the 'incremented_age' action by returning a new state object with an incremented age value. The component renders a button to dispatch actions and displays the current state.

```javascript
import { useReducer } from 'react';

function reducer(state, action) {
  if (action.type === 'incremented_age') {
    return {
      age: state.age + 1
    };
  }
  throw Error('Unknown action.');
}

export default function Counter() {
  const [state, dispatch] = useReducer(reducer, { age: 42 });

  return (
    <>
      <button onClick={() => {
        dispatch({ type: 'incremented_age' })
      }}>
        Increment age
      </button>
      <p>Hello! You are {state.age}.</p>
    </>
  );
}
```

--------------------------------

### Project Values for Stable Props in React Memoized Components

Source: https://react.dev/reference/react/memo

Sometimes, complex prop values can be projected into simpler, more stable forms to reduce re-renders. This example transforms a `person.groups` array into a boolean `hasGroups`, which changes less frequently than the array itself, thus optimizing the `CallToAction` memoized component.

```javascript
function GroupsLanding({ person }) {  
  const hasGroups = person.groups !== null;  
  return <CallToAction hasGroups={hasGroups} />;  
}  

const CallToAction = memo(function CallToAction({ hasGroups }) {  
  // ...  
});
```

--------------------------------

### Profile component rendering Avatar without props in React

Source: https://react.dev/learn/passing-props-to-a-component

This example illustrates a `Profile` component that renders an `Avatar` component. Crucially, it shows the `Avatar` being rendered without any custom props passed from `Profile`, indicating that `Avatar` would rely solely on its internal logic or default values.

```jsx
export default function Profile() {  
  return (  
    <Avatar />  
  );  
}
```

--------------------------------

### Provide Multiple Context Values in React

Source: https://react.dev/reference/react/createContext

Demonstrates nesting multiple context providers to supply different context values throughout the component tree. Each provider wraps its children and makes its value available to any descendant components that read from that context. This pattern allows passing multiple independent context values simultaneously.

```javascript
function App() {
  const [theme, setTheme] = useState('dark');
  const [currentUser, setCurrentUser] = useState({ name: 'Taylor' });

  return (
    <ThemeContext value={theme}>
      <AuthContext value={currentUser}>
        <Page />
      </AuthContext>
    </ThemeContext>
  );
}
```

--------------------------------

### Function Component with useContext Hook - Panel and Button Example

Source: https://react.dev/reference/react/Component

Converted version of class components using the `useContext` hook instead of `static contextType`. Functional components Panel and Button now use `useContext(ThemeContext)` to access context values. This approach is more concise and follows modern React patterns with hooks.

```JavaScript
import { createContext, useContext } from 'react';

const ThemeContext = createContext(null);

function Panel({ title, children }) {
  const theme = useContext(ThemeContext);
  const className = 'panel-' + theme;
  return (
    <section className={className}>
      <h1>{title}</h1>
      {children}
    </section>
  )
}

function Button({ children }) {
  const theme = useContext(ThemeContext);
  const className = 'button-' + theme;
  return (
    <button className={className}>
      {children}
    </button>
  );
}

function Form() {
  return (
    <Panel title="Welcome">
      <Button>Sign up</Button>
      <Button>Log in</Button>
    </Panel>
  );
}

export default function MyApp() {
  return (
    <ThemeContext value="dark">
      <Form />
    </ThemeContext>
  )
}
```

--------------------------------

### Override React Context in a Component Tree

Source: https://react.dev/reference/react/useContext

This example demonstrates how to override a React Context value for a specific part of the component tree by nesting `ThemeContext.Provider` components. The `Footer` component and its children receive a 'light' theme, while other components default to 'dark', showcasing how context changes are scoped.

```jsx
<ThemeContext value="dark">  
  ...  
  <ThemeContext value="light">  
    <Footer />  
  </ThemeContext>  
  ...  
</ThemeContext>
```

```javascript
import { createContext, useContext } from 'react';

const ThemeContext = createContext(null);

export default function MyApp() {
  return (
    <ThemeContext value="dark">
      <Form />
    </ThemeContext>
  )
}

function Form() {
  return (
    <Panel title="Welcome">
      <Button>Sign up</Button>
      <Button>Log in</Button>
      <ThemeContext value="light">
        <Footer />
      </ThemeContext>
    </Panel>
  );
}

function Footer() {
  return (
    <footer>
      <Button>Settings</Button>
    </footer>
  );
}

function Panel({ title, children }) {
  const theme = useContext(ThemeContext);
  const className = 'panel-' + theme;
  return (
    <section className={className}>
      {title && <h1>{title}</h1>}
      {children}
    </section>
  )
}

function Button({ children }) {
  const theme = useContext(ThemeContext);
  const className = 'button-' + theme;
  return (
    <button className={className}>
      {children}
    </button>
  );
}
```

--------------------------------

### Manage pending states with React Actions using useTransition in JavaScript

Source: https://react.dev/blog/2024/04/25/react-19

This example shows how React 19's new Actions feature simplifies handling pending states for asynchronous data mutations. It leverages `useTransition` to automatically manage the `isPending` state during an `updateName` API call, reducing manual state management.

```javascript
function UpdateName({}) {

  const [name, setName] = useState("");

  const [error, setError] = useState(null);

  const [isPending, startTransition] = useTransition();

  

  const handleSubmit = () => {

    startTransition(async () => {

      const error = await updateName(name);

      if (error) {

        setError(error);

        return;

      }

      redirect("/path");

    })

  };

  

  return (

    <div>

      <input value={name} onChange={(event) => setName(event.target.value)} />

      <button onClick={handleSubmit} disabled={isPending}>

        Update

      </button>

      {error && <p>{error}</p>}

    </div>

  );

}
```

--------------------------------

### Render an uncontrolled textarea with a name attribute in React

Source: https://react.dev/reference/react-dom/components/textarea

This example shows how to render an uncontrolled `<textarea>` component with a `name` attribute. The `name` attribute is crucial for identifying the input's data when submitting a form, allowing the browser to manage its internal state without direct React control.

```jsx
<textarea name="postContent" />
```

--------------------------------

### Reading Promise and Context with React's `use` API

Source: https://react.dev/reference/react/use

Illustrates how to use the `use` API within a React functional component to consume both a Promise and a Context. It shows importing `use` and then applying it to a `messagePromise` and `ThemeContext`.

```javascript
import { use } from 'react';

function MessageComponent({ messagePromise }) {
  const message = use(messagePromise);
  const theme = use(ThemeContext);
  // ...
}
```

--------------------------------

### Fetch Data with React `useEffect` using Async/Await and Race Condition Prevention

Source: https://react.dev/reference/react/useEffect

This example demonstrates fetching data within a React `useEffect` hook using the `async/await` syntax. It defines an `async` function inside the effect to fetch data and utilizes an `ignore` flag in the cleanup function to prevent state updates from outdated requests, addressing potential race conditions.

```javascript
import { useState, useEffect } from 'react';
import { fetchBio } from './api.js';

export default function Page() {
  const [person, setPerson] = useState('Alice');
  const [bio, setBio] = useState(null);
  useEffect(() => {
    async function startFetching() {
      setBio(null);
      const result = await fetchBio(person);
      if (!ignore) {
        setBio(result);
      }
    }

    let ignore = false;
    startFetching();
    return () => {
      ignore = true;
    }
  }, [person]);

  return (
    <>
      <select value={person} onChange={e => {
        setPerson(e.target.value);
      }}>
        <option value="Alice">Alice</option>
        <option value="Bob">Bob</option>
        <option value="Taylor">Taylor</option>
      </select>
      <hr />
      <p><i>{bio ?? 'Loading...'}</i></p>
    </>
  );
}
```

--------------------------------

### React: Avoid try/catch for rendering errors

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/error-boundaries

This example demonstrates an incorrect approach to handling errors within React component rendering. `try/catch` blocks will not catch errors that occur during React's rendering process, as these errors bubble up the component tree. This can lead to unhandled exceptions and crashes, requiring a proper Error Boundary instead.

```JavaScript
function Parent() {
  try {
    return <ChildComponent />; // If this throws, catch won't help
  } catch (error) {
    return <div>Error occurred</div>;
  }
}
```

--------------------------------

### Add Server Rendering Support with getServerSnapshot in React

Source: https://react.dev/reference/react/useSyncExternalStore

Extends useSyncExternalStore with a third argument (getServerSnapshot) to support server-side rendering. This function provides an initial snapshot during server rendering and client hydration, ensuring consistent state between server and client.

```javascript
import { useSyncExternalStore } from 'react';

export function useOnlineStatus() {
  const isOnline = useSyncExternalStore(subscribe, getSnapshot, getServerSnapshot);
  return isOnline;
}

function getSnapshot() {
  return navigator.onLine;
}

function getServerSnapshot() {
  return true; // Always show "Online" for server-generated HTML
}

function subscribe(callback) {
  // ...
}
```

--------------------------------

### Syntax for initializing hydrateRoot in React

Source: https://react.dev/link/hydration-mismatch

This snippet illustrates the basic syntax for calling `hydrateRoot`. It takes a `domNode` (the target DOM element), a `reactNode` (the React component to hydrate), and an optional `options` object for configuration. The function returns a root object with `render` and `unmount` methods.

```javascript
const root = hydrateRoot(domNode, reactNode, options?)
```

--------------------------------

### Initial `forwardRef` component structure with props in React

Source: https://react.dev/reference/react/forwardRef

This snippet sets up a `forwardRef` component (`MyInput`) that handles props by destructuring `label` and passing other props to an internal element, demonstrating the component's structure before the ref is applied.

```javascript
import { forwardRef } from 'react';

const MyInput = forwardRef(function MyInput(props, ref) {
  const { label, ...otherProps } = props;
  return (
    <label>
      {label}
      <input {...otherProps} />
    </label>
  );
});
```

--------------------------------

### Invalid: Global Variable Mutation in React Component

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/globals

Examples of incorrect code that violates the globals rule by mutating global variables, window properties, and external state during render. These patterns break React's purity assumptions and cause unpredictable behavior.

```javascript
// ❌ Global counter
let renderCount = 0;
function Component() {
  renderCount++; // Mutating global
  return <div>Count: {renderCount}</div>;
}
```

```javascript
// ❌ Modifying window properties
function Component({userId}) {
  window.currentUser = userId; // Global mutation
  return <div>User: {userId}</div>;
}
```

```javascript
// ❌ Global array push
const events = [];
function Component({event}) {
  events.push(event); // Mutating global array
  return <div>Events: {events.length}</div>;
}
```

```javascript
// ❌ Cache manipulation
const cache = {};
function Component({id}) {
  if (!cache[id]) {
    cache[id] = fetchData(id); // Modifying cache during render
  }
  return <div>{cache[id]}</div>;
}
```

--------------------------------

### React useEffect with Missing Dependencies

Source: https://react.dev/learn/removing-effect-dependencies

Demonstrates a React ChatRoom component using useEffect with an incomplete dependency array. The linter will flag that 'roomId' prop is used but not included in dependencies, causing the effect to not re-run when roomId changes. This example shows the problem state before fixing the dependency array.

```JavaScript
const serverUrl = 'https://localhost:1234';

function ChatRoom({ roomId }) {
  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => connection.disconnect();
  }, []); // <-- Fix the mistake here!
  return <h1>Welcome to the {roomId} room!</h1>;
}

export default function App() {
  const [roomId, setRoomId] = useState('general');
  return (
    <>
      <label>
        Choose the chat room:{' '}
        <select
          value={roomId}
          onChange={e => setRoomId(e.target.value)}
        >
          <option value="general">general</option>
          <option value="travel">travel</option>
          <option value="music">music</option>
        </select>
      </label>
      <hr />
      <ChatRoom roomId={roomId} />
    </>
  );
}
```

--------------------------------

### resumeAndPrerenderToNodeStream Function

Source: https://react.dev/reference/react-dom/static/resumeAndPrerenderToNodeStream

Continues a prerendered React tree to a static HTML string using a Node.js Stream. This API waits for all data to load before resolving, making it suitable for static site generation with Suspense-based data fetching.

```APIDOC
## resumeAndPrerenderToNodeStream

### Description
Continues a prerendered React tree to a static HTML string using a Node.js Stream. This function is specific to Node.js environments and is used for static server-side generation (SSG). It can resume a previously aborted prerendering process.

### Signature
```javascript
const {prelude, postponed} = await resumeAndPrerenderToNodeStream(reactNode, postponedState, options?)
```

### Import
```javascript
import { resumeAndPrerenderToNodeStream } from 'react-dom/static';
```

### Parameters
- **reactNode** (ReactNode) - Required - The React node you called `prerender` with. For example, a JSX element like `<App />`. It is expected to represent the entire document, so the `App` component should render the `<html>` tag.
- **postponedState** (Object) - Required - The opaque `postpone` object returned from a prerender API, loaded from storage (e.g., redis, a file, or S3).
- **options** (Object) - Optional - An object with streaming options.
  - **signal** (AbortSignal) - Optional - An abort signal that lets you abort server rendering and render the rest on the client.
  - **onError** (Function) - Optional - A callback that fires whenever there is a server error, whether recoverable or not. By default, this only calls `console.error`.

### Returns
Returns a Promise that resolves to an object containing:
- **prelude** (Stream) - A Web Stream of HTML. You can use this stream to send a response in chunks, or read the entire stream into a string.
- **postponed** (Object) - A JSON-serializeable, opaque object that can be passed to `resumeToNodeStream` or `resumeAndPrerenderToNodeStream` if the current call is aborted.

If rendering fails, the Promise is rejected.

### Usage Example
```javascript
import { resumeAndPrerenderToNodeStream } from 'react-dom/static';
import { getPostponedState } from 'storage';

async function handler(request, writable) {
  const postponedState = getPostponedState(request);
  const { prelude } = await resumeAndPrerenderToNodeStream(
    <App />,
    JSON.parse(postponedState)
  );
  prelude.pipe(writable);
}
```

### Response Example
```javascript
{
  "prelude": "[Stream of HTML content]",
  "postponed": {
    "_postponedState": "[opaque postponed state]"
  }
}
```

### Important Notes
- **Node.js Only**: This API is specific to Node.js. Environments with Web Streams, like Deno and modern edge runtimes, should use `prerender` instead.
- **No Nonce Support**: `nonce` is not an available option when prerendering. Nonces must be unique per request and including them in the prerender would be insecure.
- **Use Case**: Use for static server-side generation (SSG) when you need to wait for all data to load before resolving. For streaming content as it loads, use `renderToReadableStream` instead.
- **Abortable**: Can be aborted and later continued with another `resumeAndPrerenderToNodeStream` or resumed with `resume` to support partial pre-rendering.

### Related APIs
- `prerender` - For Web Stream environments
- `renderToReadableStream` - For streaming server-side rendering (SSR)
- `hydrateRoot` - To make server-generated HTML interactive on the client
```

--------------------------------

### React Counter Component with Updater Function Pattern

Source: https://react.dev/reference/react/useState

A complete React component example using the useState hook with an updater function for incrementing age state. The Counter component demonstrates how multiple increment calls in the same event handler properly batch updates using the updater pattern.

```javascript
import { useState } from 'react';

export default function Counter() {
  const [age, setAge] = useState(42);

  function increment() {
    setAge(a => a + 1);
  }

  return (
    <>
      <h1>Your age: {age}</h1>
      <button onClick={() => {
        increment();
        increment();
        increment();
      }}>+3</button>
      <button onClick={() => {
        increment();
      }}>+1</button>
    </>
  );
}
```

--------------------------------

### Custom Naming for React Event Handler Props (e.g., `onSmash`)

Source: https://react.dev/learn/responding-to-events

This React example demonstrates how to use custom names for event handler props in your own components, deviating from the standard `onClick`. The `Button` component now accepts an `onSmash` prop, which is internally mapped to the native `<button>`'s `onClick` event. This allows for more descriptive prop names tailored to component-specific interactions.

```javascript
function Button({ onSmash, children }) {
  return (
    <button onClick={onSmash}>
      {children}
    </button>
  );
}

export default function App() {
  return (
    <div>
      <Button onSmash={() => alert('Playing!')}>
        Play Movie
      </Button>
      <Button onSmash={() => alert('Uploading!')}>
        Upload Image
      </Button>
    </div>
  );
}
```

--------------------------------

### Initializing State for Stopwatch in React

Source: https://react.dev/learn/referencing-values-with-refs

Sets up state variables `startTime` and `now` using the `useState` hook in a React component. These variables are used to track time-dependent data that needs to trigger re-renders for display purposes in a stopwatch application.

```javascript
const [startTime, setStartTime] = useState(null);  
const [now, setNow] = useState(null);
```

--------------------------------

### useReducer Type Inference Improvements

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

useReducer no longer accepts the full reducer type as a single type parameter. Best practice is to pass no type arguments and rely on contextual typing, or explicitly type state and action parameters on the reducer function instead.

```typescript
- useReducer<React.Reducer<State, Action>>(reducer)
+ useReducer(reducer)
```

```typescript
- useReducer<React.Reducer<State, Action>>(reducer)
+ useReducer<State, [Action]>(reducer)
```

```typescript
- useReducer<React.Reducer<State, Action>>((state, action) => state)
+ useReducer((state: State, action: Action) => state)
```

```typescript
const reducer = (state: State, action: Action) => state;
```

--------------------------------

### Implement Static React Product Table Components

Source: https://react.dev/learn/thinking-in-react

This JavaScript code defines a set of React functional components for building a static product table. It includes `ProductCategoryRow`, `ProductRow`, `ProductTable`, `SearchBar`, and `FilterableProductTable`, along with an example `PRODUCTS` data array and the main `App` component. Data is passed between components exclusively using props, demonstrating a one-way data flow for a non-interactive UI.

```javascript
function ProductCategoryRow({ category }) {
  return (
    <tr>
      <th colSpan="2">
        {category}
      </th>
    </tr>
  );
}

function ProductRow({ product }) {
  const name = product.stocked ? product.name :
    <span style={{ color: 'red' }}>
      {product.name}
    </span>;

  return (
    <tr>
      <td>{name}</td>
      <td>{product.price}</td>
    </tr>
  );
}

function ProductTable({ products }) {
  const rows = [];
  let lastCategory = null;

  products.forEach((product) => {
    if (product.category !== lastCategory) {
      rows.push(
        <ProductCategoryRow
          category={product.category}
          key={product.category} />
      );
    }
    rows.push(
      <ProductRow
        product={product}
        key={product.name} />
    );
    lastCategory = product.category;
  });

  return (
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>
  );
}

function SearchBar() {
  return (
    <form>
      <input type="text" placeholder="Search..." />
      <label>
        <input type="checkbox" />
        {' '}
        Only show products in stock
      </label>
    </form>
  );
}

function FilterableProductTable({ products }) {
  return (
    <div>
      <SearchBar />
      <ProductTable products={products} />
    </div>
  );
}

const PRODUCTS = [
  {category: "Fruits", price: "$1", stocked: true, name: "Apple"},
  {category: "Fruits", price: "$1", stocked: true, name: "Dragonfruit"},
  {category: "Fruits", price: "$2", stocked: false, name: "Passionfruit"},
  {category: "Vegetables", price: "$2", stocked: true, name: "Spinach"},
  {category: "Vegetables", price: "$4", stocked: false, name: "Pumpkin"},
  {category: "Vegetables", price: "$1", stocked: true, name: "Peas"}
];

export default function App() {
  return <FilterableProductTable products={PRODUCTS} />;
}
```

--------------------------------

### Secure Data Fetching with experimental_taintObjectReference

Source: https://react.dev/reference/react/experimental_taintObjectReference

This example shows the secure approach using React's experimental_taintObjectReference API to prevent sensitive objects from being passed to Client Components. When applied to the user object, attempting to pass it to a Client Component will throw an error with a descriptive message, forcing developers to explicitly select only the necessary properties to pass down.

```javascript
// api.js
import { experimental_taintObjectReference } from 'react';

export async function getUser(id) {
  const user = await db`SELECT * FROM users WHERE id = ${id}`;
  experimental_taintObjectReference(
    'Do not pass the entire user object to the client. ' +
      'Instead, pick off the specific properties you need for this use case.',
    user,
  );
  return user;
}
```

--------------------------------

### Full React `List` Component with `cloneElement` and State Management

Source: https://react.dev/reference/react/cloneElement

Provides the complete implementation of a React `List` component that uses `cloneElement` to highlight selected child rows. It includes state management for `selectedIndex` and a 'Next' button to cycle through selections, demonstrating a functional example of overriding child props.

```javascript
import { Children, cloneElement, useState } from 'react';

export default function List({ children }) {
  const [selectedIndex, setSelectedIndex] = useState(0);
  return (
    <div className="List">
      {Children.map(children, (child, index) =>
        cloneElement(child, {
          isHighlighted: index === selectedIndex 
        })
      )}
      <hr />
      <button onClick={() => {
        setSelectedIndex(i =>
          (i + 1) % Children.count(children)
        );
      }}>
        Next
      </button>
    </div>
  );
}
```

--------------------------------

### Server-Side Streaming with renderToReadableStream for Edge Runtimes

Source: https://react.dev/blog/2022/03/29/react-v18

Illustrates the renderToReadableStream API from react-dom/server designed for modern edge runtime environments like Deno and Cloudflare Workers. Similar to renderToPipeableStream, it provides full Suspense streaming support but returns a ReadableStream compatible with edge computing platforms.

```javascript
import { renderToReadableStream } from 'react-dom/server';

const stream = await renderToReadableStream(<App />, {
  onError(error) {
    console.error(error);
    res.statusCode = 500;
  }
});
stream.pipeTo(res);
```

--------------------------------

### Annotating Document Items with React <link> and itemProp

Source: https://react.dev/reference/react-dom/components/link

This code example demonstrates how to use the `<link>` component with the `itemProp` attribute within a React component's render method. It allows linking related resources directly within the document body, rather than the HTML `<head>`, by associating the link with a specific `itemProp` attribute on an element, such as an author link for an article section.

```html
<section itemScope>  

  <h3>Annotating specific items</h3>  

  <link itemProp="author" href="http://example.com/" />  

  <p>...</p>  

</section>
```

--------------------------------

### Resume React Tree to Pipeable Stream (Node.js)

Source: https://react.dev/reference/react-dom/server/resumeToPipeableStream

This snippet demonstrates the basic usage of `resumeToPipeableStream` to initiate the streaming of a pre-rendered React tree. It returns an object containing `pipe` and `abort` methods, which are used to control the output stream and cancel rendering, respectively.

```javascript
const {pipe, abort} = await resumeToPipeableStream(reactNode, postponedState, options?)
```

--------------------------------

### React: Integrate Custom useChatRoom Hook into Application

Source: https://react.dev/reference/react/useEffect

This `App.js` example illustrates a complete React application integrating the `useChatRoom` custom hook within its `ChatRoom` component. It showcases how abstracting `useEffect` logic into a custom hook leads to cleaner, more readable component code while maintaining full chat functionality. The `ChatRoom` component uses the hook and manages `serverUrl` state.

```javascript
import { useState } from 'react';
import { useChatRoom } from './useChatRoom.js';

function ChatRoom({ roomId }) {
  const [serverUrl, setServerUrl] = useState('https://localhost:1234');

  useChatRoom({
    roomId: roomId,
    serverUrl: serverUrl
  });

  return (
    <>
      <label>
        Server URL:{' '}
        <input
          value={serverUrl}
          onChange={e => setServerUrl(e.target.value)}
        />
      </label>
      <h1>Welcome to the {roomId} room!</h1>
    </>
  );
}

export default function App() {
  const [roomId, setRoomId] = useState('general');
  const [show, setShow] = useState(false);
  return (
    <>
      <label>
        Choose the chat room:{' '}
        <select
          value={roomId}
          onChange={e => setSetRoomId(e.target.value)}
        >
          <option value="general">general</option>
          <option value="travel">travel</option>
          <option value="music">music</option>
        </select>
      </label>
      <button onClick={() => setShow(!show)}>
        {show ? 'Close chat' : 'Open chat'}
      </button>
      {show && <hr />}
      {show && <ChatRoom roomId={roomId} />}
    </>
  );
}
```

--------------------------------

### Implement useCallback for an event handler in a React component

Source: https://react.dev/reference/react/useCallback

This example demonstrates how to use `useCallback` to memoize an event handler function (`handleSubmit`) within a React functional component. The handler depends on `productId` and `referrer` props; `useCallback` ensures the function reference remains stable across renders unless these specific dependencies change, which is important for performance optimizations and stable function references.

```javascript
import { useCallback } from 'react';

export default function ProductPage({ productId, referrer, theme }) {
  const handleSubmit = useCallback((orderDetails) => {
    post('/product/' + productId + '/buy', {
      referrer,
      orderDetails,
    });
  }, [productId, referrer]);
}
```

--------------------------------

### Rendering React Components with `act` in Tests

Source: https://react.dev/reference/react/act

This test snippet illustrates how to correctly render a React component (`Counter`) using `act` to ensure that it is fully mounted and all its side effects (e.g., `useEffect`) have been processed before assertions are made. It utilizes `ReactDOMClient.createRoot` for rendering into a test DOM container.

```javascript
import {act} from 'react';  

import ReactDOMClient from 'react-dom/client';  

import Counter from './Counter';  

  
it('can render and update a counter', async () => {  

  container = document.createElement('div');  

  document.body.appendChild(container);  

    

  // ✅ Render the component inside act().  

  await act(() => {  

    ReactDOMClient.createRoot(container).render(<Counter />);  

  });  

    

  const button = container.querySelector('button');  

  const label = container.querySelector('p');  

  expect(label.textContent).toBe('You clicked 0 times');  

  expect(document.title).toBe('You clicked 0 times');  

});
```

--------------------------------

### Subscribing to Browser API with React useSyncExternalStore (Online Status)

Source: https://react.dev/reference/react/useSyncExternalStore

Illustrates how to use `useSyncExternalStore` to react to changes in a browser API, specifically `navigator.onLine`. The component displays the network status by providing custom `subscribe` and `getSnapshot` functions that listen for 'online' and 'offline' events on the window object.

```javascript
import { useSyncExternalStore } from 'react';

export default function ChatIndicator() {
  const isOnline = useSyncExternalStore(subscribe, getSnapshot);
  return <h1>{isOnline ? '✅ Online' : '❌ Disconnected'}</h1>;
}

function getSnapshot() {
  return navigator.onLine;
}

function subscribe(callback) {
  window.addEventListener('online', callback);
  window.addEventListener('offline', callback);
  return () => {
    window.removeEventListener('online', callback);
    window.removeEventListener('offline', callback);
  };
}
```

--------------------------------

### Declare React Ref using `useRef` Hook

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/refs

This example shows how to declare a React ref using the `useRef()` hook, initializing it with `null`. The lint rule identifies values returned from `useRef()` as refs. This is a fundamental step in managing mutable values that don't trigger re-renders.

```javascript
const scrollRef = useRef(null);
```

--------------------------------

### Full React Tic-Tac-Toe Game Implementation in App.js

Source: https://react.dev/learn/tutorial-tic-tac-toe

This comprehensive JavaScript code provides the complete implementation of a Tic-Tac-Toe game in React. It includes the `Square` and `Board` components, state management using `useState`, the `handleClick` logic, and the `calculateWinner` utility function, demonstrating a fully functional game.

```javascript
import { useState } from 'react';

function Square({value, onSquareClick}) {
  return (
    <button className="square" onClick={onSquareClick}>
      {value}
    </button>
  );
}

export default function Board() {
  const [xIsNext, setXIsNext] = useState(true);
  const [squares, setSquares] = useState(Array(9).fill(null));

  function handleClick(i) {
    if (calculateWinner(squares) || squares[i]) {
      return;
    }
    const nextSquares = squares.slice();
    if (xIsNext) {
      nextSquares[i] = 'X';
    } else {
      nextSquares[i] = 'O';
    }
    setSquares(nextSquares);
    setXIsNext(!xIsNext);
  }

  const winner = calculateWinner(squares);
  let status;
  if (winner) {
    status = 'Winner: ' + winner;
  } else {
    status = 'Next player: ' + (xIsNext ? 'X' : 'O');
  }

  return (
    <>
      <div className="status">{status}</div>
      <div className="board-row">
        <Square value={squares[0]} onSquareClick={() => handleClick(0)} />
        <Square value={squares[1]} onSquareClick={() => handleClick(1)} />
        <Square value={squares[2]} onSquareClick={() => handleClick(2)} />
      </div>
      <div className="board-row">
        <Square value={squares[3]} onSquareClick={() => handleClick(3)} />
        <Square value={squares[4]} onSquareClick={() => handleClick(4)} />
        <Square value={squares[5]} onSquareClick={() => handleClick(5)} />
      </div>
      <div className="board-row">
        <Square value={squares[6]} onSquareClick={() => handleClick(6)} />
        <Square value={squares[7]} onSquareClick={() => handleClick(7)} />
        <Square value={squares[8]} onSquareClick={() => handleClick(8)} />
      </div>
    </>
  );
}

function calculateWinner(squares) {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}
```

--------------------------------

### Define React Component with Adjacent JSX Elements (Error Example)

Source: https://react.dev/learn/tutorial-tic-tac-toe

This code snippet demonstrates an incorrect way to define a React component by returning multiple adjacent JSX elements directly. This will result in a compilation error, as React components must return a single root element. It highlights a common mistake for new React developers.

```javascript
export default function Square() {  
  return <button className="square">X</button><button className="square">X</button>;  
}
```

--------------------------------

### Implement Lifecycle Methods in Class Component

Source: https://react.dev/reference/react/Component

Add lifecycle methods (componentDidMount, componentDidUpdate, componentWillUnmount) to manage component initialization, updates, and cleanup. These methods handle side effects like creating connections, responding to prop/state changes, and resource cleanup. The example demonstrates synchronizing a chat connection with props and state.

```javascript
import { Component } from 'react';
import { createConnection } from './chat.js';

export default class ChatRoom extends Component {
  state = {
    serverUrl: 'https://localhost:1234'
  };

  componentDidMount() {
    this.setupConnection();
  }

  componentDidUpdate(prevProps, prevState) {
    if (
      this.props.roomId !== prevProps.roomId ||
      this.state.serverUrl !== prevState.serverUrl
    ) {
      this.destroyConnection();
      this.setupConnection();
    }
  }

  componentWillUnmount() {
    this.destroyConnection();
  }

  setupConnection() {
    this.connection = createConnection(
      this.state.serverUrl,
      this.props.roomId
    );
    this.connection.connect();
  }

  destroyConnection() {
    this.connection.disconnect();
    this.connection = null;
  }

  render() {
    return (
      <>
        <label>
          Server URL:{' '}
          <input
            value={this.state.serverUrl}
            onChange={e => {
              this.setState({
                serverUrl: e.target.value
              });
            }}
          />
        </label>
        <h1>Welcome to the {this.props.roomId} room!</h1>
      </>
    );
  }
}
```

--------------------------------

### renderToStaticMarkup

Source: https://react.dev/reference/react-dom/server

Renders a non-interactive React tree to an HTML string. This legacy API is for non-streaming environments where the component tree does not require interactivity.

```APIDOC
## renderToStaticMarkup

### Description
Renders a non-interactive React tree to a static HTML string. Use this for components that don't require hydration or client-side interactivity.

### Environment
Non-streaming environments

### Usage
Import from `react-dom/server`

### Parameters
- **component** (React Component) - Required - A non-interactive React component to render

### Return Value
- **string** - The rendered HTML string

### Example
```javascript
import { renderToStaticMarkup } from 'react-dom/server';

const html = renderToStaticMarkup(<StaticPage />);
```

### Use Cases
Ideal for static content generation where the component tree will not be hydrated on the client or made interactive.

### Limitations
This method has limited functionality compared to streaming APIs and does not support interactive components. For better performance, use streaming APIs when available.
```

--------------------------------

### Incorrect: Using custom 'lifecycle' Hooks in React

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

This example demonstrates an anti-pattern where a custom `useMount` Hook attempts to encapsulate 'on mount' logic. Such Hooks are problematic because they hide `useEffect`'s dependency array, leading to silent bugs where effects don't react to prop or state changes, and the React linter cannot provide warnings.

```javascript
function ChatRoom({ roomId }) {  
  const [serverUrl, setServerUrl] = useState('https://localhost:1234');  
  
  // 🔴 Avoid: using custom "lifecycle" Hooks  
  useMount(() => {  
    const connection = createConnection({ roomId, serverUrl });  
    connection.connect();  
  
    post('/analytics/event', { eventName: 'visit_chat' });  
  });  
  // ...  
}  
  
// 🔴 Avoid: creating custom "lifecycle" Hooks  
function useMount(fn) {  
  useEffect(() => {  
    fn();  
  }, []); // 🔴 React Hook useEffect has a missing dependency: 'fn'  
}
```

--------------------------------

### Provide Context Value with Provider in React

Source: https://react.dev/reference/react/createContext

Wraps child components with a context provider to supply dynamic context values. The provider accepts a value prop that is passed to all components reading the context via useContext, regardless of nesting depth. Starting in React 19, you can render context directly as a provider; older versions require the .Provider syntax.

```javascript
function App() {
  const [theme, setTheme] = useState('light');

  return (
    <ThemeContext value={theme}>
      <Page />
    </ThemeContext>
  );
}
```

--------------------------------

### Pass Ref from Parent to Child Component in React

Source: https://react.dev/learn/manipulating-the-dom-with-refs

Demonstrates how to create a ref in a parent component and pass it to a child component, which then attaches it to a DOM element. The parent component can then access and manipulate the DOM element through the ref. This example shows a MyForm parent component passing a ref to a MyInput child component.

```javascript
import { useRef } from 'react';

function MyInput({ ref }) {
  return <input ref={ref} />;
}

function MyForm() {
  const inputRef = useRef(null);
  return <MyInput ref={inputRef} />
}
```

--------------------------------

### Illustrate React 17 Batching Behavior

Source: https://react.dev/blog/2022/03/08/react-18-upgrade-guide

This JavaScript example demonstrates the state update batching behavior in React versions prior to React 18. Updates inside React event handlers are batched into a single re-render, while updates within `setTimeout` or similar asynchronous operations are not batched, leading to multiple re-renders.

```javascript
// Before React 18 only React events were batched  
  
function handleClick() {  
  setCount(c => c + 1);  
  setFlag(f => !f);  
  // React will only re-render once at the end (that's batching!)  
}  
  
setTimeout(() => {  
  setCount(c => c + 1);  
  setFlag(f => !f);  
  // React will render twice, once for each state update (no batching)  
}, 1000);
```

--------------------------------

### Valid React Ref Usage: Effects, State, and Lazy Initialization

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/refs

This snippet provides examples of correct React ref usage, including reading `ref.current` within `useEffect` or event handlers, using state for UI-related values, and performing lazy initialization of ref values. These patterns ensure refs are used appropriately without violating React's rendering lifecycle. They demonstrate how to interact with mutable data without triggering re-renders unnecessarily.

```javascript
// ✅ Read ref in effects/handlers  
function Component() {  
  const ref = useRef(null);  
  
  useEffect(() => {  
    if (ref.current) {  
      console.log(ref.current.offsetWidth); // OK in effect  
    }  
  });  
  
  return <div ref={ref} />;  
}  
  
// ✅ Use state for UI values  
function Component() {  
  const [count, setCount] = useState(0);  
  
  return (  
    <button onClick={() => setCount(count + 1)}>  
      {count}  
    </button>  
  );  
}  
  
// ✅ Lazy initialization of ref value  
function Component() {  
  const ref = useRef(null);  
  
  // Initialize only once on first use  
  if (ref.current === null) {  
    ref.current = expensiveComputation(); // OK - lazy initialization  
  }  
  
  const handleClick = () => {  
    console.log(ref.current); // Use the initialized value  
  };  
  
  return <button onClick={handleClick}>Click</button>;  
}
```

--------------------------------

### renderToStaticMarkup - Basic Syntax

Source: https://react.dev/reference/react-dom/server/renderToStaticMarkup

The basic function signature for renderToStaticMarkup. This function takes a React node and optional configuration object to render it to an HTML string on the server.

```JavaScript
const html = renderToStaticMarkup(reactNode, options?);
```

--------------------------------

### React App using `startTransition` to prevent content hiding during navigation

Source: https://react.dev/reference/react/Suspense

This updated React application uses `startTransition` to wrap the state update for navigation. By marking the navigation as a non-urgent transition, React is instructed to keep showing the already revealed content (like the `Layout`) while new, potentially suspending content loads. This prevents the jarring full page fallback seen in the previous example.

```javascript
import { Suspense, startTransition, useState } from 'react';
import IndexPage from './IndexPage.js';
import ArtistPage from './ArtistPage.js';
import Layout from './Layout.js';

export default function App() {
  return (
    <Suspense fallback={<BigSpinner />}>
      <Router />
    </Suspense>
  );
}

function Router() {
  const [page, setPage] = useState('/');

  function navigate(url) {
    startTransition(() => {
      setPage(url);
    });
  }

  let content;
  if (page === '/') {
    content = (
      <IndexPage navigate={navigate} />
    );
  } else if (page === '/the-beatles') {
    content = (
      <ArtistPage
        artist={{
          id: 'the-beatles',
          name: 'The Beatles',
        }}
      />
    );
  }
  return (
    <Layout>
      {content}
    </Layout>
  );
}

function BigSpinner() {
  return <h2>🌀 Loading...</h2>;
}
```

--------------------------------

### Refactor React ChatRoom Component to Use Custom Hook

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

This example shows the `ChatRoom` component refactored to utilize the `useChatRoom` custom Hook. By delegating the connection management to the custom Hook, the component's logic becomes simpler and more focused on rendering UI elements, while still reacting to changes in `serverUrl` and `roomId`.

```javascript
export default function ChatRoom({ roomId }) {  

  const [serverUrl, setServerUrl] = useState('https://localhost:1234');  

  

  useChatRoom({  

    roomId: roomId,  

    serverUrl: serverUrl  

  });  

  

  return (  

    <>  

      <label>  

        Server URL:  

        <input value={serverUrl} onChange={e => setServerUrl(e.target.value)} />  

      </label>  

      <h1>Welcome to the {roomId} room!</h1>  

    </>  

  );  

}
```

--------------------------------

### Preinit an ESM Module in a React Event Handler (JSX)

Source: https://react.dev/reference/react-dom/preinitModule

This snippet demonstrates calling `preinitModule` inside an event handler, such as a button's `onClick` event. This strategy allows the module to begin downloading and evaluating proactively, before the user fully navigates to a new state or page that depends on the module, thus improving perceived load times.

```jsx
import { preinitModule } from 'react-dom';  
  
function CallToAction() {  
  const onClick = () => {  
    preinitModule("https://example.com/module.js", {as: "script"});  
    startWizard();  
  }  
  return (  
    <button onClick={onClick}>Start Wizard</button>  
  );  
}
```

--------------------------------

### React Impure Component with State - Multiple Renders Expose Bug

Source: https://react.dev/reference/react/StrictMode

An enhanced version of the buggy StoryTray component that uses useState to trigger re-renders on hover. This makes the mutation bug obvious as 'Create Story' gets added multiple times to the array with each render, demonstrating how impurity causes unpredictable behavior in interactive components.

```javascript
import { useState } from 'react';

export default function StoryTray({ stories }) {
  const [isHover, setIsHover] = useState(false);
  const items = stories;
  items.push({ id: 'create', label: 'Create Story' });
  return (
    <ul
      onPointerEnter={() => setIsHover(true)}
      onPointerLeave={() => setIsHover(false)}
      style={{
        backgroundColor: isHover ? '#ddd' : '#fff'
      }}
    >
      {items.map(story => (
        <li key={story.id}>
          {story.label}
        </li>
      ))}
    </ul>
  );
}
```

--------------------------------

### Configure React Compiler with Per-Override Options in Babel

Source: https://react.dev/learn/react-compiler/incremental-adoption

Apply React Compiler with custom options to different directories using Babel overrides. This configuration demonstrates how to pass specific compiler options to different code sections, allowing fine-tuned compilation settings for experimental versus production code.

```javascript
// babel.config.js

module.exports = {
  plugins: [],
  overrides: [
    {
      test: './src/experimental/**/*.{js,jsx,ts,tsx}',
      plugins: [
        ['babel-plugin-react-compiler', {
          // options ...
        }]
      ]
    },
    {
      test: './src/production/**/*.{js,jsx,ts,tsx}',
      plugins: [
        ['babel-plugin-react-compiler', {
          // options ...
        }]
      ]
    }
  ]
};
```

--------------------------------

### Incorrect Arrow Function Syntax Returning Object from useMemo

Source: https://react.dev/reference/react/useMemo

Illustrates the common syntax error where arrow function body braces are confused with object literal braces, causing useMemo to return undefined instead of an object. The arrow function `() => {` interprets the brace as starting a function body, not an object.

```javascript
const searchOptions = useMemo(() => {
  matchMode: 'whole-word',
  text: text
}, [text]);
```

--------------------------------

### Vulnerable React Server Function with Source Code Exposure

Source: https://react.dev/blog/2025/12/11/denial-of-service-and-source-code-exposure-in-react-server-components

Example of a vulnerable Server Function that exposes source code through explicit and implicit stringification. The function accepts a name parameter and creates a database connection using a hardcoded secret key. Both the database operation and the return message expose the stringified argument, making the source code and secrets susceptible to leakage through malicious HTTP requests.

```javascript
'use server';

export async function serverFunction(name) {
  const conn = db.createConnection('SECRET KEY');
  const user = await conn.createUser(name); // implicitly stringified, leaked in db

  return {
    id: user.id,
    message: `Hello, ${name}!` // explicitly stringified, leaked in reply
  }
}
```

--------------------------------

### Render React Component in Specific HTML Element

Source: https://react.dev/learn/add-react-to-an-existing-project

Recommended approach for integrating React into existing pages. Adds a unique ID to an HTML element and renders a React component inside it while preserving all other HTML content. Enables incremental React adoption by targeting specific DOM nodes.

```html
<!-- ... somewhere in your html ... -->
<nav id="navigation"></nav>
<!-- ... more html ... -->
```

```javascript
import { createRoot } from 'react-dom/client';

function NavigationBar() {
  // TODO: Actually implement a navigation bar
  return <h1>Hello from React!</h1>;
}

const domNode = document.getElementById('navigation');
const root = createRoot(domNode);
root.render(<NavigationBar />);
```

--------------------------------

### Applying React Compiler Directives at Function Level

Source: https://react.dev/reference/react-compiler/directives

This example illustrates how to use "use memo" and "use no memo" directives directly within function bodies. "use memo" opts a function into compilation, while "use no memo" explicitly prevents it, providing fine-grained control over which functions the React Compiler processes.

```javascript
// Opt into compilation
function OptimizedComponent() {
  "use memo";
  return <div>This will be optimized</div>;
}

// Opt out of compilation
function UnoptimizedComponent() {
  "use no memo";
  return <div>This won't be optimized</div>;
}
```

--------------------------------

### JSX Namespace Module Augmentation in React 19

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

The global JSX namespace is removed in favor of React.JSX to prevent global type pollution and conflicts with other UI libraries. Module augmentation now requires wrapping in declare module with the appropriate JSX runtime module specifier.

```typescript
// global.d.ts
+ declare module "react" {
    namespace JSX {
      interface IntrinsicElements {
        "my-element": {
          myElementProps: string;
        };
      }
    }
+ }
```

--------------------------------

### Conditional Rendering with Ternary Operator - React JSX

Source: https://react.dev/blog/2023/03/16/introducing-react-dev

Demonstrates conditional rendering in React using the ternary operator (? :) to display different content based on component state. The example shows a packing list component that renders checkmarks for packed items and uses conditional logic to display item status. This pattern is fundamental for showing/hiding UI elements based on boolean conditions.

```JavaScript
function Item({ name, isPacked }) {
  return (
    <li className="item">
      {name} {isPacked && '✅'}
    </li>
  );
}

export default function PackingList() {
  return (
    <section>
      <h1>Sally Ride's Packing List</h1>
      <ul>
        <Item 
          isPacked={true} 
          name="Space suit" 
        />
        <Item 
          isPacked={true} 
          name="Helmet with a golden leaf" 
        />
        <Item 
          isPacked={false} 
          name="Photo of Tam" 
        />
      </ul>
    </section>
  );
}
```

--------------------------------

### React Server Component importing a Client Component for interactivity

Source: https://react.dev/reference/rsc/server-components

This JavaScript code shows a `Notes` Server Component that fetches data and renders a list of notes. It composes its UI using an `Expandable` Client Component, demonstrating how Server Components can integrate interactive elements by passing data as props to Client Components.

```javascript

// Server Component  
import Expandable from './Expandable';  

async function Notes() {  
  const notes = await db.notes.getAll();  
  return (  
    <div>  
      {notes.map(note => (  
        <Expandable key={note.id}>  
          <p note={note} />  
        </Expandable>  
      ))}  
    </div>  
  )  
}
```

--------------------------------

### Remove Redundant State Variables in React Form

Source: https://react.dev/learn/managing-state

Demonstrates how to eliminate redundant state by computing fullName directly during render instead of storing it as a separate state variable. This prevents synchronization bugs and simplifies state management. The example shows a form with firstName and lastName inputs where fullName is derived from these values.

```JavaScript
import { useState } from 'react';

export default function Form() {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');

  const fullName = firstName + ' ' + lastName;

  function handleFirstNameChange(e) {
    setFirstName(e.target.value);
  }

  function handleLastNameChange(e) {
    setLastName(e.target.value);
  }

  return (
    <>
      <h2>Let's check you in</h2>
      <label>
        First name:{' '}
        <input
          value={firstName}
          onChange={handleFirstNameChange}
        />
      </label>
      <label>
        Last name:{' '}
        <input
          value={lastName}
          onChange={handleLastNameChange}
        />
      </label>
      <p>
        Your ticket will be issued to: <b>{fullName}</b>
      </p>
    </>
  );
}
```

--------------------------------

### Close all JSX tags with proper syntax

Source: https://react.dev/learn/writing-markup-with-jsx

Demonstrates the second rule of JSX: all tags must be explicitly closed. Self-closing tags like `<img>` must include a forward slash (`<img />`), and wrapping tags must have closing tags. This example shows the corrected HTML-to-JSX conversion with all tags properly closed.

```javascript
<>
  <img 
    src="https://i.imgur.com/yXOvdOSs.jpg" 
    alt="Hedy Lamarr" 
    class="photo"
   />
  <ul>
    <li>Invent new traffic lights</li>
    <li>Rehearse a movie scene</li>
    <li>Improve the spectrum technology</li>
  </ul>
</>
```

--------------------------------

### Create Server Component Reading File System

Source: https://react.dev/reference/rsc/use-client

Implements CounterContainer as a Server Component that reads from the file system using Node.js fs/promises module and passes the result to the Counter Client Component. Demonstrates that non-interactive components reading server-only resources should remain Server Components and do not require 'use client' directive.

```javascript
import { readFile } from 'node:fs/promises';

import Counter from './Counter';

export default async function CounterContainer() {
  const initialValue = await readFile('/path/to/counter_value');
  return <Counter initialValue={initialValue} />
}
```

--------------------------------

### Declare multiple `useState` variables for various visual states in React

Source: https://react.dev/learn/reacting-to-input-with-state

This code block illustrates an initial approach to representing multiple visual states (empty, typing, submitting, success, error) using separate boolean `useState` variables. This method serves as a starting point before more optimized state refactoring is applied.

```javascript
const [isEmpty, setIsEmpty] = useState(true);
const [isTyping, setIsTyping] = useState(false);
const [isSubmitting, setIsSubmitting] = useState(false);
const [isSuccess, setIsSuccess] = useState(false);
const [isError, setIsError] = useState(false);
```

--------------------------------

### Grouping React Elements with Fragment Shorthand

Source: https://react.dev/reference/react/Fragment

Demonstrates the basic usage of React Fragments using the shorthand `<>...</>` syntax to group multiple child components. This prevents adding unnecessary wrapper `div` elements to the DOM structure while still satisfying the requirement of returning a single parent element from a component.

```jsx
<>
  <OneChild />
  <AnotherChild />
</>
```

--------------------------------

### Import and Use React Component Base Class

Source: https://react.dev/reference/react/Component

Demonstrates importing the Component class from React and defining a class component that extends it. This is the foundational pattern for creating class-based components in React.

```javascript
import { Component } from 'react';

class Greeting extends Component {
  render() {
    return <h1>Hello, {this.props.name}!</h1>;
  }
}
```

--------------------------------

### Handle HTML Drag and Drop API events in React JSX

Source: https://react.dev/reference/react-dom/components/common

This example shows how to implement drag-and-drop functionality in React using `DragEvent` handlers. It covers `onDragStart` and `onDragEnd` for draggable elements, and `onDragEnter`, `onDragLeave`, `onDragOver`, and `onDrop` for drop targets. Notably, `e.preventDefault()` is used within `onDragOver` to allow dropping.

```javascript
<>
  <div
    draggable={true}
    onDragStart={e => console.log('onDragStart')}
    onDragEnd={e => console.log('onDragEnd')}
  >
    Drag source
  </div>

  <div
    onDragEnter={e => console.log('onDragEnter')}
    onDragLeave={e => console.log('onDragLeave')}
    onDragOver={e => { e.preventDefault(); console.log('onDragOver'); }}
    onDrop={e => console.log('onDrop')}
  >
    Drop target
  </div>
</>
```

--------------------------------

### Create Pure React Components with Props

Source: https://react.dev/learn/describing-the-ui

Shows how to refactor an impure component into a pure one by passing necessary data as props instead of relying on or modifying external variables. This ensures that the component's output depends solely on its inputs (props), making it predictable, testable, and easier to reason about.

```javascript
function Cup({ guest }) {
  return <h2>Tea cup for guest #{guest}</h2>;
}

export default function TeaSet() {
  return (
    <>
      <Cup guest={1} />
      <Cup guest={2} />
      <Cup guest={3} />
    </>
  );
}
```

--------------------------------

### Set Inner HTML Safely with dangerouslySetInnerHTML in React

Source: https://react.dev/reference/react-dom/components/common

Demonstrates how to safely use dangerouslySetInnerHTML by creating the {__html} object close to where HTML is generated. This pattern ensures all raw HTML is explicitly marked and only trusted sources are passed to the property. The example uses a Markdown parser to convert markdown to HTML.

```JavaScript
import { Remarkable } from 'remarkable';

const md = new Remarkable();

function renderMarkdownToHTML(markdown) {
  // This is ONLY safe because the output HTML
  // is shown to the same user, and because you
  // trust this Markdown parser to not have bugs.
  const renderedHTML = md.render(markdown);
  return {__html: renderedHTML};
}

export default function MarkdownPreview({ markdown }) {
  const markup = renderMarkdownToHTML(markdown);
  return <div dangerouslySetInnerHTML={markup} />;
}
```

--------------------------------

### Define serializable types for Server Function arguments in React

Source: https://react.dev/reference/rsc/use-server

Illustrates supported serializable types for Server Function arguments including primitives, iterables, Date, FormData, plain objects, and Server Functions. Demonstrates valid type examples like Symbol.for() for registered symbols and proper object structures.

```javascript
// Supported primitive types
const stringArg = 'value';
const numberArg = 42;
const booleanArg = true;
const nullArg = null;
const undefinedArg = undefined;
const symbolArg = Symbol.for('registered');

// Supported iterables
const arrayArg = [1, 2, 3];
const mapArg = new Map([['key', 'value']]);
const setArg = new Set([1, 2, 3]);
const typedArrayArg = new Uint8Array([1, 2, 3]);

// Supported objects
const dateArg = new Date();
const formDataArg = new FormData();
const plainObjectArg = { prop1: 'value', prop2: 123 };
```

--------------------------------

### Move Function Declaration Inside useEffect in React

Source: https://react.dev/reference/react/useEffect

Shows the optimized approach by declaring the createOptions function inside the Effect instead of outside. This reduces the dependency array to only include roomId (a string), preventing unnecessary re-runs when other props change. Includes a complete ChatRoom and App component example.

```javascript
import { useState, useEffect } from 'react';
import { createConnection } from './chat.js';

const serverUrl = 'https://localhost:1234';

function ChatRoom({ roomId }) {
  const [message, setMessage] = useState('');

  useEffect(() => {
    function createOptions() {
      return {
        serverUrl: serverUrl,
        roomId: roomId
      };
    }

    const options = createOptions();
    const connection = createConnection(options);
    connection.connect();
    return () => connection.disconnect();
  }, [roomId]);

  return (
    <>
      <h1>Welcome to the {roomId} room!</h1>
      <input value={message} onChange={e => setMessage(e.target.value)} />
    </>
  );
}

export default function App() {
  const [roomId, setRoomId] = useState('general');
  return (
    <>
      <label>
        Choose the chat room:{' '}
        <select
          value={roomId}
          onChange={e => setRoomId(e.target.value)}
        >
          <option value="general">general</option>
          <option value="travel">travel</option>
          <option value="music">music</option>
        </select>
      </label>
      <hr />
      <ChatRoom roomId={roomId} />
    </>
  );
}
```

--------------------------------

### Directly calling `preloadModule` for ESM modules in JavaScript

Source: https://react.dev/reference/react-dom/preloadModule

This snippet illustrates a standalone, direct invocation of the `preloadModule` function to eagerly fetch a specified ESM module. It demonstrates the basic syntax and parameters required for preloading.

```javascript
preloadModule("https://example.com/module.js", {as: "script"});
```

--------------------------------

### React: Calling Hooks from Valid React Functions

Source: https://react.dev/reference/rules/rules-of-hooks

This example highlights the rule that React Hooks must only be called from React function components or custom Hooks. It demonstrates a correct call within a function component and an incorrect call within a regular JavaScript function, emphasizing the importance of component context for Hook execution.

```javascript
function FriendList() {  
  const [onlineStatus, setOnlineStatus] = useOnlineStatus(); // ✅  
}  
  
function setOnlineStatus() { // ❌ Not a component or custom Hook!  
  const [onlineStatus, setOnlineStatus] = useOnlineStatus();  
}
```

--------------------------------

### Update Next.js for Security Patches (npm)

Source: https://react.dev/blog/2025/12/03/critical-security-vulnerability-in-react-server-components

These commands provide specific instructions to upgrade Next.js to patched versions, addressing critical security vulnerabilities. Users should choose the command corresponding to their current Next.js release line, including handling downgrades for canary releases.

```bash
npm install next@14.2.35  // for 13.3.x, 13.4.x, 13.5.x, 14.x  

npm install next@15.0.7   // for 15.0.x  

npm install next@15.1.11  // for 15.1.x  

npm install next@15.2.8   // for 15.2.x  

npm install next@15.3.8   // for 15.3.x  

npm install next@15.4.10  // for 15.4.x  

npm install next@15.5.9   // for 15.5.x  

npm install next@16.0.10  // for 16.0.x  

  
npm install next@15.6.0-canary.60   // for 15.x canary releases  

npm install next@16.1.0-canary.19   // for 16.x canary releases
```

```bash
npm install next@14
```

--------------------------------

### ShippingForm Component with Repetitive Effects

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

A React component that displays two dependent dropdowns for selecting cities and areas. It uses two separate useEffect hooks to fetch data from an API based on country and city selections. This example demonstrates the pattern of repetitive Effects that can be refactored into a custom Hook.

```javascript
function ShippingForm({ country }) {
  const [cities, setCities] = useState(null);
  // This Effect fetches cities for a country
  useEffect(() => {
    let ignore = false;
    fetch(`/api/cities?country=${country}`)
      .then(response => response.json())
      .then(json => {
        if (!ignore) {
          setCities(json);
        }
      });
    return () => {
      ignore = true;
    };
  }, [country]);
  const [city, setCity] = useState(null);
  const [areas, setAreas] = useState(null);
  // This Effect fetches areas for the selected city
  useEffect(() => {
    if (city) {
      let ignore = false;
      fetch(`/api/areas?city=${city}`)
        .then(response => response.json())
        .then(json => {
          if (!ignore) {
            setAreas(json);
          }
        });
      return () => {
        ignore = true;
      };
    }
  }, [city]);
  // ...
}
```

--------------------------------

### Define Root HTML Element for React Application

Source: https://react.dev/reference/react-dom/client/createRoot

Provides the essential HTML markup for the root DOM element where a React application will be mounted. This `div` with `id="root"` acts as the primary entry point for React to render and manage its components within the web page.

```html
<div id="root"></div>
```

--------------------------------

### React Component Mirroring Initial Prop for Controlled State

Source: https://react.dev/learn/choosing-the-state-structure

This example shows an intentional use case for mirroring a prop (`initialColor`) into state, specifically when the prop is meant to serve only as an initial value. The state variable (`color`) will hold the first value of `initialColor`, and subsequent updates to `initialColor` from the parent component will be ignored. This pattern is suitable for components that allow internal state to diverge from an initial prop value.

```javascript
function Message({ initialColor }) {  

  // The `color` state variable holds the *first* value of `initialColor`.  

  // Further changes to the `initialColor` prop are ignored.  

  const [color, setColor] = useState(initialColor);

```

--------------------------------

### Valid React Hooks usage adhering to Rules of Hooks

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/rules-of-hooks

Provides an example of a React functional component demonstrating correct application of the Rules of Hooks. Hooks like `useState` are called unconditionally at the top level of the component, and the `use` hook is correctly used conditionally within an `if` block, as permitted for `use`.

```javascript
function Component({ isSpecial, shouldFetch, fetchPromise }) {  
  // ✅ Hooks at top level  
  const [count, setCount] = useState(0);  
  const [name, setName] = useState('');  
  
  if (!isSpecial) {  
    return null;  
  }  
  
  if (shouldFetch) {  
    // ✅ `use` can be conditional  
    const data = use(fetchPromise);  
    return <div>{data}</div>;  
  }  
  
  return <div>{name}: {count}</div>;  
}
```

--------------------------------

### Restrict Ref API with useImperativeHandle in React

Source: https://react.dev/learn/manipulating-the-dom-with-refs

Demonstrates how to use useImperativeHandle to expose only a subset of the DOM element's functionality through a ref. Instead of exposing the entire input element, this example restricts the parent component to only calling the focus() method. The child component creates a custom object that defines which methods are available to the parent.

```javascript
import { useRef, useImperativeHandle } from "react";

function MyInput({ ref }) {
  const realInputRef = useRef(null);
  useImperativeHandle(ref, () => ({
    // Only expose focus and nothing else
    focus() {
      realInputRef.current.focus();
    },
  }));
  return <input ref={realInputRef} />;
};

export default function Form() {
  const inputRef = useRef(null);

  function handleClick() {
    inputRef.current.focus();
  }

  return (
    <>
      <MyInput ref={inputRef} />
      <button onClick={handleClick}>Focus the input</button>
    </>
  );
}
```

--------------------------------

### cloneElement Basic Syntax and Usage

Source: https://react.dev/reference/react/cloneElement

Demonstrates the basic syntax of cloneElement function, showing how to create a cloned React element with overridden props and replaced children. The function takes a source element, new props object, and optional new children, returning a new element with merged properties while preserving the original element unchanged.

```javascript
import { cloneElement } from 'react';

const clonedElement = cloneElement(
  <Row title="Cabbage">
    Hello
  </Row>,
  { isHighlighted: true },
  'Goodbye'
);

console.log(clonedElement); // <Row title="Cabbage" isHighlighted={true}>Goodbye</Row>
```

--------------------------------

### Consume React Context with Custom Hooks

Source: https://react.dev/learn/scaling-up-with-reducer-and-context

Shows how to utilize the custom hooks, `useTasks` and `useTasksDispatch`, within a functional component. This approach simplifies context consumption, making the component code more readable and abstracting the underlying context mechanism.

```javascript
const tasks = useTasks();
const dispatch = useTasksDispatch();
```

--------------------------------

### Correct React Component Definition at Top Level

Source: https://react.dev/learn/your-first-component

Shows the recommended pattern for defining React components. Components should be defined at the top level outside of other component functions. This approach improves performance and prevents bugs.

```javascript
export default function Gallery() {
  // ...
}

// ✅ Declare components at the top level
function Profile() {
  // ...
}
```

--------------------------------

### renderToPipeableStream

Source: https://react.dev/reference/react-dom/server

Renders a React tree to a pipeable Node.js Stream. This method is the recommended approach for server-side rendering in Node.js environments with streaming support.

```APIDOC
## renderToPipeableStream

### Description
Renders a React tree to a pipeable Node.js Stream for server-side rendering in Node.js environments.

### Environment
Node.js Streams

### Usage
Import from `react-dom/server`

### Parameters
- **component** (React Component) - Required - The root React component to render
- **options** (object) - Optional - Configuration options for rendering

### Return Value
- **PipeableStream** - A Node.js Stream that can be piped to response objects

### Example
```javascript
import { renderToPipeableStream } from 'react-dom/server';

const stream = renderToPipeableStream(<App />);
stream.pipe(response);
```

### Performance Note
StreamingAPIs provide better performance compared to non-streaming alternatives. Use this method in Node.js environments for optimal server-side rendering.
```

--------------------------------

### Invalid Component-Hook Factories in React

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/component-hook-factories

Examples of incorrect code patterns showing factory functions creating components, components defined inside other components, and hook factory functions. These patterns create new instances on every call, causing React to destroy and recreate the entire component tree and lose all state.

```javascript
// ❌ Factory function creating components
function createComponent(defaultValue) {
  return function Component() {
    // ...
  };
}

// ❌ Component defined inside component
function Parent() {
  function Child() {
    // ...
  }
  return <Child />;
}

// ❌ Hook factory function
function createCustomHook(endpoint) {
  return function useData() {
    // ...
  };
}
```

--------------------------------

### React: Correctly Calling Hooks at Top Level

Source: https://react.dev/reference/rules/rules-of-hooks

This example demonstrates the correct usage of React Hooks (`useState`) by calling them at the top level of a function component and a custom Hook. This adheres to the rule that Hooks must not be called inside loops, conditions, or nested functions, ensuring React's state management works as expected.

```javascript
function Counter() {  
  // ✅ Good: top-level in a function component  
  const [count, setCount] = useState(0);  
  // ...  
}  
  
function useWindowWidth() {  
  // ✅ Good: top-level in a custom Hook  
  const [width, setWidth] = useState(window.innerWidth);  
  // ...  
}
```

--------------------------------

### React Effect with optimized dependencies

Source: https://react.dev/learn/escape-hatches

This optimized React functional component `ChatRoom` refactors the previous example. The `options` object creation is moved inside the `useEffect` hook. This change ensures that the effect only depends on the `roomId` string, preventing unnecessary re-runs when the `message` state updates, and thus avoiding frequent chat reconnections.

```javascript
import { useState, useEffect } from 'react';
import { createConnection } from './chat.js';

const serverUrl = 'https://localhost:1234';

function ChatRoom({ roomId }) {
  const [message, setMessage] = useState('');

  useEffect(() => {
    const options = {
      serverUrl: serverUrl,
      roomId: roomId
    };
    const connection = createConnection(options);
    connection.connect();
    return () => connection.disconnect();
  }, [roomId]);

  return (
    <>
      <h1>Welcome to the {roomId} room!</h1>
      <input value={message} onChange={e => setMessage(e.target.value)} />
    </>
  );
}

export default function App() {
  const [roomId, setRoomId] = useState('general');
  return (
    <>
      <label>
        Choose the chat room:{' '}
        <select
          value={roomId}
          onChange={e => setRoomId(e.target.value)}
        >
          <option value="general">general</option>
          <option value="travel">travel</option>
          <option value="music">music</option>
        </select>
      </label>
      <hr />
      <ChatRoom roomId={roomId} />
    </>
  );
}
```

--------------------------------

### Complete Chat Room Application with Effect Events

Source: https://react.dev/learn/separating-events-from-effects

A complete working example of a React chat room component that uses useEffectEvent to handle connection notifications. The application includes a parent App component managing room selection and theme state, demonstrating how Effect Events prevent unnecessary Effect re-runs when non-reactive props like theme change.

```javascript
import { useState, useEffect } from 'react';
import { useEffectEvent } from 'react';
import { createConnection, sendMessage } from './chat.js';
import { showNotification } from './notifications.js';

const serverUrl = 'https://localhost:1234';

function ChatRoom({ roomId, theme }) {
  const onConnected = useEffectEvent(() => {
    showNotification('Connected!', theme);
  });

  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.on('connected', () => {
      onConnected();
    });
    connection.connect();
    return () => connection.disconnect();
  }, [roomId]);

  return <h1>Welcome to the {roomId} room!</h1>
}

export default function App() {
  const [roomId, setRoomId] = useState('general');
  const [isDark, setIsDark] = useState(false);
  return (
    <>
      <label>
        Choose the chat room:{' '}
        <select
          value={roomId}
          onChange={e => setRoomId(e.target.value)}
        >
          <option value="general">general</option>
          <option value="travel">travel</option>
          <option value="music">music</option>
        </select>
      </label>
      <label>
        <input
          type="checkbox"
          checked={isDark}
          onChange={e => setIsDark(e.target.checked)}
        />
        Use dark theme
      </label>
      <hr />
      <ChatRoom
        roomId={roomId}
        theme={isDark ? 'dark' : 'light'}
      />
    </>
  );
}
```

--------------------------------

### Render Multiple Component Instances with Isolated State in React

Source: https://react.dev/learn/state-a-components-memory

Demonstrates rendering the same Gallery component twice, where each instance maintains completely independent state. This example shows that state is local to the specific location on the screen, not tied to the component definition itself. Changing one Gallery's state does not affect the other Gallery's state.

```javascript
import Gallery from './Gallery.js';

export default function Page() {
  return (
    <div className="Page">
      <Gallery />
      <Gallery />
    </div>
  );
}
```

--------------------------------

### Handle Mouse Events in React

Source: https://react.dev/reference/react-dom/components/common

This example demonstrates various mouse event handlers in React, including `onClick`, `onMouseEnter`, `onMouseOver`, `onMouseDown`, `onMouseUp`, and `onMouseLeave`, applied to a div element. The event object `e` contains comprehensive `MouseEvent` properties (e.g., `clientX`, `clientY`, `altKey`, `button`, `buttons`, `ctrlKey`) and inherited `UIEvent` properties.

```jsx
<div  

  onClick={e => console.log('onClick')}  

  onMouseEnter={e => console.log('onMouseEnter')}  

  onMouseOver={e => console.log('onMouseOver')}  

  onMouseDown={e => console.log('onMouseDown')}  

  onMouseUp={e => console.log('onMouseUp')}  

  onMouseLeave={e => console.log('onMouseLeave')}  

/>
```

--------------------------------

### Passing Event Handlers as `onClick` Props in React

Source: https://react.dev/learn/responding-to-events

This React example illustrates how to pass event handler functions as props from parent components to child components. A generic `Button` component accepts an `onClick` prop, which is then used by specialized components like `PlayButton` and `UploadButton` to define their specific actions. This pattern allows for flexible and reusable UI components where behavior is defined by the parent.

```javascript
function Button({ onClick, children }) {
  return (
    <button onClick={onClick}>
      {children}
    </button>
  );
}

function PlayButton({ movieName }) {
  function handlePlayClick() {
    alert(`Playing ${movieName}!`);
  }

  return (
    <Button onClick={handlePlayClick}>
      Play "{movieName}"
    </Button>
  );
}

function UploadButton() {
  return (
    <Button onClick={() => alert('Uploading!')}>
      Upload Image
    </Button>
  );
}

export default function Toolbar() {
  return (
    <div>
      <PlayButton movieName="Kiki's Delivery Service" />
      <UploadButton />
    </div>
  );
}
```

--------------------------------

### Cache expensive calculations with useMemo Hook

Source: https://react.dev/reference/react/hooks

The useMemo Hook caches the result of expensive calculations to optimize performance and skip unnecessary re-renders. This example shows a TodoList component using useMemo to cache the result of filtering todos, ensuring the expensive filterTodos function only runs when todos or tab changes.

```JavaScript
function TodoList({ todos, tab, theme }) {
  const visibleTodos = useMemo(() => filterTodos(todos, tab), [todos, tab]);
  // ...
}
```

--------------------------------

### React Context Default Value Usage Example

Source: https://react.dev/reference/react/useContext

Demonstrates how a React Context's default value behaves when a component is rendered outside of its provider. The `ThemeContext` is initialized with `'light'`. A button outside the `ThemeContext.Provider` will always use this default value, even if the theme within the provider's scope changes via state.

```javascript
import { createContext, useContext, useState } from 'react';

const ThemeContext = createContext('light');

export default function MyApp() {
  const [theme, setTheme] = useState('light');
  return (
    <>
      <ThemeContext value={theme}>
        <Form />
      </ThemeContext>
      <Button onClick={() => {
        setTheme(theme === 'dark' ? 'light' : 'dark');
      }}>
        Toggle theme
      </Button>
    </>
  )
}

function Form({ children }) {
  return (
    <Panel title="Welcome">
      <Button>Sign up</Button>
      <Button>Log in</Button>
    </Panel>
  );
}

function Panel({ title, children }) {
  const theme = useContext(ThemeContext);
  const className = 'panel-' + theme;
  return (
    <section className={className}>
      <h1>{title}</h1>
      {children}
    </section>
  )
}

function Button({ children, onClick }) {
  const theme = useContext(ThemeContext);
  const className = 'button-' + theme;
  return (
    <button className={className} onClick={onClick}>
      {children}
    </button>
  );
}
```

--------------------------------

### Default Export Syntax for Components

Source: https://react.dev/learn/importing-and-exporting-components

Shows the syntax for exporting a component as a default export using the 'export default' keyword. A file can have only one default export. The imported name can be arbitrary and does not need to match the original component name.

```javascript
export default function Button() {}
```

--------------------------------

### Import and Provide Tasks Context in TaskApp

Source: https://react.dev/learn/scaling-up-with-reducer-and-context

Imports TasksContext and TasksDispatchContext from a separate context file, then wraps the component tree with both context providers. The useReducer hook manages tasks state and provides a dispatch function to handle task mutations throughout the app.

```javascript
import { TasksContext, TasksDispatchContext } from './TasksContext.js';

export default function TaskApp() {
  const [tasks, dispatch] = useReducer(tasksReducer, initialTasks);

  return (
    <TasksContext value={tasks}>
      <TasksDispatchContext value={dispatch}>
        ...
      </TasksDispatchContext>
    </TasksContext>
  );
}
```

--------------------------------

### Synced Inputs with React useState Hook

Source: https://react.dev/learn/sharing-state-between-components

A React component demonstrating uncontrolled inputs that need to be synchronized. Two independent Input components each maintain their own local state. This example shows the challenge of coordinating state between sibling components and the need to lift state to a common parent to achieve synchronization.

```javascript
import { useState } from 'react';

export default function SyncedInputs() {
  return (
    <>
      <Input label="First input" />
      <Input label="Second input" />
    </>
  );
}

function Input({ label }) {
  const [text, setText] = useState('');

  function handleChange(e) {
    setText(e.target.value);
  }

  return (
    <label>
      {label}
      {' '}
      <input
        value={text}
        onChange={handleChange}
      />
    </label>
  );
}
```

--------------------------------

### Render and Hydrate Entire HTML Document with React

Source: https://react.dev/reference/react-dom/client/hydrateRoot

This demonstrates how to structure a React application to render and hydrate the entire HTML document, including the `<html>`, `<head>`, and `<body>` tags. The `document` global is passed as the target to `hydrateRoot` to attach React logic to the full document structure.

```javascript
function App() {  
  return (  
    <html>  
      <head>  
        <meta charSet="utf-8" />  
        <meta name="viewport" content="width=device-width, initial-scale=1" />  
        <link rel="stylesheet" href="/styles.css"></link>  
        <title>My app</title>  
      </head>  
      <body>  
        <Router />  
      </body>  
    </html>  
  );  
}
```

```javascript
import { hydrateRoot } from 'react-dom/client';  
import App from './App.js';  
  
hydrateRoot(document, <App />);
```

--------------------------------

### Migrate propTypes and defaultProps to TypeScript

Source: https://react.dev/blog/2024/04/25/react-19-upgrade-guide

Replace PropTypes validation and defaultProps with TypeScript interfaces and ES6 default parameters in function components. PropTypes were deprecated in v15.5.0 and are now removed in React 19. Class components continue to support defaultProps since ES6 alternatives don't exist for them.

```javascript
// Before
import PropTypes from 'prop-types';

function Heading({text}) {
  return <h1>{text}</h1>;
}

Heading.propTypes = {
  text: PropTypes.string,
};

Heading.defaultProps = {
  text: 'Hello, world!',
};
```

```typescript
// After
interface Props {
  text?: string;
}

function Heading({text = 'Hello, world!'}: Props) {
  return <h1>{text}</h1>;
}
```

--------------------------------

### Anti-Pattern: Combined React useEffect for Cities and Areas

Source: https://react.dev/learn/removing-effect-dependencies

This example illustrates an anti-pattern where a single `useEffect` hook attempts to fetch both cities (based on `country`) and areas (based on `city`). Adding `city` to the dependency array causes the effect to re-run and unnecessarily refetch cities when only the city selection changes, leading to inefficient network requests.

```javascript
function ShippingForm({ country }) {  
  const [cities, setCities] = useState(null);  
  const [city, setCity] = useState(null);  
  const [areas, setAreas] = useState(null);  
  
  useEffect(() => {  
    let ignore = false;  
    fetch(`/api/cities?country=${country}`)  
      .then(response => response.json())  
      .then(json => {  
        if (!ignore) {  
          setCities(json);  
        }  
      });  
    // 🔴 Avoid: A single Effect synchronizes two independent processes  
    if (city) {  
      fetch(`/api/areas?city=${city}`)  
        .then(response => response.json())  
        .then(json => {  
          if (!ignore) {  
            setAreas(json);  
          }  
        });  
    }  
    return () => {  
      ignore = true;  
    };  
  }, [country, city]); // ✅ All dependencies declared  
  
  // ...
}
```

--------------------------------

### Server route handler with renderToString

Source: https://react.dev/reference/react-dom/server/renderToString

Demonstrates using renderToString in a server route handler to render a React app and send the HTML string in the response. The route handler syntax depends on the backend framework being used.

```javascript
import { renderToString } from 'react-dom/server';

app.use('/', (request, response) => {
  const html = renderToString(<App />);
  response.send(html);
});
```

--------------------------------

### Invalid React Hooks usage violating Rules of Hooks

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/rules-of-hooks

Illustrates common violations of React's Rules of Hooks. These examples include calling `useState` conditionally, after an early return, inside a callback, or at the module level. It also shows `use` hook misuse within a `try/catch` block, which is not allowed.

```javascript
// ❌ Hook in condition  
if (isLoggedIn) {  
  const [user, setUser] = useState(null);  
}  
  
// ❌ Hook after early return  
if (!data) return <Loading />;  
const [processed, setProcessed] = useState(data);  
  
// ❌ Hook in callback  
<button onClick={() => {  
  const [clicked, setClicked] = useState(false);  
}}/>  
  
// ❌ `use` in try/catch  
try {  
  const data = use(promise);  
} catch (e) {  
  // error handling  
}  
  
// ❌ Hook at module level  
const globalState = useState(0); // Outside component
```

--------------------------------

### Create HTML element with createElement in React

Source: https://react.dev/reference/react/createElement

Creates a simple HTML element using React's createElement function with type, props, and children. The function accepts a tag name as a string, an object containing element properties, and variable number of child elements. This example creates an h1 heading with nested italic text.

```javascript
import { createElement } from 'react';

function Greeting({ name }) {
  return createElement(
    'h1',
    { className: 'greeting' },
    'Hello ',
    createElement('i', null, name),
    '. Welcome!'
  );
}
```

--------------------------------

### Conditionally Render Richer JSX with `if` Statement and Variable in React

Source: https://react.dev/learn/conditional-rendering

This example extends the conditional rendering technique to include more complex JSX elements, such as a `<del>` tag. It shows how to assign an entire JSX expression to a variable (`itemContent`) based on a condition, allowing for flexible and rich conditional UI updates within a React component.

```javascript
function Item({ name, isPacked }) {
  let itemContent = name;
  if (isPacked) {
    itemContent = (
      <del>
        {name + " ✅"}
      </del>
    );
  }
  return (
    <li className="item">
      {itemContent}
    </li>
  );
}

export default function PackingList() {
  return (
    <section>
      <h1>Sally Ride's Packing List</h1>
      <ul>
        <Item 
          isPacked={true} 
          name="Space suit" 
        />
        <Item 
          isPacked={true} 
          name="Helmet with a golden leaf" 
        />
        <Item 
          isPacked={false} 
          name="Photo of Tam" 
        />
      </ul>
    </section>
  );
}
```

--------------------------------

### State Preservation with Activity Wrapper

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Demonstrates how to wrap a component in <Activity /> to preserve its state when navigating away. By toggling the mode based on URL, the component maintains its state in the background, allowing users to resume where they left off upon returning.

```jsx
function App() {
  const { url } = useRouter();

  return (
    <>
      <Activity mode={url === '/' ? 'visible' : 'hidden'}>
        <Home />
      </Activity>
      {url !== '/' && <Details />}
    </>
  );
}
```

--------------------------------

### Suppress dependency linter anti-pattern in React useEffect

Source: https://react.dev/learn/separating-events-from-effects

Example showing the discouraged practice of suppressing the react-hooks/exhaustive-deps linter rule. This approach prevents React from warning about missing dependencies, leading to stale closures and bugs. The code demonstrates a Page component with useEffect that logs visits but fails to include the numberOfItems dependency.

```javascript
function Page({ url }) {
  const { items } = useContext(ShoppingCartContext);
  const numberOfItems = items.length;

  useEffect(() => {
    logVisit(url, numberOfItems);
    // 🔴 Avoid suppressing the linter like this:
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [url]);
  // ...
}
```

--------------------------------

### Using `useId` for Accessibility Attributes in a React Component

Source: https://react.dev/reference/react/useId

This comprehensive example demonstrates how to integrate `useId` into a React component to generate unique IDs for accessibility attributes like `aria-describedby` and `id`. It ensures that even if the `PasswordField` component is rendered multiple times, each instance will have unique, non-clashing IDs, which is crucial for proper accessibility and assistive technologies.

```javascript
import { useId } from 'react';

function PasswordField() {
  const passwordHintId = useId();
  return (
    <>
      <label>
        Password:
        <input
          type="password"
          aria-describedby={passwordHintId}
        />
      </label>
      <p id={passwordHintId}>
        The password should contain at least 18 characters
      </p>
    </>
  );
}
```

--------------------------------

### React State Updater Function Naming Conventions

Source: https://react.dev/learn/queueing-a-series-of-state-updates

This snippet provides common naming conventions for the argument of React state updater functions. It shows examples where the argument is named after the state variable's first letter, or the full variable name, or with a 'prev' prefix, to improve readability and clarity in React components.

```javascript
setEnabled(e => !e);  
setLastName(ln => ln.reverse());  
setFriendCount(fc => fc * 2);
```

--------------------------------

### Using useOnlineStatus Custom Hook in Multiple Components

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

Demonstrates how two components (StatusBar and SaveButton) can use the same custom hook (useOnlineStatus) while maintaining completely independent state variables. Each component gets its own instance of the hook with separate state, even though they may have the same value at the same time due to synchronization with an external source.

```javascript
function StatusBar() {
  const isOnline = useOnlineStatus();
  // ...
}

function SaveButton() {
  const isOnline = useOnlineStatus();
  // ...
}
```

--------------------------------

### Configure Server-Side Streaming with React renderToPipeableStream and Error Callbacks

Source: https://react.dev/reference/react-dom/server/renderToPipeableStream

This example shows the basic usage of `renderToPipeableStream` for server-side rendering of a React application. It defines callbacks like `onShellReady` to set an HTTP 200 status code and `onShellError` to set a 500 status code if the shell fails. The `onError` callback logs any rendering errors without necessarily stopping the stream if they occur outside the shell.

```javascript
const { pipe } = renderToPipeableStream(<App />, {  
  bootstrapScripts: ['/main.js'],  
  onShellReady() {  
    response.statusCode = 200;  
    response.setHeader('content-type', 'text/html');  
    pipe(response);  
  },  
  onShellError(error) {  
    response.statusCode = 500;  
    response.setHeader('content-type', 'text/html');  
    response.send('<h1>Something went wrong</h1>');   
  },  
  onError(error) {  
    console.error(error);  
    logServerCrashReport(error);  
  }  
});
```

--------------------------------

### Demonstrating `useEffect` Re-render Issues with External Event Handlers

Source: https://react.dev/blog/2025/10/01/react-19-2

This example illustrates a common problem in React's `useEffect` where external event handlers that capture component props (like `theme`) cause the effect to re-run unnecessarily when those props change. This can lead to inefficient or incorrect behavior, such as re-establishing connections, and often prompts developers to incorrectly disable linting rules.

```jsx
function ChatRoom({ roomId, theme }) {  
  useEffect(() => {  
    const connection = createConnection(serverUrl, roomId);  
    connection.on('connected', () => {  
      showNotification('Connected!', theme);  
    });  
    connection.connect();  
    return () => {  
      connection.disconnect()  
    };
  }, [roomId, theme]);  
  // ...
}
```

--------------------------------

### Implement `useFadeIn` Hook with External Animation Class in React

Source: https://react.dev/learn/reusing-logic-with-custom-hooks

This `useFadeIn` custom hook demonstrates abstracting animation logic into an external JavaScript class, `FadeInAnimation`. The hook's `useEffect` initializes and controls an instance of this class, starting the animation and ensuring proper cleanup. This approach separates animation implementation details from React component logic.

```javascript
import { useState, useEffect } from 'react';
import { FadeInAnimation } from './animation.js';

export function useFadeIn(ref, duration) {
  useEffect(() => {
    const animation = new FadeInAnimation(ref.current);
    animation.start(duration);
    return () => {
      animation.stop();
    };
  }, [ref, duration]);
}
```

--------------------------------

### Serialize Asset Map to Client via Bootstrap Script Content

Source: https://react.dev/reference/react-dom/server/renderToPipeableStream

Passes the assetMap to the client by injecting it as a global window variable through bootstrapScriptContent. This inline script executes before the main application bundle, making the asset map available for the client-side hydration without requiring additional API calls or data fetching.

```JavaScript
const assetMap = {
  'styles.css': '/styles.123456.css',
  'main.js': '/main.123456.js'
};

app.use('/', (request, response) => {
  const { pipe } = renderToPipeableStream(<App assetMap={assetMap} />, {
    bootstrapScriptContent: `window.assetMap = ${JSON.stringify(assetMap)};`,
    bootstrapScripts: [assetMap['main.js']],
    onShellReady() {
      response.setHeader('content-type', 'text/html');
      pipe(response);
    }
  });
});
```

--------------------------------

### Read destructured props in React functional component

Source: https://react.dev/learn/passing-props-to-a-component

This example shows the signature of a React functional component, `Avatar`, that receives and immediately destructures `person` and `size` from its `props` object. This pattern makes `person` and `size` directly available as local variables within the component's scope for rendering or logic.

```jsx
function Avatar({ person, size }) {  
  // person and size are available here  
}
```

--------------------------------

### Update Array State with map() in React

Source: https://react.dev/learn/adding-interactivity

Demonstrates how to immutably update an array in React state by using map() to create a new array with modified elements. This example shows toggling the 'seen' property of artwork objects in a bucket list. The component uses useState hook and passes the update handler to child components.

```javascript
import { useState } from 'react';

const initialList = [
  { id: 0, title: 'Big Bellies', seen: false },
  { id: 1, title: 'Lunar Landscape', seen: false },
  { id: 2, title: 'Terracotta Army', seen: true },
];

export default function BucketList() {
  const [list, setList] = useState(
    initialList
  );

  function handleToggle(artworkId, nextSeen) {
    setList(list.map(artwork => {
      if (artwork.id === artworkId) {
        return { ...artwork, seen: nextSeen };
      } else {
        return artwork;
      }
    }));
  }

  return (
    <>
      <h1>Art Bucket List</h1>
      <h2>My list of art to see:</h2>
      <ItemList
        artworks={list}
        onToggle={handleToggle} />
    </>
  );
}

function ItemList({ artworks, onToggle }) {
  return (
    <ul>
      {artworks.map(artwork => (
        <li key={artwork.id}>
          <label>
            <input
              type="checkbox"
              checked={artwork.seen}
              onChange={e => {
                onToggle(
                  artwork.id,
                  e.target.checked
                );
              }}
            />
            {artwork.title}
          </label>
        </li>
      ))}
    </ul>
  );
}
```

--------------------------------

### React: Memoizing `List` component props with `useMemo` for re-render optimization

Source: https://react.dev/reference/react/useMemo

This example demonstrates using `useMemo` to memoize the `visibleTodos` array passed to a `List` component. When combined with `React.memo` on the `List` component, it prevents the list from re-rendering when parent component props (like `theme`) change, as long as the `useMemo` dependencies (`todos`, `tab`) remain the same.

```javascript
import { useMemo } from 'react';
import List from './List.js';
import { filterTodos } from './utils.js';

export default function TodoList({ todos, theme, tab }) {
  const visibleTodos = useMemo(
    () => filterTodos(todos, tab),
    [todos, tab]
  );
  return (
    <div className={theme}>
      <p><b>Note: <code>List</code> is artificially slowed down!</b></p>
      <List items={visibleTodos} />
    </div>
  );
}
```

--------------------------------

### Simulate React State Management with Reducer and Array.prototype.reduce

Source: https://react.dev/learn/extracting-state-logic-into-a-reducer

This JavaScript code demonstrates how a reducer function, like `tasksReducer`, can be used in conjunction with `Array.prototype.reduce` to process an array of actions and compute a final state. This example closely mimics the internal process React uses for state updates, illustrating the 'accumulation' of actions into state.

```javascript
import tasksReducer from './tasksReducer.js';

let initialState = [];
let actions = [
  {type: 'added', id: 1, text: 'Visit Kafka Museum'},
  {type: 'added', id: 2, text: 'Watch a puppet show'},
  {type: 'deleted', id: 1},
  {type: 'added', id: 3, text: 'Lennon Wall pic'},
];

let finalState = actions.reduce(tasksReducer, initialState);

const output = document.getElementById('output');
output.textContent = JSON.stringify(finalState, null, 2);
```

--------------------------------

### Avoid Passing React Hooks as Props

Source: https://react.dev/reference/rules/react-calls-components-and-hooks

This example demonstrates that Hooks should not be passed dynamically as props to child components. Hooks must be called directly within the component where their functionality is required. This approach improves readability, simplifies debugging, and prevents violations of the Rules of Hooks, thereby maintaining local reasoning within components.

```javascript
function ChatInput() {  
  return <Button useData={useDataWithLogging} /> // 🔴 Bad: don't pass Hooks as props  
}
```

```javascript
function ChatInput() {  
  return <Button />  
}  
  
function Button() {  
  const data = useDataWithLogging(); // ✅ Good: Use the Hook directly  
}  
  
function useDataWithLogging() {  
  // If there's any conditional logic to change the Hook's behavior, it should be inlined into  
  // the Hook  
}
```

--------------------------------

### Good: React application initialization with a `didInit` flag

Source: https://react.dev/learn/you-might-not-need-an-effect

This improved pattern addresses the issue of `useEffect` running twice by introducing a module-level `didInit` flag. The flag ensures that initialization logic, such as `loadDataFromLocalStorage()` and `checkAuthToken()`, executes only once per application load, even when the `useEffect` hook might be called multiple times due to React's development mode behaviors. This makes the `App` component more robust.

```javascript
let didInit = false;  
  
function App() {  
  useEffect(() => {  
    if (!didInit) {  
      didInit = true;  
      // ✅ Only runs once per app load  
      loadDataFromLocalStorage();  
      checkAuthToken();  
    }  
  }, []);  
  // ...  
}
```

--------------------------------

### Log a React synthetic event object in a JSX handler

Source: https://react.dev/reference/react-dom/components/common

React event handlers receive a synthetic event object, which normalizes browser inconsistencies and provides a consistent API. This example demonstrates logging the event object `e` received by an `onClick` handler. The original browser event can be accessed via `e.nativeEvent`.

```javascript
<button onClick={e => {
  console.log(e); // React event object
}} />
```

--------------------------------

### Correct `cache` Usage with Consistent Object References in React

Source: https://react.dev/reference/react/cache

This example provides an alternative correct method for using `cache` with objects: by ensuring the same object reference is passed to the component, and subsequently to the cached function. By defining `vector` once and passing it as a prop to both `MapMarker` instances, `calculateNorm` receives the identical object reference, allowing `cache` to correctly identify subsequent calls as cache hits.

```javascript
import {cache} from 'react';

const calculateNorm = cache((vector) => {
  // ...
});

function MapMarker(props) {
  // ✅ Good: Pass the same `vector` object
  const length = calculateNorm(props.vector);
  // ...
}

function App() {
  const vector = [10, 10, 10];
  return (
    <>
      <MapMarker vector={vector} />
      <MapMarker vector={vector} />
    </>
  );
}
```

--------------------------------

### `use(resource)` Function

Source: https://react.dev/reference/react/use

The `use` API allows components to synchronously read the value of a resource like a Promise or Context, integrating with Suspense and Error Boundaries. Unlike Hooks, it can be called inside conditionals and loops.

```APIDOC
## FUNCTION: use(resource)

### Description
Call `use` in your component to read the value of a resource like a Promise or context.

### Method
Function Call

### Endpoint
`use(resource)`

### Parameters
#### Function Arguments
- **resource** (Promise | Context) - Required - The source of the data you want to read a value from. A resource can be a Promise or a context.

### Request Example
```javascript
import { use } from 'react';
import { ThemeContext } from './ThemeContext';

function MessageComponent({ messagePromise }) {
  // Reading a Promise
  const message = use(messagePromise);
  // Reading Context
  const theme = use(ThemeContext);
  // ...
}

function ConditionalUse({ show }) {
  if (show) {
    const theme = use(ThemeContext); // Can be called conditionally
    return <hr className={theme} />;
  }
  return null;
}
```

### Response
#### Return Value
- **value** (any) - The value that was read from the resource, such as the resolved value of a Promise or the current context value.

#### Return Value Example
When `use(messagePromise)` resolves a promise:
```javascript
"Hello, from the server!"
```
When `use(ThemeContext)` reads context value:
```javascript
"dark"
```

### Caveats
- The `use` API must be called inside a Component or a Hook.
- When fetching data in a Server Component, prefer `async` and `await` over `use`.
- Prefer creating Promises in Server Components and passing them to Client Components over creating Promises in Client Components. Promises created in Client Components are recreated on every render. Promises passed from a Server Component to a Client Component are stable across re-renders.
```

--------------------------------

### Identifying Infinite Loops with Function Dependencies in React Hooks

Source: https://react.dev/reference/eslint-plugin-react-hooks/lints/exhaustive-deps

This example demonstrates a common pitfall where a function defined within a component is used as a dependency in a `useEffect` hook. Because the function reference changes on every render, it causes the effect to re-run infinitely. This highlights the importance of managing function stability in dependency arrays.

```javascript
// ❌ Causes infinite loop  
const logItems = () => {  
  console.log(items);  
};  
  
useEffect(() => {  
  logItems();  
}, [logItems]); // Infinite loop!
```

--------------------------------

### Imperative Animation Control with React ViewTransition Events and Types

Source: https://react.dev/reference/react/addTransitionType

This example demonstrates how to use the `onUpdate` event handler of a `<ViewTransition>` component to imperatively apply different animations. The `types` array, containing all collected `addTransitionType` values, allows for conditional logic to trigger specific imperative animations based on the transition's cause.

```javascript
<ViewTransition onUpdate={(inst, types) => {  
  if (types.includes('navigation-back')) {  
    ...  
  } else if (types.includes('navigation-forward')) {  
    ...  
  } else {  
    ...  
  }  
}}>
```

--------------------------------

### React Effect with Empty Dependency Array for Mount

Source: https://react.dev/learn/synchronizing-with-effects

Demonstrates Effect with empty dependency array that runs only once after component mounts. Useful for initialization logic that should execute a single time, equivalent to componentDidMount in class components.

```javascript
useEffect(() => {
  // Runs once on mount
  const connection = createConnection();
  connection.connect();
  return () => connection.disconnect();
}, [])
```

--------------------------------

### Implement React Reducer with Switch Statement for Task State Management

Source: https://react.dev/learn/extracting-state-logic-into-a-reducer

This example refactors the `tasksReducer` to use a `switch` statement for handling action types, a common and recommended convention for readability in reducers. Each `case` block is wrapped in curly braces to prevent variable scope clashes and ensures a `return` statement to avoid fall-through errors.

```javascript
function tasksReducer(tasks, action) {  
  switch (action.type) {  
    case 'added': {  
      return [  
        ...tasks,  
        {  
          id: action.id,  
          text: action.text,  
          done: false,  
        },  
      ];  
    }  
    case 'changed': {  
      return tasks.map((t) => {  
        if (t.id === action.task.id) {  
          return action.task;  
        } else {  
          return t;  
        }  
      });  
    }  
    case 'deleted': {  
      return tasks.filter((t) => t.id !== action.id);  
    }  
    default: {  
      throw Error('Unknown action: ' + action.type);  
    }  
  }  
}
```

--------------------------------

### Incorrect React `cache` Usage for Memoization

Source: https://react.dev/reference/react/cache

This example illustrates common anti-patterns when using React's `cache` API. Calling `cache` directly inside a component or defining a memoized function in a component's local scope prevents cache sharing and can lead to duplicated work on each render, diminishing the benefits of memoization.

```jsx
// Temperature.js  

import {cache} from 'react';  

import {calculateWeekReport} from './report';  

  

export function Temperature({cityData}) {  
  // 🚩 Wrong: Calling `cache` in component creates new `getWeekReport` for each render  
  const getWeekReport = cache(calculateWeekReport);  
  const report = getWeekReport(cityData);  
  // ...  
}
```

```jsx
// Precipitation.js  

import {cache} from 'react';  
import {calculateWeekReport} from './report';  

  

// 🚩 Wrong: `getWeekReport` is only accessible for `Precipitation` component.  
const getWeekReport = cache(calculateWeekReport);  

  

export function Precipitation({cityData}) {  
  const report = getWeekReport(cityData);  
  // ...  
}
```

--------------------------------

### Implement React Game Component History Display

Source: https://react.dev/learn/tutorial-tic-tac-toe

This React `Game` component demonstrates how to display a list of past moves from the `history` state. It uses the `map` method to transform the

--------------------------------

### React Component Structure Demonstrating Context Propagation

Source: https://react.dev/learn/passing-data-deeply-with-context

This JavaScript code showcases a React application's component hierarchy where context implicitly propagates through various levels of nesting. It defines a `ProfilePage` that renders `Post` and `AllPosts` components, which in turn use `Section` and `Heading` components. The example illustrates how `Heading` components automatically receive their level from the closest `Section` without explicit prop passing, highlighting context's ability to flow through intermediate components.

```javascript
import Heading from './Heading.js';
import Section from './Section.js';

export default function ProfilePage() {
  return (
    <Section>
      <Heading>My Profile</Heading>
      <Post
        title="Hello traveller!"
        body="Read about my adventures."
      />
      <AllPosts />
    </Section>
  );
}

function AllPosts() {
  return (
    <Section>
      <Heading>Posts</Heading>
      <RecentPosts />
    </Section>
  );
}

function RecentPosts() {
  return (
    <Section>
      <Heading>Recent Posts</Heading>
      <Post
        title="Flavors of Lisbon"
        body="...those pastéis de nata!"
      />
      <Post
        title="Buenos Aires in the rhythm of tango"
        body="I loved it!"
      />
    </Section>
  );
}

function Post({ title, body }) {
  return (
    <Section isFancy={true}>
      <Heading>
        {title}
      </Heading>
      <p><i>{body}</i></p>
    </Section>
  );
}
```

--------------------------------

### React Component Mirroring Prop in State (Anti-Pattern)

Source: https://react.dev/learn/choosing-the-state-structure

This example illustrates a common anti-pattern in React where a component initializes an internal state variable (`color`) using a prop (`messageColor`). The critical issue is that the state variable will not update if the `messageColor` prop changes in subsequent renders, leading to a desynchronized UI. This can cause bugs and unexpected behavior in components.

```javascript
function Message({ messageColor }) {  

  const [color, setColor] = useState(messageColor);

```

--------------------------------

### Await Full Stream Content for Crawlers with `allReady` in JavaScript

Source: https://react.dev/reference/react-dom/server/renderToReadableStream

This code illustrates how to ensure all content loads completely before sending the HTML response, primarily for web crawlers or static site generation. By conditionally awaiting `stream.allReady`, it ensures a full HTML output for bots while regular users still receive a progressively loaded stream.

```javascript
async function handler(request) {
  try {
    let didError = false;
    const stream = await renderToReadableStream(<App />, {
      bootstrapScripts: ['/main.js'],
      onError(error) {
        didError = true;
        console.error(error);
        logServerCrashReport(error);
      }
    });
    let isCrawler = // ... depends on your bot detection strategy ...
    if (isCrawler) {
      await stream.allReady;
    }
    return new Response(stream, {
      status: didError ? 500 : 200,
      headers: { 'content-type': 'text/html' }
    });
  } catch (error) {
    return new Response('<h1>Something went wrong</h1>', {
      status: 500,
      headers: { 'content-type': 'text/html' }
    });
  }
}
```

--------------------------------

### Correct State Update Using Immutability for Objects in React

Source: https://react.dev/reference/react/useState

This JavaScript example demonstrates the correct, immutable way to update an object in React state. By creating a *new* object using the spread syntax (`...obj`) and then defining or overriding properties, React detects a new object reference, which correctly triggers a re-render and updates the UI.

```javascript
// ✅ Correct: creating a new object  
setObj({  
  ...obj,  
  x: 10  
});
```

--------------------------------

### Prevent Dynamic Mutation of React Hooks

Source: https://react.dev/reference/rules/react-calls-components-and-hooks

This example illustrates that Hooks should not be dynamically mutated or wrapped by higher-order functions. Hooks must remain static and immutable to ensure predictable behavior, uphold local reasoning, and comply with the Rules of Hooks. Instead of dynamic mutation, create a new, static Hook with the desired functionality.

```javascript
function ChatInput() {  
  const useDataWithLogging = withLogging(useData); // 🔴 Bad: don't write higher order Hooks  
  const data = useDataWithLogging();  
}
```

```javascript
function ChatInput() {  
  const data = useDataWithLogging(); // ✅ Good: Create a new version of the Hook  
}  
  
function useDataWithLogging() {  
  // ... Create a new version of the Hook and inline the logic here  
}
```

--------------------------------

### Basic Activity Component Usage with Visibility Toggle

Source: https://react.dev/blog/2025/04/23/react-labs-view-transitions-activity-and-more

Demonstrates the fundamental usage of the <Activity /> component with a mode prop that accepts 'visible' or 'hidden' states. When visible, the component renders normally; when hidden, it unmounts but preserves state for later restoration.

```jsx
<Activity mode={isVisible ? 'visible' : 'hidden'}>
  <Page />
</Activity>
```

--------------------------------

### Define Basic React Component with JSX

Source: https://react.dev/learn/your-first-component

Creates a simple React component function named Profile that returns JSX markup with an image element. This demonstrates Step 1-3 of component creation: exporting the function with proper capitalization, defining it as a JavaScript function, and returning markup with JSX syntax.

```jsx
export default function Profile() {
  return (
    <img
      src="https://i.imgur.com/MK3eW3Am.jpg"
      alt="Katherine Johnson"
    />
  )
}
```

--------------------------------

### Declare state variable with useState Hook

Source: https://react.dev/reference/react/hooks

The useState Hook allows a component to declare a state variable that can be updated directly. This example shows an ImageGallery component using useState to track the current image index. The Hook returns the current state value and a function to update it.

```JavaScript
function ImageGallery() {
  const [index, setIndex] = useState(0);
  // ...
}
```

--------------------------------

### Prevent user password exposure with global lifetime in React Server Components

Source: https://react.dev/reference/react/experimental_taintUniqueValue

This example illustrates using `experimental_taintUniqueValue` to protect a user password by preventing it from reaching Client Components. By setting `globalThis` as the `lifetime` argument, the password remains tainted for the entire execution lifespan of the application, enhancing security for highly sensitive data like passwords.

```javascript
import {experimental_taintUniqueValue} from 'react';

experimental_taintUniqueValue(
  'Do not pass a user password to the client.',
  globalThis,
  process.env.SECRET_KEY
);
```

--------------------------------

### Read Form Data with useFormStatus in React

Source: https://react.dev/reference/react-dom/hooks/useFormStatus

Demonstrates how to use the useFormStatus hook to access and display form submission data. The hook returns both pending state and data properties from a parent form element. This example shows a username request form that displays confirmation of the submitted username while the form is being processed.

```javascript
import {useState, useMemo, useRef} from 'react';
import {useFormStatus} from 'react-dom';

export default function UsernameForm() {
  const {pending, data} = useFormStatus();

  return (
    <div>
      <h3>Request a Username: </h3>
      <input type="text" name="username" disabled={pending}/>
      <button type="submit" disabled={pending}>
        Submit
      </button>
      <br />
      <p>{data ? `Requesting ${data?.get("username")}...`: ''}</p>
    </div>
  );
}
```

--------------------------------

### Avoid Redundant State and Effects for Filtering in React

Source: https://react.dev/learn/you-might-not-need-an-effect

This example demonstrates an inefficient pattern where a React component uses `useState` and `useEffect` to store and update filtered data. This approach is discouraged as it introduces redundant state and unnecessary re-renders, especially if the filtering logic (`getFilteredTodos`) is not computationally expensive, leading to performance issues.

```javascript
function TodoList({ todos, filter }) {  
  const [newTodo, setNewTodo] = useState('');  
  
  // 🔴 Avoid: redundant state and unnecessary Effect  
  const [visibleTodos, setVisibleTodos] = useState([]);  
  useEffect(() => {  
    setVisibleTodos(getFilteredTodos(todos, filter));  
  }, [todos, filter]);  
  
  // ...  
}
```

--------------------------------

### Updating React State from useEffect using Functional Updaters

Source: https://react.dev/reference/react/useEffect

This example demonstrates how to correctly update state based on its previous value within a React `useEffect` hook. It highlights the issue of an effect unnecessarily re-running when a state variable used in the effect is also a dependency, and provides a solution using a functional state updater to resolve this.

```javascript
function Counter() {  

  const [count, setCount] = useState(0);  

  

  useEffect(() => {  

    const intervalId = setInterval(() => {  

      setCount(count + 1); // You want to increment the counter every second...  

    }, 1000)  

    return () => clearInterval(intervalId);  

  }, [count]); // 🚩 ... but specifying `count` as a dependency always resets the interval.  

  // ...  

}
```

```javascript
import { useState, useEffect } from 'react';

export default function Counter() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    const intervalId = setInterval(() => {
      setCount(c => c + 1); // ✅ Pass a state updater
    }, 1000);
    return () => clearInterval(intervalId);
  }, []); // ✅ Now count is not a dependency

  return <h1>{count}</h1>;
}
```

--------------------------------

### Import and initialize multiple refs with createRef in React class

Source: https://react.dev/reference/react/createRef

Illustrates how to import `createRef` and `Component` from 'react' and initialize multiple ref objects (`intervalRef`, `inputRef`) as class fields within a React class component. This sets up references for various elements or component instances.

```javascript
import { createRef, Component } from 'react';  
  
class MyComponent extends Component {  
  intervalRef = createRef();  
  inputRef = createRef();  
  // ...
```

--------------------------------

### Implement Multiple Independent State Variables in a React Component

Source: https://react.dev/learn/state-a-components-memory

This example showcases a React functional component named `Gallery` that utilizes multiple `useState` hooks to manage different pieces of state independently, specifically `index` for navigation and `showMore` for toggling display. It demonstrates importing `useState`, declaring state variables, defining event handler functions to update state, and rendering conditional UI based on state values.

```javascript
import { useState } from 'react';
import { sculptureList } from './data.js';

export default function Gallery() {
  const [index, setIndex] = useState(0);
  const [showMore, setShowMore] = useState(false);

  function handleNextClick() {
    setIndex(index + 1);
  }

  function handleMoreClick() {
    setShowMore(!showMore);
  }

  let sculpture = sculptureList[index];
  return (
    <>
      <button onClick={handleNextClick}>
        Next
      </button>
      <h2>
        <i>{sculpture.name} </i> 
        by {sculpture.artist}
      </h2>
      <h3>  
        ({index + 1} of {sculptureList.length})
      </h3>
      <button onClick={handleMoreClick}>
        {showMore ? 'Hide' : 'Show'} details
      </button>
      {showMore && <p>{sculpture.description}</p>}
      <img 
        src={sculpture.url} 
        alt={sculpture.alt}
      />
    </>
  );
}
```

--------------------------------

### Mark entire module as Server Functions with file-level 'use server'

Source: https://react.dev/reference/rsc/use-server

Shows how to add 'use server' at the top of a file to mark all exports as Server Functions. This approach allows all exported functions in the module to be callable from client code without individual directive annotations.

```javascript
'use server';

export async function addToCart(data) {
  // Implementation
}

export async function removeFromCart(id) {
  // Implementation
}
```

--------------------------------

### Managing useEffect Dependencies for Side Effects in React

Source: https://react.dev/reference/react/useEffect

This example illustrates how the dependency array in a React `useEffect` hook controls when the effect re-runs. It shows a chat application where a connection is established and disconnected, re-running the effect only when `serverUrl` or `roomId` change, preventing unnecessary re-connections from other state updates like `message`. The `createConnection` function is an external dependency.

```javascript
useEffect(() => {  
  // ...  
}, [a, b]); // Runs again if a or b are different
```

```javascript
import { useState, useEffect } from 'react';
import { createConnection } from './chat.js';

function ChatRoom({ roomId }) {
  const [serverUrl, setServerUrl] = useState('https://localhost:1234');
  const [message, setMessage] = useState('');

  useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => {
      connection.disconnect();
    };
  }, [serverUrl, roomId]);

  return (
    <>
      <label>
        Server URL:{' '}
        <input
          value={serverUrl}
          onChange={e => setServerUrl(e.target.value)}
        />
      </label>
      <h1>Welcome to the {roomId} room!</h1>
      <label>
        Your message:{' '}
        <input value={message} onChange={e => setMessage(e.target.value)} />
      </label>
    </>
  );
}

export default function App() {
  const [show, setShow] = useState(false);
  const [roomId, setRoomId] = useState('general');
  return (
    <>
      <label>
        Choose the chat room:{' '}
        <select
          value={roomId}
          onChange={e => setRoomId(e.target.value)}
        >
          <option value="general">general</option>
          <option value="travel">travel</option>
          <option value="music">music</option>
        </select>
        <button onClick={() => setShow(!show)}>
          {show ? 'Close chat' : 'Open chat'}
        </button>
      </label>
      {show && <hr />}
      {show && <ChatRoom roomId={roomId}/>}
    </>
  );
}
```

--------------------------------

### Register Multiple Custom Error Handlers for React Hydration

Source: https://react.dev/reference/react-dom/client/hydrateRoot

This example demonstrates how to configure `hydrateRoot` with multiple custom error handlers: `onCaughtError`, `onRecoverableError`, and `onUncaughtError`. These options enable a comprehensive custom error reporting system for production, though it's advised to conditionally apply them to leverage React's default development handlers.

```jsx
import { hydrateRoot } from "react-dom/client";
import App from "./App.js";
import {
  onCaughtErrorProd,
  onRecoverableErrorProd,
  onUncaughtErrorProd,
} from "./reportError";

const container = document.getElementById("root");
hydrateRoot(container, <App />, {
  // Keep in mind to remove these options in development to leverage
  // React's default handlers or implement your own overlay for development.
  // The handlers are only specfied unconditionally here for demonstration purposes.
  onCaughtError: onCaughtErrorProd,
  onRecoverableError: onRecoverableErrorProd,
  onUncaughtError: onUncaughtErrorProd,
});
```

--------------------------------

### useEffect Dependency Array Variations in React

Source: https://react.dev/learn/synchronizing-with-effects

Demonstrates three common useEffect patterns: running after every render (no dependency array), running only on component mount (empty dependency array), and running on mount and when specific dependencies change. React uses Object.is comparison to determine if dependencies have changed between renders.

```javascript
useEffect(() => {
  // This runs after every render
});

useEffect(() => {
  // This runs only on mount (when the component appears)
}, []);

useEffect(() => {
  // This runs on mount *and also* if either a or b have changed since the last render
}, [a, b]);
```

--------------------------------

### Handle Form Submission and Read Data in React

Source: https://react.dev/reference/react-dom/components/input

This React component demonstrates how to handle form submissions. It prevents the default browser page reload, reads form data using the `FormData` API, and illustrates how to either send it directly via a fetch request or convert it into a plain JavaScript object for further processing. The form includes examples of text input, checkboxes, and radio buttons.

```jsx
export default function MyForm() {
  function handleSubmit(e) {
    // Prevent the browser from reloading the page
    e.preventDefault();

    // Read the form data
    const form = e.target;
    const formData = new FormData(form);

    // You can pass formData as a fetch body directly:
    fetch('/some-api', { method: form.method, body: formData });

    // Or you can work with it as a plain object:
    const formJson = Object.fromEntries(formData.entries());
    console.log(formJson);
  }

  return (
    <form method="post" onSubmit={handleSubmit}>
      <label>
        Text input: <input name="myInput" defaultValue="Some initial value" />
      </label>
      <hr />
      <label>
        Checkbox: <input type="checkbox" name="myCheckbox" defaultChecked={true} />
      </label>
      <hr />
      <p>
        Radio buttons:
        <label><input type="radio" name="myRadio" value="option1" /> Option 1</label>
        <label><input type="radio" name="myRadio" value="option2" defaultChecked={true} /> Option 2</label>
        <label><input type="radio" name="myRadio" value="option3" /> Option 3</label>
      </p>
      <hr />
      <button type="reset">Reset form</button>
      <button type="submit">Submit form</button>
    </form>
  );
}
```

--------------------------------

### Set Default Props with static defaultProps in React

Source: https://react.dev/reference/react/Component

Defines static defaultProps to set default values for class component props. Default values apply to undefined and missing props, but not null props. This example shows setting a color prop default to 'blue' and demonstrates how different prop values are handled.

```javascript
class Button extends Component {
  static defaultProps = {
    color: 'blue'
  };

  render() {
    return <button className={this.props.color}>click me</button>;
  }
}

<>
  {/* this.props.color is "blue" */}
  <Button />

  {/* this.props.color is "blue" */}
  <Button color={undefined} />

  {/* this.props.color is null */}
  <Button color={null} />

  {/* this.props.color is "red" */}
  <Button color="red" />
</>
```

--------------------------------

### React useLayoutEffect for Measuring DOM Layout

Source: https://react.dev/reference/react/useLayoutEffect

This example demonstrates how to use `useLayoutEffect` in a React functional component to measure the height of a DOM element (`ref.current`) after React has performed its DOM mutations but before the browser has a chance to visually update the screen. This is critical for scenarios where layout measurements affect subsequent rendering, such as positioning a tooltip based on its content's dimensions.

```javascript
import { useState, useRef, useLayoutEffect } from 'react';

function Tooltip() {
  const ref = useRef(null);
  const [tooltipHeight, setTooltipHeight] = useState(0);

  useLayoutEffect(() => {
    const { height } = ref.current.getBoundingClientRect();
    setTooltipHeight(height);
  }, []);
  // ...
}
```