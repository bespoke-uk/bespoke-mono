# Livewire Components Registry

This document provides a comprehensive registry of all Livewire components across the Bespoke CMS monorepo.

**Related Documentation:**
- [CLAUDE.md](../../CLAUDE.md) - Quick reference
- [package_standards.md](../standards/package_standards.md) - Architecture standards
- [monorepo_analysis.md](monorepo_analysis.md) - Complete package analysis

---

## Overview

| Metric | Count |
|--------|-------|
| Total Packages with Components | 39 |
| Total Livewire Components | 98 |
| Data Table Components | 30+ |
| AutoComplete Components | 11+ |
| Modal Components | 8+ |
| Form Components | 12+ |
| Visualization Components | 4 |

---

## Component Registration Pattern

All packages register Livewire components in `config/{package}.php`:

```php
'livewire' => [
    \Bespoke\Package\Livewire\Admin\DataTable::class => 'admin.entity-data-table',
    \Bespoke\Package\Livewire\Admin\Modal::class => 'admin.entity-modal',
],
```

Components are automatically registered by `PackageServiceProvider` during boot.

---

## Components by Package

### Core Packages

#### core/acl

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Acl\Livewire\Admin\RoleBuilder` | `admin.role-builder` | Role and permission assignment UI |
| `Bespoke\Acl\Livewire\Admin\RoleDataTable` | `admin.role-data-table` | Role listing table |

#### core/auth

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Auth\Livewire\Frontend\Register` | `frontend.register` | User registration form |

#### core/chart

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Chart\Livewire\AreaChart` | `chart.area-chart` | Area chart visualisation |
| `Bespoke\Chart\Livewire\ColumnChart` | `chart.column-chart` | Column chart visualisation |
| `Bespoke\Chart\Livewire\LineChart` | `chart.line-chart` | Line chart visualisation |
| `Bespoke\Chart\Livewire\PieChart` | `chart.pie-chart` | Pie chart visualisation |

#### core/document

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Document\Livewire\Admin\DocumentDataTable` | `admin.document-data-table` | Document listing table |
| `Bespoke\Document\Livewire\Shared\DocumentUpload` | `form.document-upload` | Single document upload |
| `Bespoke\Document\Livewire\Shared\MultiDocumentUpload` | `form.multi-document-upload` | Multi-document upload with sorting |

#### core/editor

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Editor\Livewire\Admin\Wysiwyg` | `form.wysiwyg` | WYSIWYG editor (Imperavi Redactor) |
| `Bespoke\Editor\Livewire\Frontend\TopMenu` | `frontend.editor-top-menu` | Frontend editor top menu |

#### core/employee

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Employee\Livewire\Admin\EmployeeAutoComplete` | `admin.employee-auto-complete` | Employee search autocomplete |
| `Bespoke\Employee\Livewire\Admin\EmployeeDataTable` | `admin.employee-data-table` | Employee listing table |

#### core/image

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Image\Livewire\Admin\ImageDataTable` | `admin.image-data-table` | Image gallery admin |
| `Bespoke\Image\Livewire\Shared\CoverImage` | `form.cover-image` | Single cover image upload |
| `Bespoke\Image\Livewire\Shared\ImageUpload` | `form.image-upload` | Single image upload |
| `Bespoke\Image\Livewire\Shared\Lightbox` | `lightbox` | Full-size image modal viewer |
| `Bespoke\Image\Livewire\Shared\MultiImageUpload` | `form.multi-image-upload` | Drag-drop multi-image upload |
| `Bespoke\Image\Livewire\Shared\Wysiwyg` | `form.wysiwyg` | WYSIWYG with image insertion |

#### core/note

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Note\Livewire\Admin\NoteBuilder` | `admin.note-builder` | Note creation/editing UI |

#### core/notification

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Notification\Livewire\Shared\HeaderNotifications` | `header.notifications` | Header notification dropdown |

#### core/profile

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Profile\Livewire\Account\ProfileDetails` | `account.profile-details` | User profile self-service form |

#### core/user

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\User\Livewire\Admin\UserDataTable` | `admin.user-data-table` | User listing table |

---

### CMS Packages

#### cms/enquiry

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Enquiry\Livewire\Admin\EnquiryDataTable` | `admin.enquiry-data-table` | Enquiry listing table |
| `Bespoke\Enquiry\Livewire\Admin\EnquiryDetails` | `admin.enquiry-details` | Enquiry detail view |
| `Bespoke\Enquiry\Livewire\Frontend\EnquiryDetails` | `frontend.enquiry-details` | Contact form |

#### cms/menu

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Menu\Livewire\Admin\MenuBuilder` | `admin.menu-builder` | Drag-drop menu editor |
| `Bespoke\Menu\Livewire\Admin\MenuDataTable` | `admin.menu-data-table` | Menu listing table |

#### cms/page

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Page\Livewire\Admin\PageDataTable` | `admin.page-data-table` | Page listing table |

