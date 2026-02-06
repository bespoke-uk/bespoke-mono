# INTERFACES AND CONTRACTS REGISTRY

This document catalogues all interfaces and contracts across the Bespoke CMS monorepo. Use this as a reference when renaming, moving, or refactoring interfaces to ensure all cross-package references are updated.

**Last Updated:** 2026-02-05

---

## Table of Contents

1. [Migration Status](#1-migration-status)
2. [Trait Interfaces](#2-trait-interfaces)
3. [Model Contracts](#3-model-contracts)
4. [Controller Contracts](#4-controller-contracts)
5. [Request Contracts](#5-request-contracts)
6. [Resource Contracts](#6-resource-contracts)
7. [Action Contracts](#7-action-contracts)
8. [Other Contracts](#8-other-contracts)
9. [Search Commands](#9-search-commands)

---

## 1. Migration Status

### ✅ Core Packages Migrated (2026-02-05)

All core packages have been migrated from `src/Interfaces/` to `src/Contracts/`. The following migrations were completed:

| Package | Interfaces Migrated | New Namespace |
|---------|---------------------|---------------|
| `core/module` | 14 interfaces (ArrayInterface, CalculatorInterface, CategoryInterface, DefaultInterface, EntitiesInterface, FeeInterface, FileInterface, RecursiveInterface, StateInterface, StockInterface, ThemeInterface, ToggleInterface, TypeInterface, InterfacesServiceProvider) | `Bespoke\Module\Contracts\*` |
| `core/document` | DocumentsInterface | `Bespoke\Document\Contracts\DocumentsInterface` |
| `core/image` | ImagesInterface | `Bespoke\Image\Contracts\ImagesInterface` |
| `core/note` | NotesInterface | `Bespoke\Note\Contracts\NotesInterface` |
| `core/editor` | EditableInterface, StubManagerInterface, WysiwygInterface | `Bespoke\Editor\Contracts\*` |
| `core/employee` | AssigneeInterface, AssigneesInterface | `Bespoke\Employee\Contracts\*` |
| `core/user` | Profileable, StateInterface | `Bespoke\User\Contracts\*` |
| `core/setting` | DataTypes, Groups, InputTypes, Namespaces | `Bespoke\Setting\Contracts\*` |

### ⚠️ Remaining Packages (Non-Core)

These packages still use the old `src/Interfaces/` directory pattern:

| Package | Interface | Full Namespace | Priority |
|---------|-----------|----------------|----------|
| `custom/area` | `AreaInterface` | `Bespoke\Area\Interfaces\AreaInterface` | LOW |
| `ecommerce/product` | Various | `Bespoke\Product\Interfaces\*` | LOW |
| `template/skeleton-crud` | Template | `Bespoke\Skeleton\Interfaces\*` | N/A (Template) |
| `api/google-apis` | Various | `Bespoke\GoogleApis\Interfaces\*` | LOW |
| `api/microsoft` | Various | `Bespoke\Microsoft\Interfaces\*` | LOW |

**Note:** `default/continent` and `default/country` have empty `src/Interfaces/` directories (containing only `.gitkeep`) and now use `src/Contracts/` for all contracts. These can be considered migrated.

### Migration Command Reference

To find remaining Interfaces references:
```bash
find /path/to/bespoke -path "*/src/Interfaces" -type d -not -path "*/vendor/*"
```

To find references to old namespaces:
```bash
grep -r "Bespoke\\\\.*\\\\Interfaces" --include="*.php" /path/to/bespoke
```

---

## 2. Trait Interfaces

Trait interfaces define the contract that models must implement when using certain traits. These are high-impact interfaces as they are implemented by many models across packages.

### 2.1 Migrated to Contracts (Current Standard)

| Package | Contract | Full Namespace | Trait | Used By |
|---------|----------|----------------|-------|---------|
| `crm/address` | `Addresses` | `Bespoke\Address\Contracts\Addresses` | `HasAddresses` | Customer, Supplier |
| `crm/calendar-event` | `CalendarEvents` | `Bespoke\CalendarEvent\Contracts\CalendarEvents` | `HasCalendarEvents` | Project, Customer |
| `crm/contact` | `Contacts` | `Bespoke\Contact\Contracts\Contacts` | `HasContacts` | Customer, Supplier |
| `crm/customer-package` | `PackageTimes` | `Bespoke\CustomerPackage\Contracts\PackageTimes` | `HasPackageTimes` | Project, Task |
| `crm/customer` | `HasCustomer` | `Bespoke\Customer\Contracts\HasCustomer` | `HasCustomer` | Models with customer |
| `crm/supplier` | `HasSupplier` | `Bespoke\Supplier\Contracts\HasSupplier` | `HasSupplier` | Models with supplier |
| `default/seo` | `Seo` | `Bespoke\Seo\Contracts\Seo` | `HasSeo` | Page, Post, City, County, Region, Country, Continent |
| `core/document` | `Documentable` | `Bespoke\Document\Contracts\Documentable` | `HasDocuments` | Models with documents |
| `core/image` | `Imageable` | `Bespoke\Image\Contracts\Imageable` | `HasImages` | Models with images |
| `core/note` | `Noteable` | `Bespoke\Note\Contracts\Noteable` | `HasNotes` | Models with notes |

### 2.2 ✅ Recently Migrated Trait Interfaces (2026-02-05)

These trait interfaces were migrated from `Interfaces/` to `Contracts/`:

| Package | Old Interface | New Contract Location |
|---------|---------------|----------------------|
| `core/document` | `DocumentsInterface` | `Bespoke\Document\Contracts\DocumentsInterface` |
| `core/image` | `ImagesInterface` | `Bespoke\Image\Contracts\ImagesInterface` |
| `core/note` | `NotesInterface` | `Bespoke\Note\Contracts\NotesInterface` |
| `core/editor` | `EditableInterface` | `Bespoke\Editor\Contracts\EditableInterface` |
| `core/employee` | `AssigneesInterface` | `Bespoke\Employee\Contracts\AssigneesInterface` |
| `core/employee` | `AssigneeInterface` | `Bespoke\Employee\Contracts\AssigneeInterface` |

---

## 3. Model Contracts

Model contracts are marker interfaces for dependency injection, allowing models to be swapped via configuration.

### 3.1 API Packages

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `api/magento` | Various Data/Parser/Resource contracts | `Bespoke\Magento\Contracts\*` |
| `api/microsoft` | `MicrosoftToken` | `Bespoke\Microsoft\Contracts\MicrosoftToken` |

### 3.2 CMS Packages

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/enquiry` | `Enquiry` | `Bespoke\Enquiry\Contracts\Enquiry` |
| `cms/menu` | `Menu` | `Bespoke\Menu\Contracts\Menu` |
| `cms/menu-item` | `MenuItem` | `Bespoke\MenuItem\Contracts\MenuItem` |
| `cms/page` | `Page` | `Bespoke\Page\Contracts\Page` |
| `cms/post` | `Post` | `Bespoke\Post\Contracts\Post` |
| `cms/post-category` | `PostCategory` | `Bespoke\PostCategory\Contracts\PostCategory` |
| `cms/review` | `Review` | `Bespoke\Review\Contracts\Review` |

### 3.3 Core Packages

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `core/acl` | `Permission` | `Bespoke\Acl\Contracts\Permission` |
| `core/acl` | `PermissionGroup` | `Bespoke\Acl\Contracts\PermissionGroup` |
| `core/acl` | `Role` | `Bespoke\Acl\Contracts\Role` |
| `core/activity` | `Activity` | `Bespoke\Activity\Contracts\Activity` |
| `core/auth` | `AuthAttempt` | `Bespoke\Auth\Contracts\AuthAttempt` |
| `core/auth` | `AuthLog` | `Bespoke\Auth\Contracts\AuthLog` |
| `core/auth` | `AuthToken` | `Bespoke\Auth\Contracts\AuthToken` |
| `core/auth` | `PasswordHistory` | `Bespoke\Auth\Contracts\PasswordHistory` |
| `core/auth` | `Session` | `Bespoke\Auth\Contracts\Session` |
| `core/captcha` | `Captcha` | `Bespoke\Captcha\Contracts\Captcha` |
| `core/chart` | `AreaChart` | `Bespoke\Chart\Contracts\AreaChart` |
| `core/chart` | `ColumnChart` | `Bespoke\Chart\Contracts\ColumnChart` |
| `core/chart` | `LineChart` | `Bespoke\Chart\Contracts\LineChart` |
| `core/chart` | `PieChart` | `Bespoke\Chart\Contracts\PieChart` |
| `core/document` | `Document` | `Bespoke\Document\Contracts\Document` |
| `core/employee` | `Employee` | `Bespoke\Employee\Contracts\Employee` |
| `core/employee` | `EmployeeDay` | `Bespoke\Employee\Contracts\EmployeeDay` |
| `core/image` | `Image` | `Bespoke\Image\Contracts\Image` |
| `core/module` | `Module` | `Bespoke\Module\Contracts\Module` |
| `core/module` | `ModuleGroup` | `Bespoke\Module\Contracts\ModuleGroup` |
| `core/note` | `Note` | `Bespoke\Note\Contracts\Note` |
| `core/notification` | `Notification` | `Bespoke\Notification\Contracts\Notification` |
| `core/setting` | `Setting` | `Bespoke\Setting\Contracts\Setting` |
| `core/user` | `User` | `Bespoke\User\Contracts\User` |

### 3.4 CRM Packages

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `crm/address` | `Address` | `Bespoke\Address\Contracts\Address` |
| `crm/calendar-event` | `CalendarEvent` | `Bespoke\CalendarEvent\Contracts\CalendarEvent` |
| `crm/city` | `City` | `Bespoke\City\Contracts\City` |
| `crm/contact` | `Contact` | `Bespoke\Contact\Contracts\Contact` |
| `crm/county` | `County` | `Bespoke\County\Contracts\County` |
| `crm/customer` | `Customer` | `Bespoke\Customer\Contracts\Customer` |
| `crm/customer-package` | `CustomerPackage` | `Bespoke\CustomerPackage\Contracts\CustomerPackage` |
| `crm/customer-package` | `CustomerPackageTime` | `Bespoke\CustomerPackage\Contracts\CustomerPackageTime` |
| `crm/location` | `Location` | `Bespoke\Location\Contracts\Location` |
| `crm/project` | `Project` | `Bespoke\Project\Contracts\Project` |
| `crm/region` | `Region` | `Bespoke\Region\Contracts\Region` |
| `crm/supplier` | `Supplier` | `Bespoke\Supplier\Contracts\Supplier` |
| `crm/task` | `Task` | `Bespoke\Task\Contracts\Task` |

### 3.5 Default Packages

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `default/cloudflare` | `CloudFlare` | `Bespoke\Cloudflare\Contracts\CloudFlare` |
| `default/continent` | `Continent` | `Bespoke\Continent\Contracts\Continent` |
| `default/country` | `Country` | `Bespoke\Country\Contracts\Country` |
| `default/redirect` | `Redirect` | `Bespoke\Redirect\Contracts\Redirect` |
| `default/referrer` | `Referrer` | `Bespoke\Referrer\Contracts\Referrer` |
| `default/seo` | `Seo` | `Bespoke\Seo\Contracts\Seo` |

### 3.6 E-commerce Packages

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `ecommerce/product` | `Product` | `Bespoke\Product\Contracts\Product` |

---

## 4. Controller Contracts

Controller contracts are organised by context (Admin, Api, Frontend, Account).

### 4.1 Admin Controller Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/enquiry` | `EnquiryController` | `Bespoke\Enquiry\Contracts\Admin\EnquiryController` |
| `cms/enquiry` | `ActivityController` | `Bespoke\Enquiry\Contracts\Admin\ActivityController` |
| `cms/page` | `PageController` | `Bespoke\Page\Contracts\Admin\PageController` |
| `cms/page` | `ActivityController` | `Bespoke\Page\Contracts\Admin\ActivityController` |
| `cms/page` | `ImageController` | `Bespoke\Page\Contracts\Admin\ImageController` |
| `cms/post` | `PostController` | `Bespoke\Post\Contracts\Admin\PostController` |
| `cms/post` | `ActivityController` | `Bespoke\Post\Contracts\Admin\ActivityController` |
| `cms/post-category` | `PostCategoryController` | `Bespoke\PostCategory\Contracts\Admin\PostCategoryController` |
| `cms/post-category` | `ActivityController` | `Bespoke\PostCategory\Contracts\Admin\ActivityController` |
| `cms/review` | `ReviewController` | `Bespoke\Review\Contracts\Admin\ReviewController` |
| `cms/review` | `ActivityController` | `Bespoke\Review\Contracts\Admin\ActivityController` |
| `core/acl` | `RoleController` | `Bespoke\Acl\Contracts\Admin\RoleController` |
| `core/dashboard` | `QuickLinkController` | `Bespoke\Dashboard\Contracts\Admin\QuickLinkController` |
| `core/document` | `DocumentController` | `Bespoke\Document\Contracts\Admin\DocumentController` |
| `core/editor` | `AIController` | `Bespoke\Editor\Contracts\Admin\AIController` |
| `core/editor` | `ImageController` | `Bespoke\Editor\Contracts\Admin\ImageController` |
| `core/employee` | `EmployeeController` | `Bespoke\Employee\Contracts\Admin\EmployeeController` |
| `core/employee` | `ActivityController` | `Bespoke\Employee\Contracts\Admin\ActivityController` |
| `core/employee` | `ScheduleController` | `Bespoke\Employee\Contracts\Admin\ScheduleController` |
| `core/image` | `ImageController` | `Bespoke\Image\Contracts\Admin\ImageController` |
| `core/note` | `NoteController` | `Bespoke\Note\Contracts\Admin\NoteController` |
| `core/notification` | `NotificationController` | `Bespoke\Notification\Contracts\Admin\NotificationController` |
| `core/profile` | `ProfileController` | `Bespoke\Profile\Contracts\Admin\ProfileController` |
| `core/profile` | `SecurityController` | `Bespoke\Profile\Contracts\Admin\SecurityController` |
| `core/setting` | `ClearCacheController` | `Bespoke\Setting\Contracts\Admin\ClearCacheController` |
| `core/setting` | `ClientController` | `Bespoke\Setting\Contracts\Admin\ClientController` |
| `core/setting` | `ModuleController` | `Bespoke\Setting\Contracts\Admin\ModuleController` |
| `core/setting` | `OptimiseCacheController` | `Bespoke\Setting\Contracts\Admin\OptimiseCacheController` |
| `core/setting` | `SettingController` | `Bespoke\Setting\Contracts\Admin\SettingController` |
| `core/setting` | `SystemController` | `Bespoke\Setting\Contracts\Admin\SystemController` |
| `core/setting` | `ThemeController` | `Bespoke\Setting\Contracts\Admin\ThemeController` |
| `core/two-factor` | `ConfirmTwoFactorController` | `Bespoke\TwoFactor\Contracts\Admin\ConfirmTwoFactorController` |
| `core/two-factor` | `DisableTwoFactorController` | `Bespoke\TwoFactor\Contracts\Admin\DisableTwoFactorController` |
| `core/two-factor` | `EnableTwoFactorController` | `Bespoke\TwoFactor\Contracts\Admin\EnableTwoFactorController` |
| `core/user` | `UserController` | `Bespoke\User\Contracts\Admin\UserController` |
| `core/user` | `UserImpersonationController` | `Bespoke\User\Contracts\Admin\UserImpersonationController` |
| `crm/address` | `AddressController` | `Bespoke\Address\Contracts\Admin\AddressController` |
| `crm/address` | `ActivityController` | `Bespoke\Address\Contracts\Admin\ActivityController` |
| `crm/city` | `CityController` | `Bespoke\City\Contracts\Admin\CityController` |
| `crm/contact` | `ContactController` | `Bespoke\Contact\Contracts\Admin\ContactController` |
| `crm/contact` | `ActivityController` | `Bespoke\Contact\Contracts\Admin\ActivityController` |
| `crm/contact` | `MarketingController` | `Bespoke\Contact\Contracts\Admin\MarketingController` |
| `crm/county` | `CountyController` | `Bespoke\County\Contracts\Admin\CountyController` |
| `crm/customer-package` | `CustomerPackageController` | `Bespoke\CustomerPackage\Contracts\Admin\CustomerPackageController` |
| `crm/customer-package` | `ActivityController` | `Bespoke\CustomerPackage\Contracts\Admin\ActivityController` |
| `crm/customer-package` | `PackageTimeController` | `Bespoke\CustomerPackage\Contracts\Admin\PackageTimeController` |
| `crm/project` | `ProjectController` | `Bespoke\Project\Contracts\Admin\ProjectController` |
| `crm/region` | `RegionController` | `Bespoke\Region\Contracts\Admin\RegionController` |
| `crm/task` | `TaskController` | `Bespoke\Task\Contracts\Admin\TaskController` |
| `default/continent` | `ContinentController` | `Bespoke\Continent\Contracts\Admin\ContinentController` |
| `default/country` | `CountryController` | `Bespoke\Country\Contracts\Admin\CountryController` |
| `default/redirect` | `RedirectController` | `Bespoke\Redirect\Contracts\Admin\RedirectController` |

### 4.2 API Controller Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/page` | `PageController` | `Bespoke\Page\Contracts\Api\PageController` |
| `cms/post` | `PostController` | `Bespoke\Post\Contracts\Api\PostController` |
| `cms/post-category` | `PostCategoryController` | `Bespoke\PostCategory\Contracts\Api\PostCategoryController` |
| `core/auth` | `LoginController` | `Bespoke\Auth\Contracts\Api\LoginController` |
| `core/auth` | `LogoutController` | `Bespoke\Auth\Contracts\Api\LogoutController` |
| `core/document` | `DocumentController` | `Bespoke\Document\Contracts\Api\DocumentController` |
| `core/employee` | `EmployeeController` | `Bespoke\Employee\Contracts\Api\EmployeeController` |
| `core/image` | `ImageController` | `Bespoke\Image\Contracts\Api\ImageController` |
| `core/note` | `NoteController` | `Bespoke\Note\Contracts\Api\NoteController` |
| `core/profile` | `ProfileController` | `Bespoke\Profile\Contracts\Api\ProfileController` |
| `core/user` | `UserController` | `Bespoke\User\Contracts\Api\UserController` |
| `crm/address` | `AddressController` | `Bespoke\Address\Contracts\Api\AddressController` |
| `crm/city` | `CityController` | `Bespoke\City\Contracts\Api\CityController` |
| `crm/contact` | `ContactController` | `Bespoke\Contact\Contracts\Api\ContactController` |
| `crm/county` | `CountyController` | `Bespoke\County\Contracts\Api\CountyController` |
| `crm/customer-package` | `CustomerPackageController` | `Bespoke\CustomerPackage\Contracts\Api\CustomerPackageController` |
| `crm/project` | `ProjectController` | `Bespoke\Project\Contracts\Api\ProjectController` |
| `crm/region` | `RegionController` | `Bespoke\Region\Contracts\Api\RegionController` |
| `crm/task` | `TaskController` | `Bespoke\Task\Contracts\Api\TaskController` |
| `default/continent` | `ContinentController` | `Bespoke\Continent\Contracts\Api\ContinentController` |
| `default/country` | `CountryController` | `Bespoke\Country\Contracts\Api\CountryController` |
| `default/redirect` | `RedirectController` | `Bespoke\Redirect\Contracts\Api\RedirectController` |

### 4.3 Frontend Controller Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/enquiry` | `EnquiryController` | `Bespoke\Enquiry\Contracts\Frontend\EnquiryController` |
| `cms/page` | `PageController` | `Bespoke\Page\Contracts\Frontend\PageController` |
| `cms/post` | `PostController` | `Bespoke\Post\Contracts\Frontend\PostController` |
| `cms/post-category` | `PostCategoryController` | `Bespoke\PostCategory\Contracts\Frontend\PostCategoryController` |
| `cms/review` | `ReviewController` | `Bespoke\Review\Contracts\Frontend\ReviewController` |
| `core/auth` | `AuthLinkController` | `Bespoke\Auth\Contracts\Frontend\AuthLinkController` |
| `core/auth` | `ConfirmPasswordController` | `Bespoke\Auth\Contracts\Frontend\ConfirmPasswordController` |
| `core/auth` | `EmailVerificationController` | `Bespoke\Auth\Contracts\Frontend\EmailVerificationController` |
| `core/auth` | `LoginController` | `Bespoke\Auth\Contracts\Frontend\LoginController` |
| `core/auth` | `LogoutController` | `Bespoke\Auth\Contracts\Frontend\LogoutController` |
| `core/auth` | `NewPasswordController` | `Bespoke\Auth\Contracts\Frontend\NewPasswordController` |
| `core/auth` | `PasswordResetController` | `Bespoke\Auth\Contracts\Frontend\PasswordResetController` |
| `core/auth` | `RegisterController` | `Bespoke\Auth\Contracts\Frontend\RegisterController` |
| `core/auth` | `VerifyEmailController` | `Bespoke\Auth\Contracts\Frontend\VerifyEmailController` |
| `core/two-factor` | `OneTimeCodeController` | `Bespoke\TwoFactor\Contracts\Frontend\OneTimeCodeController` |
| `core/two-factor` | `RecoveryCodeController` | `Bespoke\TwoFactor\Contracts\Frontend\RecoveryCodeController` |

### 4.4 Account Controller Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `core/dashboard` | `DashboardController` | `Bespoke\Dashboard\Contracts\Account\DashboardController` |
| `core/notification` | `NotificationController` | `Bespoke\Notification\Contracts\Account\NotificationController` |
| `core/profile` | `ProfileController` | `Bespoke\Profile\Contracts\Account\ProfileController` |

---

## 5. Request Contracts

### 5.1 Admin Request Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/enquiry` | `UpdateEnquiry` | `Bespoke\Enquiry\Contracts\Admin\UpdateEnquiry` |
| `cms/page` | `UpdatePage` | `Bespoke\Page\Contracts\Admin\UpdatePage` |
| `cms/post` | `UpdatePost` | `Bespoke\Post\Contracts\Admin\UpdatePost` |
| `cms/post-category` | `UpdatePostCategory` | `Bespoke\PostCategory\Contracts\Admin\UpdatePostCategory` |
| `cms/review` | `UpdateReview` | `Bespoke\Review\Contracts\Admin\UpdateReview` |
| `core/acl` | `StoreRole` | `Bespoke\Acl\Contracts\Admin\StoreRole` |
| `core/acl` | `UpdateRole` | `Bespoke\Acl\Contracts\Admin\UpdateRole` |
| `core/document` | `StoreDocument` | `Bespoke\Document\Contracts\Admin\StoreDocument` |
| `core/document` | `UpdateDocument` | `Bespoke\Document\Contracts\Admin\UpdateDocument` |
| `core/employee` | `StoreEmployee` | `Bespoke\Employee\Contracts\Admin\StoreEmployee` |
| `core/employee` | `UpdateEmployee` | `Bespoke\Employee\Contracts\Admin\UpdateEmployee` |
| `core/image` | `StoreImage` | `Bespoke\Image\Contracts\Admin\StoreImage` |
| `core/image` | `UpdateImage` | `Bespoke\Image\Contracts\Admin\UpdateImage` |
| `core/note` | `StoreNote` | `Bespoke\Note\Contracts\Admin\StoreNote` |
| `core/note` | `UpdateNote` | `Bespoke\Note\Contracts\Admin\UpdateNote` |
| `core/profile` | `UpdateProfile` | `Bespoke\Profile\Contracts\Admin\UpdateProfile` |
| `core/profile` | `UpdateSecurity` | `Bespoke\Profile\Contracts\Admin\UpdateSecurity` |
| `core/user` | `StoreUser` | `Bespoke\User\Contracts\Admin\StoreUser` |
| `core/user` | `UpdateUser` | `Bespoke\User\Contracts\Admin\UpdateUser` |
| `crm/address` | `StoreAddress` | `Bespoke\Address\Contracts\Admin\StoreAddress` |
| `crm/address` | `UpdateAddress` | `Bespoke\Address\Contracts\Admin\UpdateAddress` |
| `crm/city` | `StoreCity` | `Bespoke\City\Contracts\Admin\StoreCity` |
| `crm/city` | `UpdateCity` | `Bespoke\City\Contracts\Admin\UpdateCity` |
| `crm/contact` | `UpdateContact` | `Bespoke\Contact\Contracts\Admin\UpdateContact` |
| `crm/contact` | `UpdateMarketing` | `Bespoke\Contact\Contracts\Admin\UpdateMarketing` |
| `crm/county` | `StoreCounty` | `Bespoke\County\Contracts\Admin\StoreCounty` |
| `crm/county` | `UpdateCounty` | `Bespoke\County\Contracts\Admin\UpdateCounty` |
| `crm/project` | `UpdateProject` | `Bespoke\Project\Contracts\Admin\UpdateProject` |
| `crm/region` | `StoreRegion` | `Bespoke\Region\Contracts\Admin\StoreRegion` |
| `crm/region` | `UpdateRegion` | `Bespoke\Region\Contracts\Admin\UpdateRegion` |
| `crm/task` | `UpdateTask` | `Bespoke\Task\Contracts\Admin\UpdateTask` |
| `default/continent` | `StoreContinent` | `Bespoke\Continent\Contracts\Admin\StoreContinent` |
| `default/continent` | `UpdateContinent` | `Bespoke\Continent\Contracts\Admin\UpdateContinent` |
| `default/country` | `StoreCountry` | `Bespoke\Country\Contracts\Admin\StoreCountry` |
| `default/country` | `UpdateCountry` | `Bespoke\Country\Contracts\Admin\UpdateCountry` |
| `default/redirect` | `StoreRedirect` | `Bespoke\Redirect\Contracts\Admin\StoreRedirect` |
| `default/redirect` | `UpdateRedirect` | `Bespoke\Redirect\Contracts\Admin\UpdateRedirect` |

### 5.2 API Request Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/page` | `StorePage` | `Bespoke\Page\Contracts\Api\StorePage` |
| `cms/page` | `UpdatePage` | `Bespoke\Page\Contracts\Api\UpdatePage` |
| `cms/post` | `StorePost` | `Bespoke\Post\Contracts\Api\StorePost` |
| `cms/post` | `UpdatePost` | `Bespoke\Post\Contracts\Api\UpdatePost` |
| `cms/post-category` | `StorePostCategory` | `Bespoke\PostCategory\Contracts\Api\StorePostCategory` |
| `cms/post-category` | `UpdatePostCategory` | `Bespoke\PostCategory\Contracts\Api\UpdatePostCategory` |
| `core/document` | `StoreDocument` | `Bespoke\Document\Contracts\Api\StoreDocument` |
| `core/document` | `UpdateDocument` | `Bespoke\Document\Contracts\Api\UpdateDocument` |
| `core/employee` | `StoreEmployee` | `Bespoke\Employee\Contracts\Api\StoreEmployee` |
| `core/employee` | `UpdateEmployee` | `Bespoke\Employee\Contracts\Api\UpdateEmployee` |
| `core/image` | `StoreImage` | `Bespoke\Image\Contracts\Api\StoreImage` |
| `core/image` | `UpdateImage` | `Bespoke\Image\Contracts\Api\UpdateImage` |
| `core/note` | `StoreNote` | `Bespoke\Note\Contracts\Api\StoreNote` |
| `core/note` | `UpdateNote` | `Bespoke\Note\Contracts\Api\UpdateNote` |
| `core/profile` | `UpdateProfile` | `Bespoke\Profile\Contracts\Api\UpdateProfile` |
| `core/user` | `StoreUser` | `Bespoke\User\Contracts\Api\StoreUser` |
| `core/user` | `UpdateUser` | `Bespoke\User\Contracts\Api\UpdateUser` |
| `crm/address` | `StoreAddress` | `Bespoke\Address\Contracts\Api\StoreAddress` |
| `crm/address` | `UpdateAddress` | `Bespoke\Address\Contracts\Api\UpdateAddress` |
| `crm/city` | `StoreCity` | `Bespoke\City\Contracts\Api\StoreCity` |
| `crm/city` | `UpdateCity` | `Bespoke\City\Contracts\Api\UpdateCity` |
| `crm/county` | `StoreCounty` | `Bespoke\County\Contracts\Api\StoreCounty` |
| `crm/county` | `UpdateCounty` | `Bespoke\County\Contracts\Api\UpdateCounty` |
| `crm/customer-package` | `StoreCustomerPackage` | `Bespoke\CustomerPackage\Contracts\Api\StoreCustomerPackage` |
| `crm/customer-package` | `UpdateCustomerPackage` | `Bespoke\CustomerPackage\Contracts\Api\UpdateCustomerPackage` |
| `crm/project` | `StoreProject` | `Bespoke\Project\Contracts\Api\StoreProject` |
| `crm/project` | `UpdateProject` | `Bespoke\Project\Contracts\Api\UpdateProject` |
| `crm/region` | `StoreRegion` | `Bespoke\Region\Contracts\Api\StoreRegion` |
| `crm/region` | `UpdateRegion` | `Bespoke\Region\Contracts\Api\UpdateRegion` |
| `crm/task` | `StoreTask` | `Bespoke\Task\Contracts\Api\StoreTask` |
| `crm/task` | `UpdateTask` | `Bespoke\Task\Contracts\Api\UpdateTask` |
| `default/continent` | `StoreContinent` | `Bespoke\Continent\Contracts\Api\StoreContinent` |
| `default/continent` | `UpdateContinent` | `Bespoke\Continent\Contracts\Api\UpdateContinent` |
| `default/country` | `StoreCountry` | `Bespoke\Country\Contracts\Api\StoreCountry` |
| `default/country` | `UpdateCountry` | `Bespoke\Country\Contracts\Api\UpdateCountry` |
| `default/redirect` | `StoreRedirect` | `Bespoke\Redirect\Contracts\Api\StoreRedirect` |
| `default/redirect` | `UpdateRedirect` | `Bespoke\Redirect\Contracts\Api\UpdateRedirect` |

### 5.3 Frontend Request Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/enquiry` | `StoreEnquiry` | `Bespoke\Enquiry\Contracts\Frontend\StoreEnquiry` |
| `cms/review` | `StoreReview` | `Bespoke\Review\Contracts\Frontend\StoreReview` |
| `core/auth` | `ConfirmPasswordRequest` | `Bespoke\Auth\Contracts\ConfirmPasswordRequest` |
| `core/auth` | `LoginRequest` | `Bespoke\Auth\Contracts\LoginRequest` |
| `core/auth` | `RegisterRequest` | `Bespoke\Auth\Contracts\RegisterRequest` |
| `core/auth` | `VerifyEmailRequest` | `Bespoke\Auth\Contracts\VerifyEmailRequest` |

### 5.4 Account Request Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `core/profile` | `UpdateProfile` | `Bespoke\Profile\Contracts\Account\UpdateProfile` |

---

## 6. Resource Contracts

### 6.1 API Resource Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/page` | `PageResource` | `Bespoke\Page\Contracts\Api\PageResource` |
| `cms/page` | `PageCollection` | `Bespoke\Page\Contracts\Api\PageCollection` |
| `cms/post` | `PostResource` | `Bespoke\Post\Contracts\Api\PostResource` |
| `cms/post` | `PostCollection` | `Bespoke\Post\Contracts\Api\PostCollection` |
| `cms/post-category` | `PostCategoryResource` | `Bespoke\PostCategory\Contracts\Api\PostCategoryResource` |
| `cms/post-category` | `PostCategoryCollection` | `Bespoke\PostCategory\Contracts\Api\PostCategoryCollection` |
| `core/document` | `DocumentResource` | `Bespoke\Document\Contracts\DocumentResource` |
| `core/document` | `DocumentCollection` | `Bespoke\Document\Contracts\DocumentCollection` |
| `core/employee` | `EmployeeResource` | `Bespoke\Employee\Contracts\EmployeeResource` |
| `core/employee` | `EmployeeCollection` | `Bespoke\Employee\Contracts\EmployeeCollection` |
| `core/image` | `ImageResource` | `Bespoke\Image\Contracts\ImageResource` |
| `core/image` | `ImageCollection` | `Bespoke\Image\Contracts\ImageCollection` |
| `core/note` | `NoteResource` | `Bespoke\Note\Contracts\NoteResource` |
| `core/note` | `NoteCollection` | `Bespoke\Note\Contracts\NoteCollection` |
| `core/user` | `UserResource` | `Bespoke\User\Contracts\Api\UserResource` |
| `core/user` | `UserCollection` | `Bespoke\User\Contracts\Api\UserCollection` |
| `crm/address` | `AddressResource` | `Bespoke\Address\Contracts\Api\AddressResource` |
| `crm/address` | `AddressCollection` | `Bespoke\Address\Contracts\Api\AddressCollection` |
| `crm/city` | `CityResource` | `Bespoke\City\Contracts\Api\CityResource` |
| `crm/city` | `CityCollection` | `Bespoke\City\Contracts\Api\CityCollection` |
| `crm/county` | `CountyResource` | `Bespoke\County\Contracts\Api\CountyResource` |
| `crm/county` | `CountyCollection` | `Bespoke\County\Contracts\Api\CountyCollection` |
| `crm/customer-package` | `CustomerPackageResource` | `Bespoke\CustomerPackage\Contracts\Api\CustomerPackageResource` |
| `crm/customer-package` | `CustomerPackageCollection` | `Bespoke\CustomerPackage\Contracts\Api\CustomerPackageCollection` |
| `crm/project` | `ProjectResource` | `Bespoke\Project\Contracts\Api\ProjectResource` |
| `crm/project` | `ProjectCollection` | `Bespoke\Project\Contracts\Api\ProjectCollection` |
| `crm/region` | `RegionResource` | `Bespoke\Region\Contracts\Api\RegionResource` |
| `crm/region` | `RegionCollection` | `Bespoke\Region\Contracts\Api\RegionCollection` |
| `crm/task` | `TaskResource` | `Bespoke\Task\Contracts\Api\TaskResource` |
| `crm/task` | `TaskCollection` | `Bespoke\Task\Contracts\Api\TaskCollection` |

---

## 7. Action Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/page` | `CreateDuplicate` | `Bespoke\Page\Contracts\CreateDuplicate` |
| `cms/post` | `CreateDuplicate` | `Bespoke\Post\Contracts\CreateDuplicate` |
| `cms/review` | `CleanUpOldReviews` | `Bespoke\Review\Contracts\CleanUpOldReviews` |
| `cms/review` | `FindReview` | `Bespoke\Review\Contracts\FindReview` |
| `core/acl` | `CreateDirectorRole` | `Bespoke\Acl\Contracts\CreateDirectorRole` |
| `core/acl` | `CreateSystemRole` | `Bespoke\Acl\Contracts\CreateSystemRole` |
| `core/acl` | `UpdateSystemPermissions` | `Bespoke\Acl\Contracts\UpdateSystemPermissions` |
| `core/activity` | `GetLastActivity` | `Bespoke\Activity\Contracts\GetLastActivity` |
| `core/document` | `CreateDocument` | `Bespoke\Document\Contracts\CreateDocument` |
| `core/employee` | `CreateDefaultSchedule` | `Bespoke\Employee\Contracts\CreateDefaultSchedule` |
| `core/employee` | `CreateEmployee` | `Bespoke\Employee\Contracts\CreateEmployee` |
| `core/employee` | `GetEmployees` | `Bespoke\Employee\Contracts\GetEmployees` |
| `core/employee` | `SyncAssignees` | `Bespoke\Employee\Contracts\SyncAssignees` |
| `core/image` | `CreateImage` | `Bespoke\Image\Contracts\CreateImage` |
| `core/note` | `CreateNote` | `Bespoke\Note\Contracts\CreateNote` |
| `core/setting` | `ClearCache` | `Bespoke\Setting\Contracts\ClearCache` |
| `core/setting` | `OptimiseCache` | `Bespoke\Setting\Contracts\OptimiseCache` |
| `core/setting` | `UpdateSettings` | `Bespoke\Setting\Contracts\UpdateSettings` |
| `core/user` | `CreateUser` | `Bespoke\User\Contracts\CreateUser` |
| `core/user` | `FindUser` | `Bespoke\User\Contracts\FindUser` |
| `crm/address` | `CreateAddress` | `Bespoke\Address\Contracts\CreateAddress` |
| `crm/address` | `UpdateAddress` | `Bespoke\Address\Contracts\UpdateAddress` |
| `crm/address` | `DeleteAddress` | `Bespoke\Address\Contracts\DeleteAddress` |
| `crm/city` | `CreateCity` | `Bespoke\City\Contracts\CreateCity` |
| `crm/city` | `UpdateCity` | `Bespoke\City\Contracts\UpdateCity` |
| `crm/city` | `DeleteCity` | `Bespoke\City\Contracts\DeleteCity` |
| `crm/contact` | `CreateContact` | `Bespoke\Contact\Contracts\CreateContact` |
| `crm/customer` | `CreateCustomer` | `Bespoke\Customer\Contracts\CreateCustomer` |
| `crm/customer` | `FindCustomer` | `Bespoke\Customer\Contracts\FindCustomer` |
| `crm/customer` | `GetCustomers` | `Bespoke\Customer\Contracts\GetCustomers` |
| `crm/customer` | `SetPrimaryAddress` | `Bespoke\Customer\Contracts\SetPrimaryAddress` |
| `crm/customer` | `SetPrimaryContact` | `Bespoke\Customer\Contracts\SetPrimaryContact` |
| `crm/customer` | `SyncCustomer` | `Bespoke\Customer\Contracts\SyncCustomer` |
| `crm/customer-package` | `CreateCustomerPackage` | `Bespoke\CustomerPackage\Contracts\CreateCustomerPackage` |
| `crm/customer-package` | `UpdateCustomerPackage` | `Bespoke\CustomerPackage\Contracts\UpdateCustomerPackage` |
| `crm/customer-package` | `DeleteCustomerPackage` | `Bespoke\CustomerPackage\Contracts\DeleteCustomerPackage` |
| `crm/county` | `CreateCounty` | `Bespoke\County\Contracts\CreateCounty` |
| `crm/county` | `UpdateCounty` | `Bespoke\County\Contracts\UpdateCounty` |
| `crm/county` | `DeleteCounty` | `Bespoke\County\Contracts\DeleteCounty` |
| `crm/location` | `GeoLookup` | `Bespoke\Location\Contracts\GeoLookup` |
| `crm/supplier` | `CreateSupplier` | `Bespoke\Supplier\Contracts\CreateSupplier` |
| `crm/supplier` | `FindSupplier` | `Bespoke\Supplier\Contracts\FindSupplier` |
| `crm/supplier` | `GetSuppliers` | `Bespoke\Supplier\Contracts\GetSuppliers` |
| `crm/supplier` | `SetPrimaryAddress` | `Bespoke\Supplier\Contracts\SetPrimaryAddress` |
| `crm/supplier` | `SetPrimaryContact` | `Bespoke\Supplier\Contracts\SetPrimaryContact` |
| `crm/supplier` | `SyncSupplier` | `Bespoke\Supplier\Contracts\SyncSupplier` |
| `crm/project` | `CreateProject` | `Bespoke\Project\Contracts\CreateProject` |
| `crm/project` | `UpdateProject` | `Bespoke\Project\Contracts\UpdateProject` |
| `crm/project` | `DeleteProject` | `Bespoke\Project\Contracts\DeleteProject` |
| `crm/project` | `GenerateNumber` | `Bespoke\Project\Contracts\GenerateNumber` |
| `crm/project` | `GenerateReference` | `Bespoke\Project\Contracts\GenerateReference` |
| `crm/project` | `CreateDuplicate` | `Bespoke\Project\Contracts\CreateDuplicate` |
| `crm/project` | `MakeProject` | `Bespoke\Project\Contracts\MakeProject` |
| `crm/region` | `CreateRegion` | `Bespoke\Region\Contracts\CreateRegion` |
| `crm/region` | `UpdateRegion` | `Bespoke\Region\Contracts\UpdateRegion` |
| `crm/region` | `DeleteRegion` | `Bespoke\Region\Contracts\DeleteRegion` |
| `crm/task` | `CreateTask` | `Bespoke\Task\Contracts\CreateTask` |
| `crm/task` | `UpdateTask` | `Bespoke\Task\Contracts\UpdateTask` |
| `crm/task` | `DeleteTask` | `Bespoke\Task\Contracts\DeleteTask` |
| `default/continent` | `CreateContinent` | `Bespoke\Continent\Contracts\CreateContinent` |
| `default/continent` | `UpdateContinent` | `Bespoke\Continent\Contracts\UpdateContinent` |
| `default/continent` | `DeleteContinent` | `Bespoke\Continent\Contracts\DeleteContinent` |
| `default/country` | `CreateCountry` | `Bespoke\Country\Contracts\CreateCountry` |
| `default/country` | `UpdateCountry` | `Bespoke\Country\Contracts\UpdateCountry` |
| `default/country` | `DeleteCountry` | `Bespoke\Country\Contracts\DeleteCountry` |
| `default/pwa` | `GenerateServiceWorker` | `Bespoke\Pwa\Contracts\GenerateServiceWorker` |
| `default/redirect` | `CreateRedirect` | `Bespoke\Redirect\Contracts\CreateRedirect` |
| `default/redirect` | `UpdateRedirect` | `Bespoke\Redirect\Contracts\UpdateRedirect` |
| `default/redirect` | `DeleteRedirect` | `Bespoke\Redirect\Contracts\DeleteRedirect` |
| `default/redirect` | `RedirectService` | `Bespoke\Redirect\Contracts\RedirectService` |
| `default/seo` | `GenerateSitemap` | `Bespoke\Seo\Contracts\GenerateSitemap` |

---

## 8. Other Contracts

### 8.1 Export Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/enquiry` | `EnquiryExport` | `Bespoke\Enquiry\Contracts\EnquiryExport` |
| `cms/page` | `PageExport` | `Bespoke\Page\Contracts\PageExport` |
| `cms/post` | `PostExport` | `Bespoke\Post\Contracts\PostExport` |
| `cms/post-category` | `PostCategoryExport` | `Bespoke\PostCategory\Contracts\PostCategoryExport` |
| `cms/review` | `ReviewExport` | `Bespoke\Review\Contracts\ReviewExport` |
| `core/document` | `DocumentExport` | `Bespoke\Document\Contracts\DocumentExport` |
| `core/employee` | `EmployeeExport` | `Bespoke\Employee\Contracts\EmployeeExport` |
| `core/image` | `ImageExport` | `Bespoke\Image\Contracts\ImageExport` |
| `core/note` | `NoteExport` | `Bespoke\Note\Contracts\NoteExport` |
| `core/user` | `UserExport` | `Bespoke\User\Contracts\UserExport` |
| `crm/address` | `AddressExport` | `Bespoke\Address\Contracts\AddressExport` |
| `crm/calendar-event` | `CalendarEventExport` | `Bespoke\CalendarEvent\Contracts\CalendarEventExport` |
| `crm/city` | `CityExport` | `Bespoke\City\Contracts\CityExport` |
| `crm/contact` | `ContactExport` | `Bespoke\Contact\Contracts\ContactExport` |
| `crm/county` | `CountyExport` | `Bespoke\County\Contracts\CountyExport` |
| `crm/customer` | `CustomerExport` | `Bespoke\Customer\Contracts\CustomerExport` |
| `crm/customer-package` | `CustomerPackageExport` | `Bespoke\CustomerPackage\Contracts\CustomerPackageExport` |
| `crm/project` | `ProjectExport` | `Bespoke\Project\Contracts\ProjectExport` |
| `crm/region` | `RegionExport` | `Bespoke\Region\Contracts\RegionExport` |
| `crm/task` | `TaskExport` | `Bespoke\Task\Contracts\TaskExport` |
| `crm/supplier` | `SupplierExport` | `Bespoke\Supplier\Contracts\SupplierExport` |
| `default/continent` | `ContinentExport` | `Bespoke\Continent\Contracts\ContinentExport` |
| `default/country` | `CountryExport` | `Bespoke\Country\Contracts\CountryExport` |
| `default/redirect` | `RedirectExport` | `Bespoke\Redirect\Contracts\RedirectExport` |

### 8.2 Import Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/review` | `ReviewImport` | `Bespoke\Review\Contracts\ReviewImport` |
| `core/document` | `DocumentImport` | `Bespoke\Document\Contracts\DocumentImport` |
| `core/employee` | `EmployeeImport` | `Bespoke\Employee\Contracts\EmployeeImport` |
| `core/image` | `ImageImport` | `Bespoke\Image\Contracts\ImageImport` |
| `core/note` | `NoteImport` | `Bespoke\Note\Contracts\NoteImport` |
| `core/user` | `UserImport` | `Bespoke\User\Contracts\UserImport` |
| `crm/address` | `AddressImport` | `Bespoke\Address\Contracts\AddressImport` |
| `crm/city` | `CityImport` | `Bespoke\City\Contracts\CityImport` |
| `crm/contact` | `ContactImport` | `Bespoke\Contact\Contracts\ContactImport` |
| `crm/county` | `CountyImport` | `Bespoke\County\Contracts\CountyImport` |
| `crm/customer` | `CustomerImport` | `Bespoke\Customer\Contracts\CustomerImport` |
| `crm/customer-package` | `CustomerPackageImport` | `Bespoke\CustomerPackage\Contracts\CustomerPackageImport` |
| `crm/project` | `ProjectImport` | `Bespoke\Project\Contracts\ProjectImport` |
| `crm/region` | `RegionImport` | `Bespoke\Region\Contracts\RegionImport` |
| `crm/supplier` | `SupplierImport` | `Bespoke\Supplier\Contracts\SupplierImport` |
| `crm/task` | `TaskImport` | `Bespoke\Task\Contracts\TaskImport` |
| `default/continent` | `ContinentImport` | `Bespoke\Continent\Contracts\ContinentImport` |
| `default/country` | `CountryImport` | `Bespoke\Country\Contracts\CountryImport` |

### 8.3 Factory Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/enquiry` | `EnquiryFactory` | `Bespoke\Enquiry\Contracts\EnquiryFactory` |
| `cms/page` | `PageFactory` | `Bespoke\Page\Contracts\PageFactory` |
| `cms/post` | `PostFactory` | `Bespoke\Post\Contracts\PostFactory` |
| `cms/post-category` | `PostCategoryFactory` | `Bespoke\PostCategory\Contracts\PostCategoryFactory` |
| `cms/review` | `ReviewFactory` | `Bespoke\Review\Contracts\ReviewFactory` |
| `core/acl` | `RoleFactory` | `Bespoke\Acl\Contracts\RoleFactory` |

### 8.4 Enum Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `cms/menu-item` | `MenuItemTargetEnum` | `Bespoke\MenuItem\Contracts\MenuItemTargetEnum` |
| `cms/menu-item` | `MenuItemTypeEnum` | `Bespoke\MenuItem\Contracts\MenuItemTypeEnum` |
| `cms/review` | `RatingEnum` | `Bespoke\Review\Contracts\RatingEnum` |
| `cms/review` | `RecommendEnum` | `Bespoke\Review\Contracts\RecommendEnum` |
| `cms/review` | `ReviewStatusEnum` | `Bespoke\Review\Contracts\ReviewStatusEnum` |

### 8.5 Rule Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `core/employee` | `UniqueEmployeeEmail` | `Bespoke\Employee\Contracts\UniqueEmployeeEmail` |
| `core/profile` | `UniqueProfileEmail` | `Bespoke\Profile\Contracts\UniqueProfileEmail` |
| `crm/contact` | `UniqueContactEmail` | `Bespoke\Contact\Contracts\UniqueContactEmail` |

### 8.6 Response Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `core/auth` | `LoginResponse` | `Bespoke\Auth\Contracts\LoginResponse` |

### 8.7 Test Contracts

| Package | Contract | Full Namespace |
|---------|----------|----------------|
| `custom/tests` | `AccountAssertions` | `Bespoke\Tests\Contracts\AccountAssertions` |
| `custom/tests` | `AdminAssertions` | `Bespoke\Tests\Contracts\AdminAssertions` |
| `custom/tests` | `ApiAssertions` | `Bespoke\Tests\Contracts\ApiAssertions` |

---

## 9. Search Commands

Use these commands to find references when renaming interfaces or contracts.

### 9.1 Find All References to an Interface

```bash
# Search for a specific interface
grep -r "Bespoke\\Image\\Interfaces\\ImagesInterface" --include="*.php" . | grep -v vendor

# Search for any usage of an old Interfaces namespace
grep -r "\\\\Interfaces\\\\" --include="*.php" . | grep -v vendor | grep "Bespoke"
```

### 9.2 Find All Files Implementing an Interface

```bash
# Find all models implementing ImagesInterface
grep -r "implements.*ImagesInterface" --include="*.php" . | grep -v vendor
```

### 9.3 Find All Interface Files

```bash
# List all interface files (old pattern)
find . -path "*/src/Interfaces/*.php" -type f ! -path "*/vendor/*"

# List all contract files (new pattern)
find . -path "*/src/Contracts/*.php" -type f ! -path "*/vendor/*"
```

### 9.4 Validate No Broken References After Rename

```bash
# After renaming, check for any remaining references to old namespace
OLD_NAMESPACE="Bespoke\\Seo\\Interfaces\\SeoInterface"
grep -r "$OLD_NAMESPACE" --include="*.php" . | grep -v vendor

# Run PHPStan across all packages to catch type errors
for pkg in core/* crm/* cms/* default/* custom/*; do
    if [ -f "$pkg/composer.json" ]; then
        echo "Analysing $pkg..."
        (cd "$pkg" && composer analyse 2>/dev/null || true)
    fi
done
```

---

## Summary Statistics

| Category | Count |
|----------|-------|
| ✅ Core packages migrated to Contracts | 8 |
| ✅ CRM packages upgraded to full CRUD | 7 |
| ⚠️ Non-core packages still using Interfaces | ~7 |
| Model Contracts | 55 |
| Controller Contracts (Admin) | 51 |
| Controller Contracts (API) | 22 |
| Controller Contracts (Frontend) | 16 |
| Controller Contracts (Account) | 3 |
| Request Contracts (Admin) | 39 |
| Request Contracts (API) | 38 |
| Request Contracts (Frontend) | 6 |
| Resource Contracts | 28 |
| Action Contracts | 58 |
| Export Contracts | 24 |
| Import Contracts | 19 |
| Factory Contracts | 6 |
| Enum Contracts | 5 |
| Rule Contracts | 3 |
| **Total** | **~396** |