#### cms/post

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Post\Livewire\Admin\PostDataTable` | `admin.post-data-table` | Blog post listing table |
| `Bespoke\Post\Livewire\Frontend\SidebarRecentPosts` | `frontend.sidebar-recent-posts` | Recent posts sidebar widget |
| `Bespoke\Post\Livewire\Frontend\SidebarRelatedPosts` | `frontend.sidebar-related-posts` | Related posts sidebar widget |

#### cms/post-category

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\PostCategory\Livewire\Admin\PostCategoryDataTable` | `admin.post-category-data-table` | Post category listing table |

#### cms/review

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Review\Livewire\Admin\ReviewDataTable` | `admin.review-data-table` | Review listing table |
| `Bespoke\Review\Livewire\Admin\ReviewDetails` | `admin.review-details` | Review detail view |

---

### CRM Packages

#### crm/address

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Address\Livewire\Admin\AddressBuilder` | `admin.address-builder` | Address list for entity |
| `Bespoke\Address\Livewire\Admin\AddressDataTable` | `admin.address-data-table` | Address listing table |

#### crm/calendar

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Calendar\Livewire\Admin\CalendarDay` | `admin.calendar-day` | Day view |
| `Bespoke\Calendar\Livewire\Admin\CalendarMonth` | `admin.calendar-month` | Month view with event grid |
| `Bespoke\Calendar\Livewire\Admin\CalendarResource` | `admin.calendar-resource` | Resource allocation view |
| `Bespoke\Calendar\Livewire\Admin\CalendarWeek` | `admin.calendar-week` | Week view with time slots |

#### crm/calendar-event

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\CalendarEvent\Livewire\Admin\CalendarEventBuilder` | `admin.calendar-event-builder` | Event creation/editing |
| `Bespoke\CalendarEvent\Livewire\Admin\CalendarEventModal` | `admin.calendar-event-modal` | Event modal dialog |

#### crm/city

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\City\Livewire\Admin\CityDataTable` | `admin.city-data-table` | City listing table |

#### crm/contact

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Contact\Livewire\Admin\ContactAutoComplete` | `admin.contact-auto-complete` | Contact search autocomplete |
| `Bespoke\Contact\Livewire\Admin\ContactBuilder` | `admin.contact-builder` | Contact list for entity |
| `Bespoke\Contact\Livewire\Admin\ContactCredentials` | `admin.contact-credentials` | User credential management |
| `Bespoke\Contact\Livewire\Admin\ContactDataTable` | `admin.contact-data-table` | Contact listing table |
| `Bespoke\Contact\Livewire\Admin\ContactDetails` | `admin.contact-details` | Contact detail view |
| `Bespoke\Contact\Livewire\Admin\ContactModal` | `admin.contact-modal` | Contact create/edit modal |
| `Bespoke\Contact\Livewire\Admin\ContactModalButton` | `admin.contact-modal-button` | Modal trigger button |

#### crm/county

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\County\Livewire\Admin\CountyDataTable` | `admin.county-data-table` | County listing table |

#### crm/customer

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Customer\Livewire\Admin\CustomerAutoComplete` | `admin.customer-auto-complete` | Customer search autocomplete |
| `Bespoke\Customer\Livewire\Admin\CustomerDataTable` | `admin.customer-data-table` | Customer listing table |
| `Bespoke\Customer\Livewire\Admin\CustomerDetails` | `admin.customer-details` | Customer detail view |
| `Bespoke\Customer\Livewire\Admin\CustomerMarketing` | `admin.customer-marketing` | Marketing source selection |
| `Bespoke\Customer\Livewire\Admin\CustomerModal` | `admin.customer-modal` | Customer create/edit modal |
| `Bespoke\Customer\Livewire\Admin\CustomerModalButton` | `admin.customer-modal-button` | Modal trigger button |

#### crm/customer-package

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\CustomerPackage\Livewire\Admin\CustomerPackageAutoComplete` | `admin.customer-package-auto-complete` | Package search autocomplete |
| `Bespoke\CustomerPackage\Livewire\Admin\CustomerPackageBuilder` | `admin.customer-package-builder` | Package list for customer |
| `Bespoke\CustomerPackage\Livewire\Admin\CustomerPackageDataTable` | `admin.customer-package-data-table` | Package listing table |
| `Bespoke\CustomerPackage\Livewire\Admin\CustomerPackageDetails` | `admin.customer-package-details` | Package details editing |
| `Bespoke\CustomerPackage\Livewire\Admin\CustomerPackageTimeBuilder` | `admin.customer-package-time-builder` | Time entry management |

#### crm/location

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Location\Livewire\LocationAutoComplete` | `location.auto-complete` | Location search autocomplete |

#### crm/project

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Project\Livewire\Admin\ProjectAutoComplete` | `admin.project-auto-complete` | Project search autocomplete |
| `Bespoke\Project\Livewire\Admin\ProjectBuilder` | `admin.project-builder` | Project list for customer |
| `Bespoke\Project\Livewire\Admin\ProjectDataTable` | `admin.project-data-table` | Project listing table |
| `Bespoke\Project\Livewire\Admin\ProjectDetails` | `admin.project-details` | Project details with assignees |

#### crm/region

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Region\Livewire\Admin\RegionDataTable` | `admin.region-data-table` | Region listing table |

#### crm/supplier

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Supplier\Livewire\Admin\SupplierAutoComplete` | `admin.supplier-auto-complete` | Supplier search autocomplete |
| `Bespoke\Supplier\Livewire\Admin\SupplierDataTable` | `admin.supplier-data-table` | Supplier listing table |
| `Bespoke\Supplier\Livewire\Admin\SupplierDetails` | `admin.supplier-details` | Supplier detail view |
| `Bespoke\Supplier\Livewire\Admin\SupplierModal` | `admin.supplier-modal` | Supplier create/edit modal |
| `Bespoke\Supplier\Livewire\Admin\SupplierModalButton` | `admin.supplier-modal-button` | Modal trigger button |

#### crm/task

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Task\Livewire\Admin\TaskAutoComplete` | `admin.task-auto-complete` | Task search autocomplete |
| `Bespoke\Task\Livewire\Admin\TaskBuilder` | `admin.task-builder` | Task list for customer |
| `Bespoke\Task\Livewire\Admin\TaskDataTable` | `admin.task-data-table` | Task listing table |
| `Bespoke\Task\Livewire\Admin\TaskDetails` | `admin.task-details` | Task details with customer/contact |

---

### Custom Packages

#### custom/case-study

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\CaseStudy\Livewire\Admin\CaseStudyDataTable` | `admin.case-study-data-table` | Case study listing table |
| `Bespoke\CaseStudy\Livewire\Frontend\SidebarRecentCaseStudies` | `frontend.sidebar-recent-case-studies` | Recent case studies widget |
| `Bespoke\CaseStudy\Livewire\Frontend\SidebarRelatedCaseStudies` | `frontend.sidebar-related-case-studies` | Related case studies widget |

#### custom/case-study-category

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\CaseStudyCategory\Livewire\Admin\CaseStudyCategoryDataTable` | `admin.case-study-category-data-table` | Case study category table |

---

### Default Packages

#### default/continent

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Continent\Livewire\ContinentDataTable` | `admin.continent-data-table` | Continent listing table |

#### default/cookie

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Cookie\Livewire\CookieButton` | `cookie.button` | Floating cookie consent button |
| `Bespoke\Cookie\Livewire\CookieManager` | `cookie.manager` | Cookie consent modal manager |

#### default/country

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Country\Livewire\Admin\CountryDataTable` | `admin.country-data-table` | Country listing table |

#### default/redirect

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Redirect\Livewire\Admin\RedirectDataTable` | `admin.redirect-data-table` | URL redirect listing table |

#### default/seo

| Class | Alias | Purpose |
|-------|-------|---------|
| `Bespoke\Seo\Livewire\SeoBuilder` | `form.seo-builder` | SEO metadata builder |

---

## Component Patterns

### Data Tables

Standard pattern for entity listing with filtering, sorting, and pagination:

```php
<livewire:admin.entity-data-table />
```

Features:
- Column sorting
- Search filtering
- Pagination
- Bulk actions
- Row actions (view, edit, delete)

### AutoComplete

Standard pattern for entity search/selection:

```php
<livewire:admin.entity-auto-complete
    wire:model="selected_entity_id"
    :customer="$customer"
/>
```

Features:
- Debounced search
- Filtered by context (e.g., customer's contacts only)
- Keyboard navigation

### Modal Components

Standard pattern for create/edit operations:

```php
<livewire:admin.entity-modal-button :entity="$entity" />
<livewire:admin.entity-modal />
```

Features:
- Create and edit modes
- Form validation
- Event emission on save

### Form Components

Shared form inputs used across packages:

```php
<livewire:form.image-upload wire:model="cover_image" />
<livewire:form.wysiwyg wire:model="content" />
<livewire:form.seo-builder :model="$page" />
```

---

## Customising Components

Override a component by publishing config and changing the class:

```php
// config/contact.php
'livewire' => [
    \App\Livewire\CustomContactDataTable::class => 'admin.contact-data-table',
],
```

Or extend the base component:

```php
namespace App\Livewire;

use Bespoke\Contact\Livewire\Admin\ContactDataTable as BaseDataTable;

class CustomContactDataTable extends BaseDataTable
{
    // Add custom columns, filters, etc.
}
```

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-02-04 | Initial documentation |
