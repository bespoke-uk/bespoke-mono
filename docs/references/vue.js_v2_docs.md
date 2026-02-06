### Vue Constructor: Runtime vs. Compiler Usage (JavaScript)

Source: https://v2.vuejs.org/v2/guide/installation

Demonstrates when the Vue compiler is required. The first example requires the compiler because it uses the `template` option with a string. The second example does not require the compiler as it uses a `render` function.

```javascript
new Vue({
  template: '<div>{{ hi }}</div>'
})

new Vue({
  render (h) {
    return h('div', this.hi)
  }
})
```

--------------------------------

### Vue.js Installation via CDN (Production)

Source: https://v2.vuejs.org/v2/guide/installation

For production environments, it's recommended to link to a specific version of Vue.js from a CDN to ensure stability. This version is optimized for speed by stripping warnings.

```html
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.16"></script>
```

--------------------------------

### Vue.js Installation via CDN (Development)

Source: https://v2.vuejs.org/v2/guide/installation

Include Vue.js using a script tag from a CDN for development purposes. This version includes full warnings and debug mode to help catch common mistakes. The `Vue` object will be globally available.

```html
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.16/dist/vue.js"></script>
```

--------------------------------

### Vue.js Installation via NPM

Source: https://v2.vuejs.org/v2/guide/installation

The recommended method for installing Vue.js in large-scale applications using NPM. This command installs the latest stable version of Vue 2, pairing well with module bundlers like Webpack.

```bash
# latest stable
$ npm install vue@^2
```

--------------------------------

### Include Vue.js for Small Projects

Source: https://v2.vuejs.org/v2/guide/comparison

This snippet demonstrates how to include the Vue.js library into an HTML page using a script tag from a CDN. This is a straightforward method for getting started with Vue, especially for smaller projects or prototyping, as it requires no build system setup and can be used directly in production.

```html
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
```

--------------------------------

### Vue.js ES Modules Installation via CDN

Source: https://v2.vuejs.org/v2/guide/installation

This snippet demonstrates how to include Vue.js using a script tag with `type="module"` for environments that support native ES Modules. It points to an ES Modules compatible build.

```html
<script type="module">
  import Vue from 'https://cdn.jsdelivr.net/npm/vue@2.7.16/dist/vue.esm.browser.js'
</script>
```

--------------------------------

### Vue.js Base Component Naming Convention

Source: https://v2.vuejs.org/v2/style-guide

Details the recommended naming convention for base components (presentational, dumb, or pure components) in Vue.js. These components should start with a specific prefix like 'Base', 'App', or 'V' to ensure consistent styling and behavior across the application. Examples show 'bad' generic names and 'good' examples with the recommended prefixes.

```text
components/
|- MyButton.vue
|- VueTable.vue
|- Icon.vue
```

```text
components/
|- BaseButton.vue
|- BaseTable.vue
|- BaseIcon.vue
```

```text
components/
|- AppButton.vue
|- AppTable.vue
|- AppIcon.vue
```

```text
components/
|- VButton.vue
|- VTable.vue
|- VIcon.vue
```

--------------------------------

### Bundle with Browserify and envify for Production

Source: https://v2.vuejs.org/v2/guide/deployment

This command-line example shows how to use Browserify with the `envify` transform to prepare a production build. It sets the `NODE_ENV` to 'production' and pipes the output through `uglifyjs` for minification and dead code elimination.

```bash
NODE_ENV=production browserify -g envify -e main.js | uglifyjs -c -m > build.js
```

--------------------------------

### Define and Register a Vue Component

Source: https://v2.vuejs.org/v2/guide

Demonstrates how to define a new Vue component named 'todo-item' globally using `Vue.component()`. This component has a simple template and is then used within a Vue instance.

```javascript
Vue.component('todo-item', {
  template: '<li>This is a todo</li>'
})

var app = new Vue({...})

```

--------------------------------

### Vue.js Component File Organization

Source: https://v2.vuejs.org/v2/style-guide

Illustrates the recommended practice of placing each Vue.js component in its own file, especially when using a build system. It contrasts the 'bad' example of defining multiple components within a single block with the 'good' examples showing separate .js or .vue files.

```javascript
Vue.component('TodoList', {
  // ...
})

Vue.component('TodoItem', {
  // ...
})
```

```text
components/
|- TodoList.js
|- TodoItem.js
```

```text
components/
|- TodoList.vue
|- TodoItem.vue
```

--------------------------------

### Use a Vue Component in a Template

Source: https://v2.vuejs.org/v2/guide

Shows how to include a previously registered Vue component, 'todo-item', within the template of another component or the main Vue instance. This illustrates basic component composition.

```html
<ol>
  <todo-item></todo-item>
</ol>

```

--------------------------------

### Installing a Vue Plugin

Source: https://v2.vuejs.org/v2/guide/plugins

Demonstrates how to install a Vue.js plugin using `Vue.use()`. This method can be called before initializing a new Vue instance and supports passing options. It also prevents duplicate installations.

```javascript
Vue.use(MyPlugin)

new Vue({
  //... options
})
```

```javascript
Vue.use(MyPlugin, { someOption: true })
```

--------------------------------

### Vue Instance with Data and Component Registration

Source: https://v2.vuejs.org/v2/guide

Combines component definition with props and a Vue instance that provides the data (`groceryList`) for the components. It shows how to mount the Vue instance to a specific DOM element and manage application data.

```javascript
Vue.component('todo-item', {
  props: ['todo'],
  template: '<li>{{ todo.text }}</li>'
})

var app7 = new Vue({
  el: '#app-7',
  data: {
    groceryList: [
      { id: 0, text: 'Vegetables' },
      { id: 1, text: 'Cheese' },
      { id: 2, text: 'Whatever else humans are supposed to eat' }
    ]
  }
})

```

--------------------------------

### Vue.js Single-File Component Filename Casing

Source: https://v2.vuejs.org/v2/style-guide

Explains the convention for naming single-file Vue components, recommending either PascalCase or kebab-case for consistency. It shows 'bad' examples with mixed or lowercase names and 'good' examples using PascalCase and kebab-case.

```text
components/
|- mycomponent.vue
```

```text
components/
|- myComponent.vue
```

```text
components/
|- MyComponent.vue
```

```text
components/
|- my-component.vue
```

--------------------------------

### Vue.js CSS Transition Example

Source: https://v2.vuejs.org/v2/guide/transitions

Demonstrates how to use Vue's `<transition>` component with CSS for enter and leave animations. It applies a 'slide-fade' transition with different easing functions for entering and leaving states. The example includes the Vue instance setup and the necessary CSS.

```html
<div id="example-1">
  <button @click="show = !show">
    Toggle render
  </button>
  <transition name="slide-fade">
    <p v-if="show">hello</p>
  </transition>
</div>
```

```javascript
new Vue({
  el: '#example-1',
  data: {
    show: true
  }
})
```

```css
/* Enter and leave animations can use different */
/* durations and timing functions.              */
.slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
```

--------------------------------

### Vue Application Structure with Multiple Components

Source: https://v2.vuejs.org/v2/guide

Presents an imaginary HTML template structure for a larger Vue application, illustrating how different components (app-nav, app-view, app-sidebar, app-content) can be nested to form a complex UI.

```html
<div id="app">
  <app-nav></app-nav>
  <app-view>
    <app-sidebar></app-sidebar>
    <app-content></app-content>
  </app-view>
</div>

```

--------------------------------

### Load ButterCMS via CDN

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This code demonstrates how to include the ButterCMS library in your Vue.js project using a CDN link. This method is an alternative to package installation and is useful for quick setups or when not using a module bundler.

```html
<script src="https://cdnjs.buttercms.com/buttercms-1.1.0.min.js"></script>
```

--------------------------------

### Vue CLI Project Creation with TypeScript

Source: https://v2.vuejs.org/v2/guide/typescript

These shell commands guide the user through installing the Vue CLI and creating a new project that is pre-configured for TypeScript. The process involves choosing manual feature selection to include TypeScript support.

```bash
# 1. Install Vue CLI, if it's not already installed
npm install --global @vue/cli

# 2. Create a new project, then choose the "Manually select features" option
vue create my-project-name
```

--------------------------------

### Browserify Configuration for Vue Runtime-only (JSON)

Source: https://v2.vuejs.org/v2/guide/installation

Configures Browserify to use the runtime-only build of Vue by specifying an alias in the `package.json` file under the 'browser' key. This is typically used with older bundlers.

```json
{
  // ...
  "browser": {
    "vue": "vue/dist/vue.common.js"
  }
}
```

--------------------------------

### Include Vue.js Development Version via CDN

Source: https://v2.vuejs.org/v2/guide

This snippet shows how to include the development version of Vue.js (version 2) in an HTML file using a CDN. This version includes helpful console warnings for debugging purposes. It is suitable for development environments.

```html
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
```

--------------------------------

### Vue.js: Declarative Rendering with Template Syntax

Source: https://v2.vuejs.org/v2/guide

Demonstrates basic Vue.js declarative rendering using template syntax to display data. It binds a message to a div element. Requires Vue.js library.

```html
<div id="app">  
  {{ message }}  
</div>  
```

```javascript
var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
})
```

--------------------------------

### Initializing Data Properties (JavaScript)

Source: https://v2.vuejs.org/v2/guide/instance

Provides an example of how to initialize various data properties for a Vue instance. It's crucial to define properties upfront for reactivity.

```javascript
data: {
  newTodoText: '',
  visitCount: 0,
  hideCompletedTodos: false,
  todos: [],
  error: null
}
```

--------------------------------

### Configure Browserify with Grunt and envify for Production

Source: https://v2.vuejs.org/v2/guide/deployment

This Grunt configuration uses `grunt-browserify` and the `envify` transform to prepare a production build. It customizes the Browserify setup to include `vueify` and `envify`, ensuring `NODE_ENV` is set to 'production' for Vue.js.

```javascript
// Use the envify custom module to specify environment variables
var envify = require('envify/custom')

browserify: {
  dist: {
    options: {
      // Function to deviate from grunt-browserify's default order
      configure: b => b
        .transform('vueify')
        .transform(
          // Required in order to process node_modules files
          { global: true },
          envify({ NODE_ENV: 'production' })
        )
        .bundle()
    }
  }
}
```

--------------------------------

### Writing a Vue Plugin with an Install Method

Source: https://v2.vuejs.org/v2/guide/plugins

Illustrates the structure of a Vue.js plugin, which must expose an `install` method. This method receives the `Vue` constructor and optional options, allowing the plugin to add global methods, directives, mixins, or instance methods.

```javascript
MyPlugin.install = function (Vue, options) {
  // 1. add global method or property
  Vue.myGlobalMethod = function () {
    // some logic ...
  }

  // 2. add a global asset
  Vue.directive('my-directive', {
    bind (el, binding, vnode, oldVnode) {
      // some logic ...
    }
    ...
  })

  // 3. inject some component options
  Vue.mixin({
    created: function () {
      // some logic ...
    }
    ...
  })

  // 4. add an instance method
  Vue.prototype.$myMethod = function (methodOptions) {
    // some logic ...
  }
}
```

--------------------------------

### Vue.js: List Rendering with v-for

Source: https://v2.vuejs.org/v2/guide

Demonstrates rendering lists of data in Vue.js using the v-for directive. It iterates over an array of objects to create list items. Requires Vue.js library.

```html
<div id="app-4">  
  <ol>  
    <li v-for="todo in todos">  
      {{ todo.text }}  
    </li>  
  </ol>  
</div>  
```

```javascript
var app4 = new Vue({
  el: '#app-4',
  data: {
    todos: [
      { text: 'Learn JavaScript' },
      { text: 'Learn Vue' },
      { text: 'Build something awesome' }
    ]
  }
})
```

--------------------------------

### Rollup Production Mode Configuration (JavaScript)

Source: https://v2.vuejs.org/v2/guide/installation

Configures Rollup to replace `process.env.NODE_ENV` with 'production' using `rollup-plugin-replace`. This ensures Vue runs in production mode and helps in code stripping by minifiers.

```javascript
const replace = require('rollup-plugin-replace')

rollup({
  // ...
  plugins: [
    replace({
      'process.env.NODE_ENV': JSON.stringify('production')
    })
  ]
}).then(...)
```

--------------------------------

### Simulate replace: false with render function

Source: https://v2.vuejs.org/v2/guide/migration

An alternative to simulating `replace: false` is to use a render function. This example demonstrates creating a wrapper `div` with specific attributes.

```javascript
new Vue({
  el: '#app',
  render: function (h) {
    h('div', {
      attrs: {
        id: 'app',
      }
    }, /* ... */)
  }
})
```

--------------------------------

### Vue Router Initialization: Old vs. New

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Demonstrates the shift from the `router.start` initialization method in older Vue Router versions to passing the router as a property to a Vue instance in newer versions. This covers both standard and runtime-only Vue builds.

```javascript
router.start({
  template: '<router-view></router-view>'
}, '#app')
```

```javascript
new Vue({
  el: '#app',
  router: router,
  template: '<router-view></router-view>'
})
```

```javascript
new Vue({
  el: '#app',
  router: router,
  render: h => h('router-view')
})
```

--------------------------------

### Pass Data to Component using v-bind and v-for

Source: https://v2.vuejs.org/v2/guide

Demonstrates using `v-for` to iterate over a list and `v-bind:todo` to pass individual items as props to the 'todo-item' component. This enables dynamic rendering of lists based on parent data.

```html
<div id="app-7">
  <ol>
    <todo-item
      v-for="item in groceryList"
      v-bind:todo="item"
      v-bind:key="item.id"
    ></todo-item>
  </ol>
</div>

```

--------------------------------

### Rollup Alias Configuration for Vue Runtime-only (JavaScript)

Source: https://v2.vuejs.org/v2/guide/installation

Configures Rollup to use the runtime-only build of Vue by using the `rollup-plugin-alias`. This is recommended when using pre-compiled templates.

```javascript
const alias = require('rollup-plugin-alias')

rollup({
  // ...
  plugins: [
    alias({
      'vue': require.resolve('vue/dist/vue.esm.js')
    })
  ]
})
```

--------------------------------

### Define Vue Component with Props

Source: https://v2.vuejs.org/v2/guide

Illustrates how to define a Vue component ('todo-item') that accepts a prop named 'todo'. This allows the component to receive dynamic data from its parent, making the rendered output customizable.

```javascript
Vue.component('todo-item', {
  props: ['todo'],
  template: '<li>{{ todo.text }}</li>'
})

```

--------------------------------

### Install ButterCMS Package for Vue.js

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This snippet shows how to install the ButterCMS package as a dependency for your Vue.js project using npm. This is the first step to integrating ButterCMS content into your application.

```bash
npm install buttercms --save
```

--------------------------------

### Vue.js Private Property Naming Convention

Source: https://v2.vuejs.org/v2/style-guide

Demonstrates the recommended convention for naming private properties in Vue.js plugins or mixins to avoid conflicts with Vue's internal properties and other authors' code. It shows the 'bad' examples using single underscores or dollar signs, and the 'good' examples using a combination of underscore and a scoped prefix.

```javascript
var myGreatMixin = {
  // ...
  methods: {
    update: function () {
      // ...
    }
  }
}
```

```javascript
var myGreatMixin = {
  // ...
  methods: {
    _update: function () {
      // ...
    }
  }
}
```

```javascript
var myGreatMixin = {
  // ...
  methods: {
    $update: function () {
      // ...
    }
  }
}
```

```javascript
var myGreatMixin = {
  // ...
  methods: {
    $_update: function () {
      // ...
    }
  }
}
```

```javascript
var myGreatMixin = {
  // ...
  methods: {
    $_myGreatMixin_update: function () {
      // ...
    }
  }
}
```

```javascript
// Even better!
var myGreatMixin = {
  // ...
  methods: {
    publicMethod() {
      // ...
      myPrivateFunction()
    }
  }
}

function myPrivateFunction() {
  // ...
}

export default myGreatMixin
```

--------------------------------

### Vue.js: Handling Click Events with v-on

Source: https://v2.vuejs.org/v2/guide

Shows how to handle user interactions in Vue.js using the v-on directive to attach event listeners, specifically a click event to reverse a message. Requires Vue.js library.

```html
<div id="app-5">  
  <p>{{ message }}</p>  
  <button v-on:click="reverseMessage">Reverse Message</button>  
</div>  
```

```javascript
var app5 = new Vue({
  el: '#app-5',
  data: {
    message: 'Hello Vue.js!'
  },
  methods: {
    reverseMessage: function () {
      this.message = this.message.split('').reverse().join('')
    }
  }
})
```

--------------------------------

### Parcel Alias Configuration for Vue Runtime-only (JSON)

Source: https://v2.vuejs.org/v2/guide/installation

Configures Parcel to use the runtime-only build of Vue by specifying an alias in the `package.json` file under the 'alias' key. This helps in reducing the final bundle size by excluding the compiler.

```json
{
  // ...
  "alias": {
    "vue" : "./node_modules/vue/dist/vue.common.js"
  }
}
```

--------------------------------

### Vue.js: Attribute Binding with v-bind

Source: https://v2.vuejs.org/v2/guide

Shows how to use the v-bind directive in Vue.js to dynamically bind element attributes, such as the 'title' attribute, to data properties. Requires Vue.js library.

```html
<div id="app-2">  
  <span v-bind:title="message">  
    Hover your mouse over me for a few seconds  
    to see my dynamically bound title!  
  </span>  
</div>  
```

```javascript
var app2 = new Vue({
  el: '#app-2',
  data: {
    message: 'You loaded this page on ' + new Date().toLocaleString()
  }
})
```

--------------------------------

### Webpack DefinePlugin for Production Mode (JavaScript)

Source: https://v2.vuejs.org/v2/guide/installation

Configures Webpack (versions 3 and earlier) to use DefinePlugin to set `process.env.NODE_ENV` to 'production'. This allows Vue to run in production mode and enables minifiers to remove development-specific code.

```javascript
var webpack = require('webpack')

module.exports = {
  // ...
  plugins: [
    // ...
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify('production')
      }
    })
  ]
}
```

--------------------------------

### Initialize ButterCMS with API Token (CommonJS)

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This JavaScript snippet shows how to initialize the ButterCMS client using the CommonJS module system and your unique API token. This is typically used in Node.js environments or older browser setups.

```javascript
var butter = require('buttercms')('your_api_token');
```

--------------------------------

### Webpack Alias Configuration for Vue Runtime-only (JavaScript)

Source: https://v2.vuejs.org/v2/guide/installation

Configures Webpack to use the runtime-only build of Vue by creating an alias for 'vue'. This is useful when templates in *.vue files are pre-compiled by `vue-loader` or `vueify`.

```javascript
module.exports = {
  // ...
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js' // 'vue/dist/vue.common.js' for webpack 1
    }
  }
}
```

--------------------------------

### Vue.js: Conditional Rendering with v-if

Source: https://v2.vuejs.org/v2/guide

Illustrates conditional rendering in Vue.js using the v-if directive. An element is rendered only if the bound data property is true. Requires Vue.js library.

```html
<div id="app-3">  
  <span v-if="seen">Now you see me</span>  
</div>  
```

```javascript
var app3 = new Vue({
  el: '#app-3',
  data: {
    seen: true
  }
})
```

--------------------------------

### Replacing Vue Resource with Axios in Vue

Source: https://v2.vuejs.org/v2/cookbook/adding-instance-properties

This example shows how to integrate Axios into a Vue project and alias it to `Vue.prototype.$http`. This allows developers to continue using the familiar `this.$http` syntax for making API requests, similar to the retired Vue Resource library. It includes the CDN link for Axios and a basic Vue instance setup.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.15.2/axios.js"></script>

<div id="app">
  <ul>
    <li v-for="user in users">{{ user.name }}</li>
  </ul>
</div>
```

```javascript
Vue.prototype.$http = axios
```

```javascript
new Vue({
  el: '#app',
  data: {
    users: []
  },
  created() {
    var vm = this
    this.$http
      .get('https://jsonplaceholder.typicode.com/users')
      .then(function(response) {
        vm.users = response.data
      })
  }
})
```

--------------------------------

### Query Array Syntax: [] removed

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Illustrates the removal of the `[]` syntax for array query parameters. Shows the new format and provides a computed property example to ensure `$route.query.users` is always an array.

```javascript
export default {
  // ...
  computed: {
    // users will always be an array
    users () {
      const users = this.$route.query.users
      return Array.isArray(users) ? users : [users]
    }
  }
}
```

--------------------------------

### Vue.js v2: Recommended Component/Instance Options Order

Source: https://v2.vuejs.org/v2/style-guide

This JavaScript code demonstrates the recommended order for component options in Vue.js v2. Following this order improves code readability and maintainability by categorizing options logically.

```javascript
props: {
  value: {
    type: String,
    required: true
  },

  focused: {
    type: Boolean,
    default: false
  },

  label: String,
  icon: String
},

computed: {
  formattedValue: function () {
    // ...
  },

  inputClasses: function () {
    // ...
  }
}


```

```javascript
// No spaces are also fine, as long as the component
// is still easy to read and navigate.
props: {
  value: {
    type: String,
    required: true
  },
  focused: {
    type: Boolean,
    default: false
  },
  label: String,
  icon: String
},
computed: {
  formattedValue: function () {
    // ...
  },
  inputClasses: function () {
    // ...
  }
}


```

--------------------------------

### Vue.js Main App Initialization

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This is the main JavaScript file for a Vue.js application. It configures Vue, imports the root App component, and initializes the Vue instance, mounting it to the '#app' element in the HTML.

```javascript
// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from "vue";
import App from "./App";

Vue.config.productionTip = false;

/* eslint-disable no-new */
new Vue({
  el: "#app",
  components: { App },
  template: "<App/>"
});
```

--------------------------------

### Simulate replace: false with wrapper element

Source: https://v2.vuejs.org/v2/guide/migration

The `replace: false` option is removed. To achieve similar behavior, wrap your root component in an element. This example shows using a `div` with the ID 'app' for wrapping.

```javascript
new Vue({
  el: '#app',
  template: '<div id="app"> ... </div>'
})
```

--------------------------------

### Create a Vue Instance (JavaScript)

Source: https://v2.vuejs.org/v2/guide/instance

Demonstrates the basic process of creating a Vue instance using the `Vue` constructor and passing an options object. This is the entry point for any Vue application.

```javascript
var vm = new Vue({
  // options
})
```

--------------------------------

### Vue 2 Modal Component Example

Source: https://v2.vuejs.org/v2/examples/modal

An example of a modal component in Vue.js, demonstrating features like component creation, prop passing, content insertion, and transitions. It includes a button to trigger a 'close' event.

```html
<button class="modal-default-button" @click="$emit('close')">

```

--------------------------------

### Vue.js CSS Animation Example

Source: https://v2.vuejs.org/v2/guide/transitions

Illustrates using Vue's `<transition>` component with CSS animations. This example uses a 'bounce' animation for entering and reversing the animation for leaving. It includes the Vue instance configuration and the CSS keyframes and animation classes.

```html
<div id="example-2">
  <button @click="show = !show">Toggle show</button>
  <transition name="bounce">
    <p v-if="show">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris facilisis enim libero, at lacinia diam fermentum id. Pellentesque habitant morbi tristique senectus et netus.</p>
  </transition>
</div>
```

```javascript
new Vue({
  el: '#example-2',
  data: {
    show: true
  }
})
```

```css
.bounce-enter-active {
  animation: bounce-in .5s;
}
.bounce-leave-active {
  animation: bounce-in .5s reverse;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.5);
  }
  100% {
    transform: scale(1);
  }
}
```

--------------------------------

### Configure Browserify with Gulp and envify for Production

Source: https://v2.vuejs.org/v2/guide/deployment

This Gulp configuration demonstrates setting up Browserify to include the `envify` transform globally. This ensures that `process.env.NODE_ENV` is correctly set to 'production' during the bundling process, allowing Vue.js to enter production mode.

```javascript
// Use the envify custom module to specify environment variables
var envify = require('envify/custom')

browserify(browserifyOptions)
  .transform(vueify)
  .transform(
    // Required in order to process node_modules files
    { global: true },
    envify({ NODE_ENV: 'production' })
  )
  .bundle()
```

--------------------------------

### Vue Component Setup for Transitions

Source: https://v2.vuejs.org/v2/guide/transitions

Sets up a Vue instance with dynamic components 'v-a' and 'v-b', controlled by the 'view' data property. This is used in conjunction with the <transition> component for animating component changes.

```javascript
new Vue({
  el: '#transition-components-demo',
  data: {
    view: 'v-a'
  },
  components: {
    'v-a': {
      template: '<div>Component A</div>'
    },
    'v-b': {
      template: '<div>Component B</div>'
    }
  }
})
```

--------------------------------

### Vuex Plugins: Replacing Middlewares

Source: https://v2.vuejs.org/v2/guide/migration-vuex

Shows how Vuex middlewares have been replaced by plugins. A plugin is a function that receives the store and can subscribe to mutation events.

```javascript
const myPlugins = store => {
  store.subscribe('mutation', (mutation, state) => {
    // Do something...
  })
}
```

--------------------------------

### Vue.js: Two-Way Binding with v-model

Source: https://v2.vuejs.org/v2/guide

Demonstrates two-way data binding in Vue.js using the v-model directive. It synchronizes input field values with the component's data. Requires Vue.js library.

```html
<div id="app-6">  
  <p>{{ message }}</p>  
  <input v-model="message">
</div>  
```

```javascript
var app6 = new Vue({
  el: '#app-6',
  data: {
    message: 'Hello Vue!'
  }
})
```

--------------------------------

### Vue Single-File Component Example (.vue)

Source: https://v2.vuejs.org/v2/guide/single-file-components

Demonstrates the structure of a Vue.js single-file component, including template, script, and style sections. This format allows for complete syntax highlighting, CommonJS modules, and component-scoped CSS, and supports preprocessors.

```vue
<template>
  <div>This will be pre-compiled</div>
</template>
<script src="./my-component.js"></script>
<style src="./my-component.css"></style>

```

--------------------------------

### Vue 2 Lifecycle Hook: Replacing `attached`

Source: https://v2.vuejs.org/v2/guide/migration

The `attached` lifecycle hook has been removed in Vue 2. This example demonstrates how to achieve similar functionality using `mounted` and `$nextTick` to ensure the DOM is ready.

```javascript
mounted: function () {
  this.$nextTick(function () {
    doSomething()
  })
}
```

--------------------------------

### Access Vue.js Version Information

Source: https://v2.vuejs.org/v2/api

Provides the installed version of Vue.js as a string. This is useful for implementing version-specific logic or ensuring compatibility with community plugins and components.

```javascript
var version = Number(Vue.version.split('.')[0])

if (version === 2) {
  // Vue v2.x.x
} else if (version === 1) {
  // Vue v1.x.x
} else {
  // Unsupported versions of Vue
}
```

--------------------------------

### Vue Component Word Order (General to Specific)

Source: https://v2.vuejs.org/v2/style-guide

Component names should follow a 'general to specific' word order, starting with the highest-level concepts and ending with descriptive modifiers. This alphabetical sorting in editors groups related components effectively.

```text
components/
|- SearchButtonClear.vue
|- SearchButtonRun.vue
|- SearchInputQuery.vue
|- SearchInputExcludeGlob.vue
|- SettingsCheckboxTerms.vue
|- SettingsCheckboxLaunchOnStartup.vue
```

--------------------------------

### Vue.js component wrapper for module export and auto-install

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

This JavaScript code serves as a wrapper for a Vue.js Single File Component (SFC). It provides an 'install' function for Vue.use(), attempts to auto-install the component if Vue is globally available, and exports the component for module usage.

```javascript
// Import vue component
import component from './my-component.vue';

// Declare install function executed by Vue.use()
export function install(Vue) {
	if (install.installed) return;
	install.installed = true;
	Vue.component('MyComponent', component);
}

// Create module definition for Vue.use()
const plugin = {
	install,
};

// Auto-install when vue is found (eg. in browser via <script> tag)
let GlobalVue = null;
if (typeof window !== 'undefined') {
	GlobalVue = window.Vue;
} else if (typeof global !== 'undefined') {
	GlobalVue = global.Vue;
}
if (GlobalVue) {
	GlobalVue.use(plugin);
}

// To allow use as module (npm/webpack/etc.) export component
export default component;
```

--------------------------------

### Initialize ButterCMS with API Token (CDN)

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This JavaScript code shows how to initialize the ButterCMS client after loading it via CDN. It uses the globally available `Butter` object and your API token to set up the client for use in the browser.

```html
<script src="https://cdnjs.buttercms.com/buttercms-1.1.0.min.js"></script>
<script>
  var butter = Butter('your_api_token');
</script>
```

--------------------------------

### Vue Router Dynamic Route Generation and Addition

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Shows how to programmatically generate routes using `routes.push` and how to add new routes after the router has been instantiated by replacing the router's matcher. This replaces the functionality of the removed `router.on`.

```javascript
// Normal base routes
var routes = [
  // ...
]

// Dynamically generated routes
marketingPages.forEach(function (page) {
  routes.push({
    path: '/marketing/' + page.slug,
    component: {
      extends: MarketingComponent,
      data: function () {
        return { page: page }
      }
    }
  })
})

var router = new Router({
  routes: routes
})
```

```javascript
router.match = createMatcher(
  [{ 
    path: '/my/new/path',
    component: MyComponent
  }].concat(router.options.routes)
)
```

--------------------------------

### Multi-column Sorting with lodash `orderBy` (JavaScript)

Source: https://v2.vuejs.org/v2/guide/migration

Demonstrates sorting an array of objects by multiple columns using lodash's `orderBy` function. This example specifies sorting by 'name' in ascending order and 'last_login' in descending order. It requires the lodash library to be included.

```javascript
_.orderBy(this.users, ['name', 'last_login'], ['asc', 'desc'])
```

--------------------------------

### Named Parameters: '*' replaced with ':param+'

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Details the syntax change for matching one or more named parameters in routes. The previous `*` syntax is replaced with the more specific `:param+`.

```regex
/category/*tags
```

```regex
/category/:tags+
```

--------------------------------

### Configure KeyCodes with Vue.config.keyCodes

Source: https://v2.vuejs.org/v2/guide/migration

Replaces the deprecated `Vue.directive('on').keyCodes` with the more concise `Vue.config.keyCodes`. This allows direct mapping of key codes to names, simplifying keyboard event handling.

```javascript
// enable v-on:keyup.f1  
Vue.config.keyCodes.f1 = 112  

```

--------------------------------

### Vue Provide/Inject Basic Example

Source: https://v2.vuejs.org/v2/api

Shows the basic usage of 'provide' and 'inject' in Vue.js (v2.2.0+). The 'provide' option allows an ancestor component to make data available to its descendants. The 'inject' option allows descendants to access this data.

```javascript
// parent component providing 'foo'
var Provider = {
  provide: {
    foo: 'bar'
  },
  // ...
}

// child component injecting 'foo'
var Child = {
  inject: ['foo'],
  created () {
    console.log(this.foo) // => "bar"
  }
  // ...
}
```

--------------------------------

### Replace vm.$before with insertBefore

Source: https://v2.vuejs.org/v2/guide/migration

The `vm.$before` method is no longer available. Use the native DOM API's `insertBefore` method. The usage is `myElement.parentNode.insertBefore(vm.$el, myElement)`.

```javascript
myElement.parentNode.insertBefore(vm.$el, myElement)
```

--------------------------------

### Vue Component Data Initialization

Source: https://v2.vuejs.org/v2/style-guide

Demonstrates how to initialize component data in Vue.js. Returning data from a function ensures each component instance has its own unique data object, preventing state conflicts when components are reused. This is crucial for maintaining independent component states.

```javascript
data: function () {
  return {
    listTitle: '',
    todos: []
  }
}
```

```javascript
export default {
  data () {
    return {
      foo: 'bar'
    }
  }
}
```

```javascript
new Vue({
  data: {
    foo: 'bar'
  }
})
```

--------------------------------

### Vuex store.watch: String Path to Function

Source: https://v2.vuejs.org/v2/guide/migration-vuex

Demonstrates the change in Vuex's `store.watch` method, requiring a function to return the observed property instead of a string path. This provides more control over reactive property observation.

```javascript
store.watch('user.notifications', callback)
```

```javascript
store.watch(
  // When the returned result changes...
  function (state) {
    return state.user.notifications
  },
  // Run this callback
  callback
)
```

--------------------------------

### Serve Vue CLI Application with npm

Source: https://v2.vuejs.org/v2/cookbook/debugging-in-vscode

This command is used to serve a Vue CLI application from the root folder using npm. It starts the development server, allowing the application to be accessed in the browser and debugged with VS Code.

```bash
npm run serve
```

--------------------------------

### JavaScript-Only Transition with Velocity.js Example

Source: https://v2.vuejs.org/v2/guide/transitions

Example demonstrating a JavaScript-only transition using Velocity.js. It disables CSS detection with `v-bind:css="false"` and utilizes `enter` and `leave` hooks with `done` callbacks for animation completion. Requires Velocity.js library.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.3/velocity.min.js"></script>

<div id="example-4">
  <button @click="show = !show">
    Toggle
  </button>
  <transition
    v-on:before-enter="beforeEnter"
    v-on:enter="enter"
    v-on:leave="leave"
    v-bind:css="false"
  >
    <p v-if="show">
      Demo
    </p>
  </transition>
</div>
```

```javascript
new Vue({
  el: '#example-4',
  data: {
    show: false
  },
  methods: {
    beforeEnter: function (el) {
      el.style.opacity = 0
      el.style.transformOrigin = 'left'
    },
    enter: function (el, done) {
      Velocity(el, { opacity: 1, fontSize: '1.4em' }, { duration: 300 })
      Velocity(el, { fontSize: '1em' }, { complete: done })
    },
    leave: function (el, done) {
      Velocity(el, { translateX: '15px', rotateZ: '50deg' }, { duration: 600 })
      Velocity(el, { rotateZ: '100deg' }, { loop: 2 })
      Velocity(el, {
        rotateZ: '45deg',
        translateY: '30px',
        translateX: '30px',
        opacity: 0
      }, { complete: done })
    }
  }
})
```

--------------------------------

### Vue v-for without Key (Bad Practice)

Source: https://v2.vuejs.org/v2/style-guide

Shows an example of using `v-for` without a `key` attribute in Vue.js. This can lead to unpredictable behavior and issues with component state, particularly when the list is modified, sorted, or animated. Vue may not be able to efficiently track and update list items, potentially causing bugs.

```html
<ul>
  <li v-for="todo in todos">
    {{ todo.text }}
  </li>
</ul>
```

--------------------------------

### Vue Component with Slot for Content Distribution

Source: https://v2.vuejs.org/v2/guide/components

This snippet demonstrates how to create a Vue component ('alert-box') that accepts and renders content passed to it via a slot. It shows the component's template with a slot element and an example of how to use the component with content.

```html
<alert-box>
  Something bad happened.
</alert-box>
```

```javascript
Vue.component('alert-box', {
  template: '
    <div class="demo-alert-box">
      <strong>Error!</strong>
      <slot></slot>
    </div>
  '
})
```

--------------------------------

### Fetch API Data with Axios in Vue.js (Base Example)

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This snippet shows the basic implementation of fetching data from an API using Axios within a Vue.js application. It initializes a 'info' data property and uses the 'mounted' lifecycle hook to make a GET request. The response is then stored in 'this.info'. Dependencies include Vue.js and Axios.

```javascript
new Vue({
  el: '#app',
  data () {
    return {
      info: null
    }
  },
  mounted () {
    axios
      .get('https://api.coindesk.com/v1/bpi/currentprice.json')
      .then(response => (this.info = response))
  }
})
```

--------------------------------

### Include deepstream.io Client Library in HTML

Source: https://v2.vuejs.org/v2/examples/deepstream

This snippet shows how to include the deepstream.io client JavaScript library using a CDN link in an HTML file. This is a prerequisite for using deepstreamHub's realtime features in a web application.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/deepstream.io-client-js/2.1.1/deepstream.js"></script>
```

--------------------------------

### Vue.js: Anchored Heading Component Example

Source: https://v2.vuejs.org/v2/guide/render-function

A complete Vue.js component example demonstrating the use of createElement within a render function to create an anchored heading. It includes logic to generate an ID from the heading text and create a link.

```javascript
var getChildrenTextContent = function (children) {
  return children.map(function (node) {
    return node.children
      ? getChildrenTextContent(node.children)
      : node.text
  }).join('')
}

Vue.component('anchored-heading', {
  render: function (createElement) {
    // create kebab-case id
    var headingId = getChildrenTextContent(this.$slots.default)
      .toLowerCase()
      .replace(/\W+/g, '-')
      .replace(/(^-|-$)/g, '')

    return createElement(
      'h' + this.level,
      [
        createElement('a', {
          attrs: {
            name: headingId,
            href: '#' + headingId
          }
        }, this.$slots.default)
      ]
    )
  },
  props: {
    level: {
      type: Number,
      required: true
    }
  }
})
```

--------------------------------

### Vue List Transition Setup

Source: https://v2.vuejs.org/v2/guide/transitions

Configures a Vue instance to manage a list of items with add and remove functionality. It utilizes the <transition-group> component for animating individual list item changes.

```javascript
new Vue({
  el: '#list-demo',
  data: {
    items: [1,2,3,4,5,6,7,8,9],
    nextNum: 10
  },
  methods: {
    randomIndex: function () {
      return Math.floor(Math.random() * this.items.length)
    },
    add: function () {
      this.items.splice(this.randomIndex(), 0, this.nextNum++)
    },
    remove: function () {
      this.items.splice(this.randomIndex(), 1)
    },
  }
})
```

--------------------------------

### Dockerfile for Vue.js App with http-server

Source: https://v2.vuejs.org/v2/cookbook/dockerize-vuejs-app

This Dockerfile sets up an environment to build and serve a Vue.js application using the 'http-server' package. It installs dependencies, builds the app, and exposes port 8080 for access. It's suitable for simple deployments and prototyping.

```dockerfile
FROM node:lts-alpine  
  
# install simple http server for serving static content  
RUN npm install -g http-server  
  
# make the 'app' folder the current working directory  
WORKDIR /app  
  
# copy both 'package.json' and 'package-lock.json' (if available)  
COPY package*.json ./
  
# install project dependencies  
RUN npm install  
  
# copy project files and folders to the current working directory (i.e. 'app' folder)  
COPY . .
  
# build app for production with minification  
RUN npm run build  
  
EXPOSE 8080  
CMD [ "http-server", "dist" ]  

```

--------------------------------

### Vue.js Custom Transition Classes Example

Source: https://v2.vuejs.org/v2/guide/transitions

Shows how to apply custom CSS classes for transitions in Vue.js using attributes like `enter-active-class` and `leave-active-class`. This example integrates with the Animate.css library to apply 'tada' and 'bounceOutRight' animations during enter and leave states, respectively.

```html
<link href="https://cdn.jsdelivr.net/npm/animate.css@3.5.1" rel="stylesheet" type="text/css">

<div id="example-3">
  <button @click="show = !show">
    Toggle render
  </button>
  <transition
    name="custom-classes-transition"
    enter-active-class="animated tada"
    leave-active-class="animated bounceOutRight"
  >
    <p v-if="show">hello</p>
  </transition>
</div>
```

```javascript
new Vue({
  el: '#example-3',
  data: {
    show: true
  }
})
```

--------------------------------

### Vue.js: State Management with Vuex (Good Practice - Store Module)

Source: https://v2.vuejs.org/v2/style-guide

This code snippet shows the recommended way to manage state in Vue.js using Vuex. It defines a Vuex module for managing a list of todos, including state, mutations, and actions. This approach provides a centralized, organized, and debuggable state management solution.

```javascript
// store/modules/todos.js
export default {
  state: {
    list: []
  },
  mutations: {
    REMOVE_TODO (state, todoId) {
      state.list = state.list.filter(todo => todo.id !== todoId);
    }
  },
  actions: {
    removeTodo ({ commit, state }, todo) {
      commit('REMOVE_TODO', todo.id);
    }
  }
};
```

--------------------------------

### HTML Structure for Vue.js Application

Source: https://v2.vuejs.org/v2/examples

Basic HTML file structure for a Vue.js application, including a link to an external CSS stylesheet. This is a common setup for front-end projects using Vue.

```html
<link rel="stylesheet" type="text/css" href="/style.css" />
```

--------------------------------

### Configure Vue Router for Blog Navigation

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

Sets up routes for the blog home page ('/blog/') and individual blog posts ('/blog/:slug') using Vue Router. It imports necessary components and configures the router instance.

```javascript
import Vue from 'vue'
import Router from 'vue-router'
import BlogHome from '@/components/BlogHome'
import BlogPost from '@/components/BlogPost'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/blog/',
      name: 'blog-home',
      component: BlogHome
    },
    {
      path: '/blog/:slug',
      name: 'blog-post',
      component: BlogPost
    }
  ]
})
```

--------------------------------

### Vue Tree View Component Implementation

Source: https://v2.vuejs.org/v2/examples/tree-view

A simple tree view component in Vue.js that demonstrates recursive component usage. This example allows users to interact with list items, turning them into folders upon double-clicking. It's a foundational piece for building hierarchical data displays.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vue Tree View Example</title>
    <style>
        /* Basic styling for the tree view */
        .tree-node {
            cursor: pointer;
            padding: 5px;
        }
        .folder::before {
            content: '\1F4C1 '; /* Folder emoji */
        }
        .file::before {
            content: '\1F4C4 '; /* File emoji */
        }
    </style>
</head>
<body>
    <div id="app">
        <tree-node :node="treeData"></tree-node>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script>
        Vue.component('tree-node', {
            template: '#tree-node-template',
            props: ['node'],
            methods: {
                toggleFolder: function(node) {
                    if (node.isFolder) {
                        node.isOpen = !node.isOpen;
                    }
                },
                makeFolder: function(node) {
                    if (!node.isFolder) {
                        node.isFolder = true;
                        node.isOpen = true;
                    }
                }
            }
        });

        new Vue({
            el: '#app',
            data: {
                treeData: {
                    name: 'Root',
                    isFolder: true,
                    isOpen: true,
                    children: [
                        { name: 'Folder 1', isFolder: true, isOpen: false, children: [
                            { name: 'File 1.txt', isFolder: false },
                            { name: 'File 2.doc', isFolder: false }
                        ]},
                        { name: 'File 3.pdf', isFolder: false },
                        { name: 'Another Folder', isFolder: true, isOpen: true, children: [
                            { name: 'Sub File.jpg', isFolder: false },
                            { name: 'Sub Folder', isFolder: true, isOpen: false, children: [
                                { name: 'Deep File.png', isFolder: false }
                            ]}
                        ]}
                    ]
                }
            }
        });
    </script>

    <script type="text/x-template" id="tree-node-template">
        <div>
            <span @dblclick="makeFolder(node)" @click="toggleFolder(node)" :class="{'folder': node.isFolder, 'file': !node.isFolder}" class="tree-node">
                {{ node.name }}
            </span>
            <div v-if="node.isFolder && node.isOpen" style="margin-left: 20px;">
                <tree-node v-for="(child, index) in node.children" :key="index" :node="child"></tree-node>
            </div>
        </div>
    </script>

    <p>(You can double click on an item to turn it into a folder.)</p>
</body>
</html>
```

--------------------------------

### Vue Dynamic Functional Component Example

Source: https://v2.vuejs.org/v2/guide/render-function

A practical example of a functional component (`smart-list`) that dynamically renders different list components based on the provided props (`items`, `isOrdered`). This highlights the use of `context.props` and conditional rendering.

```javascript
var EmptyList = { /* ... */ }
var TableList = { /* ... */ }
var OrderedList = { /* ... */ }
var UnorderedList = { /* ... */ }
  
Vue.component('smart-list', {
  functional: true,
  props: {
    items: {
      type: Array,
      required: true
    },
    isOrdered: Boolean
  },
  render: function (createElement, context) {
    function appropriateListComponent () {
      var items = context.props.items

      if (items.length === 0)           return EmptyList
      if (typeof items[0] === 'object') return TableList
      if (context.props.isOrdered)      return OrderedList

      return UnorderedList
    }

    return createElement(
      appropriateListComponent(),
      context.data,
      context.children
    )
  }
})
```

--------------------------------

### Scoped Slot Example with `<todo-list>` Component

Source: https://v2.vuejs.org/v2/guide/components-slots

Provides a practical example of using scoped slots with a `<todo-list>` component. It demonstrates how to iterate over todos and display them conditionally based on their `isComplete` status, utilizing destructuring for the `todo` prop.

```html
<todo-list v-bind:todos="todos">
  <template slot="todo" slot-scope="{ todo }">
    <span v-if="todo.isComplete">✓</span>
    {{ todo.text }}
  </template>
</todo-list>
```

--------------------------------

### Vue JSX Rendering Example

Source: https://v2.vuejs.org/v2/guide/render-function

Demonstrates how to use JSX with Vue.js for rendering components. It requires a Babel plugin and aliases `createElement` to `h`. The example shows a nested component structure similar to HTML templates.

```javascript
import AnchoredHeading from './AnchoredHeading.vue'
  
new Vue({
  el: '#demo',
  render: function (h) {
    return (
      <AnchoredHeading level={1}>
        <span>Hello</span> world!
      </AnchoredHeading>
    )
  }
})
```

--------------------------------

### Simplified Vue.js Form with Local Storage

Source: https://v2.vuejs.org/v2/cookbook/client-side-storage

A more concise version of the Vue.js local storage example. It binds two input fields to Vue data properties and saves them to local storage via a button click. The `mounted` hook retrieves data from local storage on initialization. This example is suitable for basic data persistence needs.

```html
<div id="app">
  My name is <input v-model="name">
  and I am <input v-model="age"> years old.
  <p/>
  <button @click="persist">Save</button>
</div>

```

```javascript
const app = new Vue({
  el:'#app',
  data: {
    name:'',
    age:0
  },
  mounted() {
    if(localStorage.name) this.name = localStorage.name;
    if(localStorage.age) this.age = localStorage.age;
  },
  methods: {
    persist() {
      localStorage.name = this.name;
      localStorage.age = this.age;
      console.log('now pretend I did more stuff...');
    }
  }
})

```

--------------------------------

### Advanced Filtering with JavaScript `.filter()` (Vue.js)

Source: https://v2.vuejs.org/v2/guide/migration

Illustrates advanced filtering capabilities using JavaScript's `.filter()` method within a computed property. This example shows how to perform case-insensitive matching against multiple properties (name and email) and check for an 'isActive' status. It requires access to the component's context (`this`) and regular expression capabilities.

```javascript
var self = this
self.users.filter(function (user) {
  var searchRegex = new RegExp(self.searchQuery, 'i')
  return user.isActive && (
    searchRegex.test(user.name) ||
    searchRegex.test(user.email)
  )
})
```

--------------------------------

### Vue Extends Example

Source: https://v2.vuejs.org/v2/api

Illustrates the 'extends' option in Vue.js, which allows a component to inherit properties and methods from another component object without using Vue.extend. This is useful for extending single file components.

```javascript
var CompA = { ... } 

// extend CompA without having to call `Vue.extend` on either
var CompB = {
  extends: CompA,
  ... 
}
```

--------------------------------

### Instantiate and Mount a Vue.js Root Instance

Source: https://v2.vuejs.org/v2/guide/components

This code demonstrates how to create a new Vue instance and attach it to a specific DOM element with the ID 'components-demo'. This instance manages the application's root level and allows for the use of registered components within its template.

```javascript
new Vue({ el: '#components-demo' })
```

--------------------------------

### Vue 2 Template: Single Root Element Requirement

Source: https://v2.vuejs.org/v2/guide/migration

Vue 2 enforces that each component template must have a single root element. This example shows how to refactor a template with multiple root elements by wrapping them in a single div.

```vue
<div>
  <p>foo</p>
  <p>bar</p>
</div>
```

--------------------------------

### Vue.js: Global State Management using Root Instance (Bad Practice)

Source: https://v2.vuejs.org/v2/style-guide

This code snippet demonstrates a discouraged method of managing global state in Vue.js by utilizing the root Vue instance's data and event bus (`this.$on`). It's suitable for very simple cases but not recommended for complex applications due to lack of organization and debugging tools.

```javascript
// main.js  
new Vue({
  data: {
    todos: []
  },
  created: function () {
    this.$on('remove-todo', this.removeTodo)
  },
  methods: {
    removeTodo: function (todo) {
      var todoIdToRemove = todo.id;
      this.todos = this.todos.filter(function (todo) {
        return todo.id !== todoIdToRemove;
      });
    }
  }
});
```

--------------------------------

### Listen to Native DOM Events on Components with `v-on.native`

Source: https://v2.vuejs.org/v2/guide/migration

In Vue.js v3, `v-on` on a component only listens to custom events. To listen for native DOM events on the component's root element, use the `.native` modifier. This example shows how to bind a click event to the native root element of `<my-component>`.

```html
<my-component v-on:click.native="doSomething"></my-component>
```

--------------------------------

### Custom `pluralize` Function (JavaScript)

Source: https://v2.vuejs.org/v2/guide/migration

Example of a custom JavaScript function to replace the Vue.js `pluralize` filter. This function handles pluralization logic for the word 'knife', providing specific output for zero, one, and multiple counts. It demonstrates how to create domain-specific pluralization rules.

```javascript
function pluralizeKnife (count) {
  if (count === 0) {
    return 'no knives'
  } else if (count === 1) {
    return '1 knife'
  } else {
    return count + 'knives'
  }
}
```

--------------------------------

### Vuex store.subscribe: Replacing Event Emitter

Source: https://v2.vuejs.org/v2/guide/migration-vuex

Illustrates the replacement of the store's event emitter interface (`on`, `off`, `emit`) with the new `store.subscribe` method for listening to mutations. This is typically used within plugins.

```javascript
var myPlugin = store => {
  store.subscribe(function (mutation, state) {
    // Do something...
  })
}
```

--------------------------------

### Initialize Vue App with Data in Vue.js

Source: https://v2.vuejs.org/v2/guide/components

Sets up a new Vue instance with an 'el' target and 'data' properties. The 'data' includes an array of 'posts', each with an 'id' and 'title'. This data will be used to dynamically render blog posts.

```javascript
new Vue({
  el: '#blog-post-demo',
  data: {
    posts: [
      { id: 1, title: 'My journey with Vue' },
      { id: 2, title: 'Blogging with Vue' },
      { id: 3, title: 'Why Vue is so fun' }
    ]
  }
})
```

--------------------------------

### Vue.js v-else with v-show replaced by v-if

Source: https://v2.vuejs.org/v2/guide/migration

Provides the Vue.js v2 replacement for using `v-else` with `v-show`. The recommended approach is to use `v-if` with a negation expression.

```html
<p v-if="foo">Foo</p>
<p v-if="!foo && bar">Not foo, but bar</p>
```

--------------------------------

### Arbitrary Route Properties: Scoping with meta

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Explains the change from using arbitrary properties directly on route definitions to scoping them under the `meta` property. Shows how to update existing definitions and access properties via `route.meta`.

```javascript
'/admin': {
  component: AdminPanel,
  requiresAuth: true
}
```

```javascript
{
  path: '/admin',
  component: AdminPanel,
  meta: {
    requiresAuth: true
  }
}
```

```javascript
if (route.meta.requiresAuth) {
  // ...
}
```

--------------------------------

### Vue Template Usage of v-clipscroll Directive

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

Example of how to apply the v-clipscroll directive to an SVG path element within a Vue template. It demonstrates passing required arguments for the animation's start and end scroll points, and the target path for morphing.

```html
<clipPath id="clip-path">
  <path
    v-clipscroll="{ start: '50', end: '100', toPath: 'M0.39 0.34H15.99V22.44H0.39z' }"
    id="poly-shapemorph"
    d="M12.46 20.76L7.34 22.04 3.67 18.25 5.12 13.18 10.24 11.9 13.91 15.69 12.46 20.76z"
  />
</clipPath>
```

--------------------------------

### Vue.js Grid Component Example with External Data

Source: https://v2.vuejs.org/v2/examples/grid-component

This snippet demonstrates how to create a reusable grid component in Vue.js and bind it with external data for display and sorting. It utilizes Vue's template syntax and data binding for dynamic rendering. The component includes sorting functionality based on column headers.

```html
<span class="arrow" :class="sortOrders[key] > 0 ? 'asc' : 'dsc'">
```
```

--------------------------------

### Display Blog Posts List with Vue

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

Creates a Vue component for the blog homepage. It fetches a list of posts from the ButterCMS API using `butter.post.list` and displays them with titles, summaries, and featured images. Includes routing links to individual posts.

```vue
<script>
  import { butter } from '@/buttercms'
  export default {
    name: 'blog-home',
    data() {
      return {
        page_title: 'Blog',
        posts: []
      }
    },
    methods: {
      getPosts() {
        butter.post.list({
          page: 1,
          page_size: 10
        }).then(res => {
          this.posts = res.data.data
        })
      }
    },
    created() {
      this.getPosts()
    }
  }
</script>

<template>
  <div id="blog-home">
      <h1>{{ page_title }}</h1>
      <div
        v-for="(post,index) in posts"
        :key="post.slug + '_' + index"
      >
        <router-link :to="'/blog/' + post.slug">
          <article class="media">
            <figure>
              <img
                v-if="post.featured_image"
                :src="post.featured_image"
                alt=""
              >
              <img
                v-else
                src="http://via.placeholder.com/250x250"
                alt=""
              >
            </figure>
            <h2>{{ post.title }}</h2>
            <p>{{ post.summary }}</p>
          </article>
        </router-link>
      </div>
  </div>
</template>
```

--------------------------------

### Firebase Real-time Validation Example (JavaScript)

Source: https://v2.vuejs.org/v2/examples/firebase

This JavaScript snippet demonstrates email validation using a regular expression, intended for use with a Firebase backend. It's part of an example that syncs data in real-time across clients and includes CSS transitions for item additions/removals.

```javascript
var emailRE = /^(([^<>()[]\.,;:s@\"]+(\.[^<>()[]\.,;:s@\"]+)*)|(\".+\"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
```

--------------------------------

### Prop Name Casing in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Ensures consistent prop naming conventions by using camelCase in JavaScript and kebab-case in templates. This improves readability and aligns with language-specific conventions.

```javascript
props: {
  greetingText: String
}
```

```html
<WelcomeMessage greeting-text="hi"/>
```

--------------------------------

### Dynamic Component Switching with Vue's <component> and v-bind:is

Source: https://v2.vuejs.org/v2/guide/components

This example illustrates how to dynamically switch between different Vue components using the special '<component>' element and the 'is' attribute. The 'currentTabComponent' variable determines which component is rendered. Dependencies include a registered Vue component or an options object.

```html
<!-- Component changes when currentTabComponent changes -->
<component v-bind:is="currentTabComponent"></component>
```

--------------------------------

### Using Vue Router Plugin with CommonJS

Source: https://v2.vuejs.org/v2/guide/plugins

Shows how to explicitly install the Vue Router plugin when using a module environment like CommonJS with tools such as Browserify or Webpack. This is necessary because `Vue.use()` is not automatically called in such environments.

```javascript
// When using CommonJS via Browserify or Webpack
var Vue = require('vue')
var VueRouter = require('vue-router')

// Don't forget to call this
Vue.use(VueRouter)
```

--------------------------------

### Vue.js v-bind:style with !important - String Syntax

Source: https://v2.vuejs.org/v2/guide/migration

Demonstrates the correct way to use `!important` with `v-bind:style` in Vue.js v2 by using string syntax, as object syntax is no longer supported for this.

```html
<p v-bind:style="'color: ' + myColor + ' !important'">hello</p>
```

--------------------------------

### Local Registration of Async Component with Promise (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-dynamic-async

This example shows how to locally register an asynchronous component within a Vue instance using a function that returns a Promise. This method is suitable for integrating async components directly into specific components rather than globally.

```javascript
new Vue({
  // ...
  components: {
    'my-component': () => import('./my-async-component')
  }
})
```

--------------------------------

### Vue Single-Instance Component Naming ('The' Prefix)

Source: https://v2.vuejs.org/v2/style-guide

Components that should only have a single active instance per page should be prefixed with 'The'. These components do not accept props as they are app-specific. This convention improves clarity by denoting uniqueness.

```text
components/
|- TheHeading.vue
|- TheSidebar.vue
```

--------------------------------

### Replace vm.$after with insertBefore or appendChild

Source: https://v2.vuejs.org/v2/guide/migration

The `vm.$after` method has been removed. Depending on whether the target element is the last child, use `myElement.parentNode.insertBefore(vm.$el, myElement.nextSibling)` or `myElement.parentNode.appendChild(vm.$el)`.

```javascript
myElement.parentNode.insertBefore(vm.$el, myElement.nextSibling)
```

```javascript
myElement.parentNode.appendChild(vm.$el)
```

--------------------------------

### Replace `cache: false` Computed Property with Method

Source: https://v2.vuejs.org/v2/guide/migration

In Vue.js v3, the `cache: false` option for computed properties is deprecated. This code example demonstrates how to replace an uncached computed property with a method, which provides the same behavior. The parent message is assumed to be available via `this.message`.

```javascript
template: '<p>message: {{ timeMessage }}</p>',
computed: {
  timeMessage: {
    cache: false,
    get: function () {
      return Date.now() + this.message
    }
  }
}
```

```javascript
template: '<p>message: {{ getTimeMessage() }}</p>',
methods: {
  getTimeMessage: function () {
    return Date.now() + this.message
  }
}
```

--------------------------------

### Vue Mixins Example

Source: https://v2.vuejs.org/v2/api

Demonstrates how to use mixins in Vue.js. Mixins allow you to add reusable component logic. When both the mixin and the component have lifecycle hooks (like 'created'), both are called, with the mixin hooks executing first.

```javascript
var mixin = {
  created: function () { console.log(1) }
}
var vm = new Vue({
  created: function () { console.log(2) },
  mixins: [mixin]
})
// => 1
// => 2
```

--------------------------------

### Vue.js: Basic Computed Property Example

Source: https://v2.vuejs.org/v2/guide/computed

Demonstrates a basic computed property 'reversedMessage' that reverses a 'message' string. It shows how to define the computed property within the Vue instance and access it in the template and via the console. The example highlights reactivity and dependency tracking.

```html
<div id="example">
  <p>Original message: "{{ message }}"</p>
  <p>Computed reversed message: "{{ reversedMessage }}"</p>
</div>

```

```javascript
var vm = new Vue({
  el: '#example',
  data: {
    message: 'Hello'
  },
  computed: {
    // a computed getter
    reversedMessage: function () {
      // `this` points to the vm instance
      return this.message.split('').reverse().join('')
    }
  }
})

```

```javascript
console.log(vm.reversedMessage) // => 'olleH'
vm.message = 'Goodbye'
console.log(vm.reversedMessage) // => 'eybdooG'

```

--------------------------------

### Simple Client-Side Routing in Vue.js

Source: https://v2.vuejs.org/v2/guide/routing

This snippet demonstrates a basic client-side routing mechanism in Vue.js without using an external router library. It dynamically renders components based on the current URL path. Dependencies include Vue.js and the browser's History API. It handles defined routes and a fallback for not found pages.

```javascript
const NotFound = { template: '<p>Page not found</p>' }
const Home = { template: '<p>home page</p>' }
const About = { template: '<p>about page</p>' }

const routes = {
  '/': Home,
  '/about': About
}

new Vue({
  el: '#app',
  data: {
    currentRoute: window.location.pathname
  },
  computed: {
    ViewComponent () {
      return routes[this.currentRoute] || NotFound
    }
  },
  render (h) { return h(this.ViewComponent) }
})
```

--------------------------------

### Initialize ButterCMS with API Token (ES6 Modules)

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This JavaScript snippet demonstrates how to initialize the ButterCMS client using ES6 import syntax and your API token. This is the modern approach for integrating ButterCMS into Vue.js applications that use ES6 modules.

```javascript
import Butter from 'buttercms';
const butter = Butter('your_api_token');
```

--------------------------------

### CSS Styling for Scroll Directive Example

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This CSS provides styling for the Vue scroll directive example, including font definitions, centering styles, and specific properties for the '.box' element. It sets up transitions for smooth visual changes based on scroll interactions.

```css
body {
  font-family: 'Abhaya Libre', Times, serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  background: #000;
  color: #fff;
  overflow-x: hidden;
}

h1,
h2,
h3,
h4 {
  font-family: 'Fira Sans', Helvetica, Arial, sans-serif;
  font-weight: 800;
}

.centered {
  margin: 0 auto;
  display: table;
  font-size: 60px;
  margin-top: 100px;
}

.box {
  border: 1px solid rgba(255, 255, 255, 0.5);
  padding: 8px 20px;
  line-height: 1.3em;
  opacity: 0;
  color: white;
  width: 200px;
  margin: 0 auto;
  margin-top: 30px;
  transform: translateZ(0);
  perspective: 1000px;
  backface-visibility: hidden;
  background: rgba(255, 255, 255, 0.1);
  transition: 1.5s all cubic-bezier(0.39, 0.575, 0.565, 1);
}

#app {
  height: 2000px;
}
```

--------------------------------

### Vue.js: Multiple Checkbox Binding with v-model

Source: https://v2.vuejs.org/v2/guide/forms

Demonstrates binding multiple checkboxes to an array data property using `v-model`. When checkboxes are checked, their respective `value` attributes are added to the 'checkedNames' array. Unchecking removes them. The example includes the necessary Vue instance data setup.

```html
<input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
<label for="jack">Jack</label>
<input type="checkbox" id="john" value="John" v-model="checkedNames">
<label for="john">John</label>
<input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
<label for="mike">Mike</label>
<br>
<span>Checked names: {{ checkedNames }}</span>
```

```javascript
new Vue({
  el: '...',
  data: {
    checkedNames: []
  }
})
```

--------------------------------

### Replace vm.$remove with element.remove()

Source: https://v2.vuejs.org/v2/guide/migration

The `vm.$remove` method is deprecated. Use the native `remove()` method on the element directly: `vm.$el.remove()`.

```javascript
vm.$el.remove()
```

--------------------------------

### Display Single Blog Post with Vue

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

Creates a Vue component for individual blog posts. It fetches a single post using its slug from the ButterCMS API via `butter.post.retrieve` and displays the title, author, and body. Includes navigation to next/previous posts.

```vue
<script>
  import { butter } from '@/buttercms'
  export default {
    name: 'blog-post',
    data() {
      return {
        post: null
      }
    },
    methods: {
      getPost() {
        butter.post.retrieve(this.$route.params.slug)
          .then(res => {
            this.post = res.data
          }).catch(res => {
            console.log(res)
          })
      }
    },
    watch: {
      // Watch for route changes to update the post
      '$route'(to, from) {
        this.getPost();
      }
    },
    created() {
      this.getPost()
    }
  }
</script>

<template>
  <div id="blog-post">
    <h1>{{ post.data.title }}</h1>
    <h4>{{ post.data.author.first_name }} {{ post.data.author.last_name }}</h4>
    <div v-html="post.data.body"></div>

    <router-link
      v-if="post.meta.previous_post"
      :to="'/blog/' + post.meta.previous_post.slug"
      class="button"
    >
      {{ post.meta.previous_post.title }}
    </router-link>
    <router-link
      v-if="post.meta.next_post"
      :to="'/blog/' + post.meta.next_post.slug"
      class="button"
    >
      {{ post.meta.next_post.title }}
    </router-link>
  </div>
</template>
```

--------------------------------

### Vue Router Navigation Guards: Asynchronous `beforeEach`

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Compares the old `router.beforeEach` syntax with the new asynchronous version, which includes a `next` function as the third argument to control navigation flow. This allows for more complex navigation guard logic.

```javascript
router.beforeEach(function (transition) {
  if (transition.to.path === '/forbidden') {
    transition.abort()
  } else {
    transition.next()
  }
})
```

```javascript
router.beforeEach(function (to, from, next) {
  if (to.path === '/forbidden') {
    next(false)
  } else {
    next()
  }
})
```

--------------------------------

### Vue.js v2: Input Binding with :value and :placeholder

Source: https://v2.vuejs.org/v2/style-guide

This snippet demonstrates binding input element's value and placeholder attributes to Vue instance data properties using the shorthand ':' for v-bind. It's a common pattern for dynamic form inputs in Vue.js.

```html
<input
  :value="newTodoText"
  :placeholder="newTodoInstructions"
>

```

```html
<input
  v-bind:value="newTodoText"
  v-bind:placeholder="newTodoInstructions"
>

```

--------------------------------

### Vue.js v2 TodoMVC Implementation Snippet

Source: https://v2.vuejs.org/v2/examples/todomvc

This snippet showcases a part of the Vue.js v2 TodoMVC implementation, focusing on dynamic class binding for completed and editing states of todo items. It requires Vue.js and potentially other dependencies for full functionality.

```vue
            :class="{ completed: todo.completed, editing: todo == editedTodo }"

```

--------------------------------

### Vue.js Automatic HTML Content Escaping

Source: https://v2.vuejs.org/v2/guide/security

This example illustrates Vue.js's automatic escaping mechanism for HTML content within templates. When user-provided strings contain potentially malicious script tags, Vue renders them as escaped HTML entities, preventing script injection. This is achieved using native browser APIs like `textContent`.

```html
<h1>{{ userProvidedString }}</h1>
```

```javascript
userProvidedString = '<script>alert("hi")</script>'
```

```html
&lt;script&gt;alert(&quot;hi&quot;)&lt;/script&gt;
```

--------------------------------

### Vue.js Todo List Example with Components and v-for

Source: https://v2.vuejs.org/v2/guide/list

A complete Vue.js application demonstrating a todo list. It uses v-for to render list items, handles user input for adding todos, and emits custom events for removing items. Includes a custom 'todo-item' component.

```html
<div id="todo-list-example">
  <form v-on:submit.prevent="addNewTodo">
    <label for="new-todo">Add a todo</label>
    <input
      v-model="newTodoText"
      id="new-todo"
      placeholder="E.g. Feed the cat"
    >
    <button>Add</button>
  </form>
  <ul>
    <li
      is="todo-item"
      v-for="(todo, index) in todos"
      v-bind:key="todo.id"
      v-bind:title="todo.title"
      v-on:remove="todos.splice(index, 1)"
    ></li>
  </ul>
</div>
```

```javascript
Vue.component('todo-item', {
  template: '\
    <li>\
      {{ title }}\
      <button v-on:click="$emit(\'remove\')">Remove</button>\
    </li>\
  ',
  props: ['title']
})

new Vue({
  el: '#todo-list-example',
  data: {
    newTodoText: '',
    todos: [
      {
        id: 1,
        title: 'Do the dishes',
      },
      {
        id: 2,
        title: 'Take out the trash',
      },
      {
        id: 3,
        title: 'Mow the lawn'
      }
    ],
    nextTodoId: 4
  },
  methods: {
    addNewTodo: function () {
      this.todos.push({
        id: this.nextTodoId++,
        title: this.newTodoText
      })
      this.newTodoText = ''
    }
  }
})
```

--------------------------------

### Object.freeze() HTML Example (HTML)

Source: https://v2.vuejs.org/v2/guide/instance

An HTML template demonstrating the impact of `Object.freeze()` on a Vue instance. The button click to change 'foo' will not update the displayed text because the data is frozen.

```html
<div id="app">
  <p>{{ foo }}</p>
  <!-- this will no longer update `foo`! -->
  <button v-on:click="foo = 'baz'">Change it</button>
</div>
```

--------------------------------

### Replace vm.$appendTo with appendChild

Source: https://v2.vuejs.org/v2/guide/migration

The `vm.$appendTo` method has been removed in favor of the native DOM API's `appendChild`. To migrate, use `myElement.appendChild(vm.$el)`.

```javascript
myElement.appendChild(vm.$el)
```

--------------------------------

### Configure Webpack 4+ for Production Mode

Source: https://v2.vuejs.org/v2/guide/deployment

This configuration snippet demonstrates how to set Webpack 4+ to production mode using the `mode` option. This setting automatically enables optimizations and strips development warnings.

```javascript
module.exports = {
  mode: 'production'
}
```

--------------------------------

### Vue.js Component for Animatable Scissors Icon (Full Example)

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

This code snippet demonstrates a complete Vue.js component for an animatable scissors icon. It includes the SVG structure within a script template and the corresponding JavaScript methods for animation using GSAP. This setup allows the icon to be registered and used within a Vue application.

```html
<div id="app">
  <p>Click me:</p>
  <animated-icon-scissors />
</div>

<script type="text/x-template" id="scissors">
  <svg @click="startScissors"
    xmlns="http://www.w3.org/2000/svg" 
    viewBox="0 0 100 100"
    width="100" 
    height="100"
    id="iconScissors"
    aria-labelledby="scissors"
    role="presentation"
    >
    <title id="scissors" lang="en">Scissors Animated Icon</title>
    <path id="bk" fill="#fff" d="M0 0h100v100H0z"/>
    <g ref="leftscissor">
      <path d="M57.6 47h-8.7v4.7H53l1.5 45h1.1a24.9 24.9 0 0 0 2-49.7zm1.5 45l-1.5-40.4a20.3 20.3 0 0 1 18.3 20.2c0 10.5-6.5 19.2-16.8 20.2z" fill="#30374b"/>
      <path d="M53.9 50.7l1.5 45.1h.2a24 24 0 0 0 1.9-47.9h-8v2.9zm3.8 0a21.1 21.1 0 0 1 19.1 21.1c0 11.4-7.2 20.1-17.6 21.1h-.9l-1.6-42.3z" fill="none"/>
      <path d="M75 71.8a19.3 19.3 0 0 0-16.5-19.2L60 91c8.9-1.3 15-9.1 15-19.2z" fill="none"/>
      <path d="M59.2 92.9c10.4-1 17.6-9.7 17.6-21.1a21.1 21.1 0 0 0-19.1-21.1h-1L58.3 93zM75 71.8c0 10.1-6.1 17.9-15 19.2l-1.5-38.4A19.3 19.3 0 0 1 75 71.8z" fill="#7f756b"/>
      <path d="M58.5 46.2V46h-9v1.8h8a24 24 0 0 1-1.9 47.9h-.2l-1.5-45h-4.4v1.8h2.7l1.5 45h1.9a25.8 25.8 0 0 0 2.9-51.4z" fill="#7f756b"/>
      <path fill="#a2a1a2" d="M54.6 51.3l.6-49.1-9.6 49.1h9z"/>
      <path d="M55.5 52.1H44.6L54.3 2l1.8.2zm-8.8-1.7h7l.5-38.5z" fill="#7f756b"/>
    </g>
    <g ref="rightscissor">
      <path d="M42.3 46.9a24.9 24.9 0 0 0 0 49.8h1l1.6-45h4v-4.8zM38.8 92C28.5 91 22 82.3 22 71.8a20.3 20.3 0 0 1 18.3-20.2z" fill="#30374b"/>
      <path d="M18.3 71.8a24 24 0 0 0 24 24h.2L44 50.7h5.5v-2.9h-7.2a23.9 23.9 0 0 0-24 24zM39.6 93h-.9c-10.4-1-17.6-9.7-17.6-21.1a21.1 21.1 0 0 1 19.1-21.2h1z" fill="none"/>
      <path d="M22.9 71.8c0 10.1 6.1 17.9 15 19.2l1.5-38.4a19.3 19.3 0 0 0-16.5 19.2z" fill="none"/>
      <path d="M21.1 71.8c0 11.4 7.2 20.1 17.6 21.1h.9l1.6-42.4h-1a21.1 21.1 0 0 0-19.1 21.3zM37.9 91c-8.9-1.3-15-9.1-15-19.2a19.3 19.3 0 0 1 16.5-19.2z" fill="#7f756b"/>
      <path d="M44 50.7l-1.5 45.1h-.2a24 24 0 0 1 0-48h7.2V46h-7.2a25.8 25.8 0 0 0 0 51.6h1.9l1.5-45h3.8v-1.9z" fill="#7f756b"/>
      <path fill="#d3d9df" d="M43.2 51.3l-.6-49.1 9.5 49.1h-8.9z"/>
      <path d="M53.2 52.1H42.3l-.6-49.9 1.7-.2zm-9.1-1.7h7l-7.5-38.5z" fill="#7f756b"/>
    </g>
    <circle cx="48.6" cy="44.5" r="3.7" fill="#e5e8ec"/>
    <path d="M48.6 49.1a4.6 4.6 0 1 1 0-9.1 4.6 4.6 0 0 1 0 9.1zm0-7.4a2.8 2.8 0 0 0-2.8 2.8 2.7 2.7 0 0 0 2.8 2.8 2.8 2.8 0 0 0 2.8-2.8 2.9 2.9 0 0 0-2.8-2.8z" fill="#7f756b"/>
  </svg>
</script>

```

--------------------------------

### Vue Prop Definitions (Bad Practice)

Source: https://v2.vuejs.org/v2/style-guide

Demonstrates a minimal prop definition in Vue.js, which is only acceptable for prototyping. Relying solely on an array of strings for prop names lacks type checking and validation, making it harder to understand the component's API and increasing the risk of runtime errors.

```javascript
// This is only OK when prototyping
props: ['status']
```

--------------------------------

### Replace ready lifecycle hook with mounted and $nextTick in Vue.js

Source: https://v2.vuejs.org/v2/guide/migration

The `ready` lifecycle hook is replaced by `mounted`. Note that `mounted` does not guarantee the element is in the document. Use `this.$nextTick` within `mounted` for operations requiring the element to be in the DOM.

```javascript
mounted: function () {
  this.$nextTick(function () {
    // code that assumes this.$el is in-document
  })
}
```

--------------------------------

### Vue Template for Transition

Source: https://v2.vuejs.org/v2/guide/transitions

Example of a Vue template using the `transition` wrapper component to apply a 'fade' transition to a paragraph element conditionally rendered with `v-if`. This snippet demonstrates basic structure for transitions.

```html
<div id="demo">
  <button v-on:click="show = !show">
    Toggle
  </button>
  <transition name="fade">
    <p v-if="show">hello</p>
  </transition>
</div>

```

--------------------------------

### Vue.js: Animate List Add/Remove and Shuffle with transition-group

Source: https://v2.vuejs.org/v2/guide/transitions

Shows how to animate adding, removing, and shuffling items in a Vue list using `<transition-group>`. This example includes HTML for buttons and the list, Vue instance methods for list manipulation, and CSS for entry, leave, and move transitions.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.14.1/lodash.min.js"></script>  
  
<div id="list-complete-demo" class="demo">  
  <button v-on:click="shuffle">Shuffle</button>  
  <button v-on:click="add">Add</button>  
  <button v-on:click="remove">Remove</button>  
  <transition-group name="list-complete" tag="p">  
    <span
      v-for="item in items"
      v-bind:key="item"
      class="list-complete-item"
    >
      {{ item }}
    </span>
  </transition-group>
</div>

```

```javascript
new Vue({
  el: '#list-complete-demo',
  data: {
    items: [1,2,3,4,5,6,7,8,9],
    nextNum: 10
  },
  methods: {
    randomIndex: function () {
      return Math.floor(Math.random() * this.items.length)
    },
    add: function () {
      this.items.splice(this.randomIndex(), 0, this.nextNum++)
    },
    remove: function () {
      this.items.splice(this.randomIndex(), 1)
    },
    shuffle: function () {
      this.items = _.shuffle(this.items)
    }
  }
})

```

```css
.list-complete-item {
  transition: all 1s;
  display: inline-block;
  margin-right: 10px;
}
.list-complete-enter, .list-complete-leave-to 
/* .list-complete-leave-active below version 2.1.8 */ {
  opacity: 0;
  transform: translateY(30px);
}
.list-complete-leave-active {
  position: absolute;
}

```

--------------------------------

### Vue.js GoogleMapLoader Component Script

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This script handles the initialization of the Google Maps API using the 'google-maps-api-loader' library. It accepts 'mapConfig' and 'apiKey' as props, exposes 'google' and 'map' data properties, and initializes the map in the 'mounted' hook.

```javascript
import GoogleMapsApiLoader from 'google-maps-api-loader'

export default {
  props: {
    mapConfig: Object,
    apiKey: String,
  },

  data() {
    return {
      google: null,
      map: null
    }
  },

  async mounted() {
    const googleMapApi = await GoogleMapsApiLoader({
      apiKey: this.apiKey
    })
    this.google = googleMapApi
    this.initializeMap()
  },

  methods: {
    initializeMap() {
      const mapContainer = this.$refs.googleMap
      this.map = new this.google.maps.Map(
        mapContainer, this.mapConfig
      )
    }
  }
}
```

--------------------------------

### Global Base Component Registration using require.context (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-registration

This example shows how to globally register base components in a Vue.js application's entry file (e.g., main.js) using Webpack's require.context. It iterates through files in a specified directory, extracts component names, and registers them with Vue, provided this occurs before the root Vue instance is created.

```javascript
import Vue from 'vue'  
import upperFirst from 'lodash/upperFirst'  
import camelCase from 'lodash/camelCase'  
  
const requireComponent = require.context(  
  // The relative path of the components folder  
  './components',  
  // Whether or not to look in subfolders  
  false,  
  // The regular expression used to match base component filenames  
  /Base[A-Z]\w+\.(vue|js)$/  
)  
  
requireComponent.keys().forEach(fileName => {  
  // Get component config  
  const componentConfig = requireComponent(fileName)  
  
  // Get PascalCase name of component  
  const componentName = upperFirst(  
    camelCase(  
      // Gets the file name regardless of folder depth  
      fileName  
        .split('/')  
        .pop()  
        .replace(/\.\w+$/, '')  
    )  
  )  
  
  
  // Register component globally  
  Vue.component(  
    componentName,  
    // Look for the component options on `.default`, which will  
    // exist if the component was exported with `export default`,  
    // otherwise fall back to module's root.  
    componentConfig.default || componentConfig  
  )  
})
```

--------------------------------

### Vue.js Component with Refined API Data Fetching

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This snippet presents a complete Vue.js component that fetches specific API data ('bpi' object) and stores it. It initializes 'info' to null and populates it in the 'mounted' hook using Axios. This example demonstrates a more practical approach to handling API responses.

```javascript
new Vue({
  el: '#app',
  data() {
    return {
      info: null
    };
  },
  mounted() {
    axios
      .get('https://api.coindesk.com/v1/bpi/currentprice.json')
      .then(response => (this.info = response.data.bpi));
  }
});
```

--------------------------------

### Async Component with Webpack Code-Splitting (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-dynamic-async

This example demonstrates defining an asynchronous component using Webpack's code-splitting feature. The `require` syntax instructs Webpack to split the code into separate bundles that are loaded on demand via AJAX requests, improving initial load performance.

```javascript
Vue.component('async-webpack-example', function (resolve) {
  // This special require syntax will instruct Webpack to
  // automatically split your built code into bundles which
  // are loaded over Ajax requests.
  require(['./my-async-component'], resolve)
})
```

--------------------------------

### Fetch Blog Posts using ButterCMS API

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This JavaScript code snippet demonstrates how to fetch a list of blog posts from ButterCMS using their API. It makes a `post.list` request with pagination parameters and logs the response to the console.

```javascript
butter.post.list({page: 1, page_size: 10}).then(function(response) {
  console.log(response)
})
```

--------------------------------

### npm package.json Configuration for Vue Components

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

Illustrates the essential fields in a package.json file for distributing Vue.js components via npm, specifying different build outputs for various environments (main, module, unpkg, browser).

```json
{
  "name": "my-component",
  "version": "1.2.3",
  "main": "dist/my-component.umd.js",
  "module": "dist/my-component.esm.js",
  "unpkg": "dist/my-component.min.js",
  "browser": {
    "./sfc": "src/my-component.vue"
  },
  ...
}
```

--------------------------------

### Vue.js: List Categories and Get Posts by Category using ButterCMS

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This snippet shows how to fetch a list of all categories and retrieve posts associated with a specific category using the ButterCMS API within a Vue.js application. It utilizes the `butter.category.list()` and `butter.category.retrieve()` methods. The results are logged to the console.

```javascript
methods: {
  // ...
  getCategories() {
    butter.category.list()
      .then(res => {
        console.log('List of Categories:')
        console.log(res.data.data)
      })
  },
  getPostsByCategory() {
    butter.category.retrieve('example-category', {
        include: 'recent_posts'
      })
      .then(res => {
        console.log('Posts with specific category:')
        console.log(res)
      })
  }
},
created() {
  // ...
  this.getCategories()
  this.getPostsByCategory()
}
```

--------------------------------

### Vue Component Naming Convention (JavaScript)

Source: https://v2.vuejs.org/v2/style-guide

Ensures component names are multi-word to prevent conflicts with HTML elements. Root components and built-in Vue components are exceptions. Violations can lead to naming collisions.

```javascript
Vue.component('todo', { 
  // ... 
})
```

```javascript
export default {
  name: 'Todo',
  // ...
}
```

```javascript
Vue.component('todo-item', { 
  // ... 
})
```

```javascript
export default {
  name: 'TodoItem',
  // ...
}
```

--------------------------------

### Vue SFC: Recommended Tag Order

Source: https://v2.vuejs.org/v2/style-guide

Single-File Components in Vue.js should consistently order their `<script>`, `<template>`, and `<style>` tags. The recommended order is `<script>`, then `<template>`, and finally `<style>`. This convention aids readability and maintainability, ensuring that essential script and template logic precedes styling.

```html
<!-- ComponentA.vue -->
<script>/* ... */</script>
<template>...</template>
<style>/* ... */</style>

<!-- ComponentB.vue -->
<script>/* ... */</script>
<template>...</template>
<style>/* ... */</style>
```

```html
<!-- ComponentA.vue -->
<template>...</template>
<script>/* ... */</script>
<style>/* ... */</style>

<!-- ComponentB.vue -->
<template>...</template>
<script>/* ... */</script>
<style>/* ... */</style>
```

--------------------------------

### Router Mode: history: true replaced by mode: 'history'

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Demonstrates the consolidation of routing mode options into a single `mode` option. The previous `history: true` setting is now `mode: 'history'`.

```javascript
var router = new VueRouter({
  history: 'true'
})
```

```javascript
var router = new VueRouter({
  mode: 'history'
})
```

--------------------------------

### Vue Multiple Select Example

Source: https://v2.vuejs.org/v2/guide/forms

Shows how to implement a multiple select dropdown using v-model. The 'selected' data property is bound to an array containing all selected options.

```html
<select v-model="selected" multiple>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
<br>
<span>Selected: {{ selected }}</span>
```

--------------------------------

### Vue.js Class-Style Component with TypeScript

Source: https://v2.vuejs.org/v2/guide/typescript

This TypeScript example showcases how to create Vue components using a class-based API with the `vue-class-component` decorator. It illustrates defining component options, data properties, and methods within a class structure.

```typescript
import Vue from 'vue'
import Component from 'vue-class-component'

// The @Component decorator indicates the class is a Vue component
@Component({
  // All component options are allowed in here
  template: '<button @click="onClick">Click!</button>'
})
export default class MyComponent extends Vue {
  // Initial data can be declared as instance properties
  message: string = 'Hello!'

  // Component methods can be declared as instance methods
  onClick (): void {
    window.alert(this.message)
  }
}
```

--------------------------------

### Vue.js App Initialization and Data Fetching

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

Initializes a Vue instance, defines data properties, a custom currency formatter filter, and fetches Bitcoin price data using Axios on component mount. It targets the '#app' element for mounting.

```javascript
new Vue({
  el: '#app',
  data() {
    return {
      info: null
    };
  },
  filters: {
    currencydecimal(value) {
      return value.toFixed(2);
    }
  },
  mounted() {
    axios
      .get('https://api.coindesk.com/v1/bpi/currentprice.json')
      .then(response => (this.info = response.data.bpi));
  }
});
```

--------------------------------

### Consistent Directive Shorthands in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Enforces the consistent use or non-use of directive shorthands (`:`, `@`, `#`). This promotes uniformity and avoids mixing shorthand and full directive names within a project.

```html
<input
  v-bind:value="newTodoText"
  :placeholder="newTodoInstructions"
>
```

```html
<input
  v-on:input="onInput"
  @focus="onFocus"
>
```

```html
<template v-slot:header>
  <h1>Here might be a page title</h1>
</template>

<template #footer>
  <p>Here's some contact info</p>
</template>
```

--------------------------------

### Splitting Complex Computed Properties in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Advocates for breaking down complex computed properties into smaller, more manageable ones. This improves testability, readability, and adaptability to changing requirements.

```javascript
computed: {
  basePrice: function () {
    return this.manufactureCost / (1 - this.profitMargin)
  },
  discount: function () {
    return this.basePrice * (this.discountPercent || 0)
  },
  finalPrice: function () {
    return this.basePrice - this.discount
  }
}
```

--------------------------------

### Vue Router Redirection: `router.redirect` vs. Route Option

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Shows the change in how redirects are handled, from using `router.redirect` globally to specifying redirects as an option directly within route definitions. This provides a more localized and declarative approach to redirects.

```javascript
router.redirect({
  '/tos': '/terms-of-service'
})
```

```javascript
{
  path: '/tos',
  redirect: '/terms-of-service'
}
```

--------------------------------

### Vue 1.0: Original Two-Way Currency Filter Logic

Source: https://v2.vuejs.org/v2/guide/migration

Illustrates the initial implementation of a two-way currency filter using `v-model`. While concise, this approach can lead to delayed state updates and user experience issues, as shown by the discrepancy between displayed and stored values for complex inputs.

```javascript
            return this.price + this.shipping + this.handling - this.discount;

```

--------------------------------

### Use Vue Component Directly in Browser via Script Tag (HTML)

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

Shows how to include Vue.js and a custom component from a CDN using script tags, making the component directly available in the browser's global scope.

```html
<script src="https://unpkg.com/vue@2"></script>
<script src="https://unpkg.com/my-component"></script>
...
<my-component></my-component>
...
```

--------------------------------

### v-model on Custom Component (Conceptual)

Source: https://v2.vuejs.org/v2/guide/components

Illustrates the conceptual equivalence of using v-model on a custom component, showing how it maps to 'value' prop binding and 'input' event handling.

```html
<custom-input
  v-bind:value="searchText"
  v-on:input="searchText = $event"
></custom-input>
```

--------------------------------

### Vue.js: Use Base Component with Manual Attribute Binding

Source: https://v2.vuejs.org/v2/guide/components-props

Example of using a base component (`base-input`) where non-prop attributes like `required` and `placeholder` are manually bound to the input element using `$attrs`.

```html
<base-input 
  label="Username:"
  v-model="username"
  required
  placeholder="Enter your username"
></base-input>
```

--------------------------------

### Vue.js: Computed Property Example with Non-Reactive Dependency

Source: https://v2.vuejs.org/v2/guide/computed

Illustrates a computed property 'now' that returns the current timestamp using Date.now(). This example demonstrates that computed properties are cached based on reactive dependencies and will not update if the dependency (like Date.now()) is not reactive, leading to stale data upon re-renders.

```javascript
computed: {
  now: function () {
    return Date.now()
  }
}

```

--------------------------------

### Vue Mounted Hook with $nextTick (JavaScript)

Source: https://v2.vuejs.org/v2/api

Shows how to use the 'mounted' lifecycle hook in Vue.js to execute code after the component has been mounted. It includes an example of using this.$nextTick to ensure code runs only after the entire view has been rendered.

```javascript
mounted: function () {
  this.$nextTick(function () {
    // Code that will run only after the
    // entire view has been rendered
  })
}
```

--------------------------------

### Replace track-by with key attribute in Vue.js v-for

Source: https://v2.vuejs.org/v2/guide/migration

The `track-by` attribute in `v-for` has been replaced by the `key` attribute. Use `v-bind:key` or `:key` for dynamic values, ensuring proper element tracking and updates.

```html
<div v-for="item in items" track-by="id">

```

```html
<div v-for="item in items" v-bind:key="item.id">

```

--------------------------------

### Link Component: v-link replaced with router-link

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Shows the replacement of the `v-link` directive with the `<router-link>` component for navigation. This change aligns with Vue 2's component-based approach.

```html
<a v-link="'/about'">About</a>
```

```html
<router-link to="/about">About</router-link>
```

--------------------------------

### Apply a Global Mixin in Vue.js

Source: https://v2.vuejs.org/v2/guide/mixins

Demonstrates how to apply a mixin globally using `Vue.mixin()`. This example injects logic to log a custom option `myOption` whenever a Vue instance is created. Use global mixins with caution as they affect all Vue instances.

```javascript
Vue.mixin({
  created: function () {
    var myOption = this.$options.myOption
    if (myOption) {
      console.log(myOption)
    }
  }
})

new Vue({
  myOption: 'hello!'
})
// => "hello!"
```

--------------------------------

### package.json configuration for multiple component builds

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

This JSON object shows a sample package.json configuration for a Vue.js component. It includes scripts to build the component in UMD, ES, and IIFE formats using Rollup, and defines the 'browser' field for SSR compatibility.

```json
{
  "name": "my-component",
  "version": "1.2.3",
  "main": "dist/my-component.umd.js",
  "module": "dist/my-component.esm.js",
  "unpkg": "dist/my-component.min.js",
  "browser": {
    "./sfc": "src/my-component.vue"
  },
  "scripts": {
    "build": "npm run build:umd & npm run build:es & npm run build:unpkg",
    "build:umd": "rollup --config build/rollup.config.js --format umd --file dist/my-component.umd.js",
    "build:es": "rollup --config build/rollup.config.js --format es --file dist/my-component.esm.js",
    "build:unpkg": "rollup --config build/rollup.config.js --format iife --file dist/my-component.min.js"
  },
  "devDependencies": {
    "rollup": "^1.17.0",
    "@rollup/plugin-buble": "^0.21.3",
    "@rollup/plugin-commonjs": "^11.1.0",
    "rollup-plugin-vue": "^5.0.1",
    "vue": "^2.6.10",
    "vue-template-compiler": "^2.6.10"
    ...
  },
  ...
```

--------------------------------

### Vue.js Custom Directives - String Literal Replacement

Source: https://v2.vuejs.org/v2/guide/migration

Demonstrates how to replace the removed `.literal` modifier in Vue.js custom directives by providing a string literal directly as the value.

```html
<p v-my-directive="'foo bar baz'"></p>
```

--------------------------------

### Vue Component Data Initialization (Bad Practice)

Source: https://v2.vuejs.org/v2/style-guide

Illustrates an incorrect way to initialize component data in Vue.js. Using a direct object for data in reusable components leads to all instances sharing the same data, causing unintended side effects when data is modified. This approach is only suitable for the root Vue instance.

```javascript
Vue.component('some-comp', {
  data: {
    foo: 'bar'
  }
})
```

```javascript
export default {
  data: {
    foo: 'bar'
  }
}
```

--------------------------------

### Vue.js v2: Named Slot Syntax

Source: https://v2.vuejs.org/v2/style-guide

This snippet demonstrates the usage of named slots in Vue.js templates, using both the shorthand '#' and the full 'v-slot:' directive. Named slots allow for flexible content distribution within components.

```html
<template v-slot:header>
  <h1>Here might be a page title</h1>
</template>

<template v-slot:footer>
  <p>Here's some contact info</p>
</template>


```

```html
<template #header>
  <h1>Here might be a page title</h1>
</template>

<template #footer>
  <p>Here's some contact info</p>
</template>


```

--------------------------------

### Simple Expressions in Vue.js Templates

Source: https://v2.vuejs.org/v2/style-guide

Recommends using only simple expressions in Vue templates, refactoring complex logic into computed properties or methods. This enhances template declarativeness and code reusability.

```html
{{ normalizedFullName }}
```

```javascript
computed: {
  normalizedFullName: function () {
    return this.fullName.split(' ').map(function (word) {
      return word[0].toUpperCase() + word.slice(1)
    }).join(' ')
  }
}
```

--------------------------------

### Equivalent of v-model on Input Element

Source: https://v2.vuejs.org/v2/guide/components

Shows the underlying bindings for v-model on a native input element, demonstrating the v-bind:value and v-on:input directives.

```html
<input
  v-bind:value="searchText"
  v-on:input="searchText = $event.target.value"
>
```

--------------------------------

### Vue.js 'created' Lifecycle Hook Example

Source: https://v2.vuejs.org/v2/guide/instance

Demonstrates the usage of the 'created' lifecycle hook in Vue.js. This hook is called after an instance has been created, allowing access to data and methods. The `this` keyword within the hook refers to the Vue instance.

```javascript
new Vue({
  data: {
    a: 1
  },
  created: function () {
    // `this` points to the vm instance
    console.log('a is: ' + this.a)
  }
})
// => "a is: 1"
```

--------------------------------

### Vue.js: Integrating Pikaday with $once for Automatic Cleanup

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Presents a more robust method for integrating Pikaday using `$once` to automatically clean up the datepicker instance when the component is destroyed. This resolves issues of code separation and potential clutter by keeping setup and cleanup logic together.

```javascript
mounted: function () {
  var picker = new Pikaday({
    field: this.$refs.input,
    format: 'YYYY-MM-DD'
  })

  this.$once('hook:beforeDestroy', function () {
    picker.destroy()
  })
}
```

--------------------------------

### Vue Mixin Option Merging: Methods

Source: https://v2.vuejs.org/v2/guide/mixins

Shows how methods defined in a mixin and a component are merged. If keys conflict, the component's method takes precedence. This example demonstrates merging of 'foo', 'bar', and a conflicting 'conflicting' method.

```javascript
var mixin = {
  methods: {
    foo: function () {
      console.log('foo')
    },
    conflicting: function () {
      console.log('from mixin')
    }
  }
}

var vm = new Vue({
  mixins: [mixin],
  methods: {
    bar: function () {
      console.log('bar')
    },
    conflicting: function () {
      console.log('from self')
    }
  }
})

vm.foo() // => "foo"
vm.bar() // => "bar"
vm.conflicting() // => "from self"
```

--------------------------------

### Vue Instance Properties and Methods (JavaScript)

Source: https://v2.vuejs.org/v2/guide/instance

Shows how Vue instances expose special properties (prefixed with `$`) like `$data` and `$el`, and methods like `$watch`. These are part of the Vue API.

```javascript
var data = { a: 1 }
var vm = new Vue({
  el: '#example',
  data: data
})

vm.$data === data // => true
vm.$el === document.getElementById('example') // => true

// $watch is an instance method
vm.$watch('a', function (newValue, oldValue) {
  // This callback will be called when `vm.a` changes
})
```

--------------------------------

### Active Link Styling: v-link-active replaced by router-link tag

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Explains how the `v-link-active` directive is now handled by the `tag` attribute on the `<router-link>` component for applying active classes to parent elements.

```html
<li v-link-active>
  <a v-link="'/about'">About</a>
</li>
```

```html
<router-link tag="li" to="/about">
  <a>About</a>
</router-link>
```

--------------------------------

### Vue Prop Definitions

Source: https://v2.vuejs.org/v2/style-guide

Showcases detailed prop definitions in Vue.js components. Specifying prop types, required status, and validators improves component API documentation and aids in development by catching incorrect prop usage early. This leads to more robust and maintainable components.

```javascript
props: {
  status: String
}
```

```javascript
props: {
  status: {
    type: String,
    required: true,
    validator: function (value) {
      return [
        'syncing',
        'synced',
        'version-conflict',
        'error'
      ].indexOf(value) !== -1
    }
  }
}
```

--------------------------------

### Vue.js v2: Input Event Handling with @input and @focus

Source: https://v2.vuejs.org/v2/style-guide

This snippet showcases how to attach event listeners to an input element for 'input' and 'focus' events using the shorthand '@' for v-on. This is essential for handling user interactions in Vue.js forms.

```html
<input
  @input="onInput"
  @focus="onFocus"
>

```

```html
<input
  v-on:input="onInput"
  v-on:focus="onFocus"
>

```

--------------------------------

### Configuration Options

Source: https://v2.vuejs.org/v2/api

Configuration options for Vue.js, including performance tracing and production tips.

```APIDOC
## Configuration Options

### performance

> New in 2.2.0+

*   **Type:** `boolean`
*   **Default:** `false (from 2.2.3+)`
*   **Usage**:
    Set this to `true` to enable component init, compile, render and patch performance tracing in the browser devtool performance/timeline panel. Only works in development mode and in browsers that support the performance.mark API.

### productionTip

> New in 2.2.0+

*   **Type:** `boolean`
*   **Default:** `true`
*   **Usage**:
    Set this to `false` to prevent the production tip on Vue startup.
```

--------------------------------

### Create Google Map Marker Factory Component (Vue.js)

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This Vue.js component serves as a factory for creating Google Maps markers. It accepts `google` and `map` objects, along with marker-specific data, and creates a new `google.maps.Marker` instance on the provided map during the component's `mounted` lifecycle hook.

```javascript
import { POINT_MARKER_ICON_CONFIG } from '@/constants/mapSettings'  

export default {
  props: {
    google: {
      type: Object,
      required: true
    },
    map: {
      type: Object,
      required: true
    },
    marker: {
      type: Object,
      required: true
    }
  },

  mounted() {
    new this.google.maps.Marker({
      position: this.marker.position,
      marker: this.marker,
      map: this.map,
      icon: POINT_MARKER_ICON_CONFIG
    })
  }
}
```

--------------------------------

### Component Name Casing in Vue.js JavaScript/JSX

Source: https://v2.vuejs.org/v2/style-guide

Outlines the recommended casing for component names within JavaScript and JSX in Vue.js projects. PascalCase is the standard convention for component names in JS/JSX, aligning with JavaScript's class and constructor naming. For applications solely using global component registration via `Vue.component`, kebab-case is an acceptable alternative, especially when many in-DOM templates are used.

```javascript
// Global registration with PascalCase
Vue.component('MyComponent', {
  // ...
})
```

```javascript
// Global registration with kebab-case (alternative)
Vue.component('my-component', {
  // ...
})
```

```javascript
// Importing components with PascalCase
import MyComponent from './MyComponent.vue'
```

```javascript
// Component definition with PascalCase name
export default {
  name: 'MyComponent',
  // ...
}
```

--------------------------------

### Manage route data loading state with watchers

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

The `$loadingRouteData` meta property has been removed. You should define your own loading state property (e.g., `isLoading`) in the component's data and manage it within a watcher on the `$route` to reflect loading status during data fetching.

```javascript
data: function () {
  return {
    posts: [],
    isLoading: false,
    fetchError: null
  }
},
watch: {
  '$route': function () {
    var self = this
    self.isLoading = true
    self.fetchData().then(function () {
      self.isLoading = false
    })
  }
},
methods: {
  fetchData: function () {
    var self = this
    return axios.get('/api/posts')
      .then(function (response) {
        self.posts = response.data.posts
      })
      .catch(function (error) {
        self.fetchError = error
      })
  }
}
```

--------------------------------

### Naive `currency` Formatting (JavaScript)

Source: https://v2.vuejs.org/v2/guide/migration

A basic JavaScript implementation for formatting currency values, replacing the Vue.js `currency` filter. This method prepends a dollar sign and formats the number to two decimal places using `toFixed(2)`. Note potential rounding issues with this naive approach.

```javascript
'$' + price.toFixed(2)
```

--------------------------------

### HTML Structure for Vue Scroll Directive Example

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This HTML snippet sets up a basic Vue application structure with an element that will have the custom 'v-scroll' directive applied. It includes a heading and a scrollable div containing paragraph text.

```html
<div id="app">
  <h1 class="centered">Scroll me</h1>
  <div class="box" v-scroll="handleScroll">
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A atque amet harum aut ab veritatis earum porro praesentium ut corporis. Quasi provident dolorem officia iure fugiat, eius mollitia sequi quisquam.</p>
  </div>
</div>
```

--------------------------------

### Implement Event Hub for Cross-Component Communication

Source: https://v2.vuejs.org/v2/guide/migration

Replaces `$dispatch` and `$broadcast` with a centralized event hub using a new Vue instance. This pattern facilitates communication between any components, including siblings and distant ancestors, by emitting and listening for events.

```javascript
// This is the event hub we'll use in every  
// component to communicate between them.  
var eventHub = new Vue()  

```

```javascript
// NewTodoInput  
// ...  
methods: {  
  addTodo: function () {  
    eventHub.$emit('add-todo', { text: this.newTodoText })  
    this.newTodoText = ''  
  }  
}  

```

```javascript
// DeleteTodoButton  
// ...  
methods: {  
  deleteTodo: function (id) {  
    eventHub.$emit('delete-todo', id)  
  }  
}  

```

```javascript
// Todos  
// ...  
created: function () {  
  eventHub.$on('add-todo', this.addTodo)  
  eventHub.$on('delete-todo', this.deleteTodo)  
},  
// It's good to clean up event listeners before  
// a component is destroyed.  
beforeDestroy: function () {  
  eventHub.$off('add-todo', this.addTodo)  
  eventHub.$off('delete-todo', this.deleteTodo)  
},  
methods: {  
  addTodo: function (newTodo) {  
    this.todos.push(newTodo)  
  },  
  deleteTodo: function (todoId) {  
    this.todos = this.todos.filter(function (todo) {  
      return todo.id !== todoId  
    })  
  }  
}  

```

--------------------------------

### Route Aliasing: router.alias to route definition

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Demonstrates how to update route aliasing from the global `router.alias` method to a property within the route definition. Supports single and multiple aliases using array syntax.

```javascript
router.alias({
  '/manage': '/admin'
})
```

```javascript
{
  path: '/admin',
  component: AdminPanel,
  alias: '/manage'
}
```

```javascript
alias: ['/manage', '/administer', '/administrate']
```

--------------------------------

### Use Customized v-model on Vue Component

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Demonstrates the usage of a Vue component that has a customized `v-model` behavior. This example shows how `v-model` will now bind to the 'checked' prop and update when the 'change' event is emitted.

```html
<base-checkbox v-model="lovingVue"></base-checkbox>
```

--------------------------------

### Use Google Map Initializer Component (Vue.js)

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This Vue.js component utilizes the GoogleMapLoader component to display a map. It provides the necessary map configuration and API key to the loader. The map settings are computed based on imported constants and a center coordinate.

```html
<template>
  <GoogleMapLoader
    :mapConfig="mapConfig"
    apiKey="yourApiKey"
  />
</template>
```

```javascript
import GoogleMapLoader from './GoogleMapLoader'
import { mapSettings } from '@/constants/mapSettings'

export default {
  components: {
    GoogleMapLoader
  },
  computed: {
    mapConfig () {
      return {
        ...mapSettings,
        center: { lat: 0, lng: 0 }
      }
    },
  },
}
```

--------------------------------

### Configure Webpack 3 and earlier for Production Mode

Source: https://v2.vuejs.org/v2/guide/deployment

This configuration snippet shows how to enable production mode in Webpack 3 and earlier using the `DefinePlugin`. It explicitly sets `process.env.NODE_ENV` to 'production', which Vue.js uses to disable development warnings and optimizations.

```javascript
var webpack = require('webpack')

module.exports = {
  // ...
  plugins: [
    // ...
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify('production')
    })
  ]
}
```

--------------------------------

### Vue Instance Component Tree (Text)

Source: https://v2.vuejs.org/v2/guide/instance

Illustrates the hierarchical structure of a Vue application, showing a root instance composed of nested components. This visualization helps understand component organization.

```text
Root Instance
└─ TodoList
   ├─ TodoItem
   │  ├─ TodoButtonDelete
   │  └─ TodoButtonEdit
   └─ TodoListFooter
      ├─ TodosButtonClear
      └─ TodoListStatistics
```

--------------------------------

### Vue.js v-el/v-ref replaced by ref Attribute - Array Behavior

Source: https://v2.vuejs.org/v2/guide/migration

Illustrates how to achieve the previous array behavior of `v-el`/`v-ref` with `v-for` in Vue.js v2 by assigning the same `ref` name to all elements.

```html
<p v-for="item in items" ref="items"></p>
```

--------------------------------

### Vue.js: Array Mutation using splice

Source: https://v2.vuejs.org/v2/guide/migration

The `Array.prototype.$remove` method has been removed. Use `Array.prototype.splice` to remove elements from an array. You can pass the element itself or its index to the `splice` method for removal.

```javascript
methods: {
  removeTodo: function (todo) {
    var index = this.todos.indexOf(todo)
    this.todos.splice(index, 1)
  }
}
```

```javascript
methods: {
  removeTodo: function (index) {
    this.todos.splice(index, 1)
  }
}
```

--------------------------------

### Multi-Attribute Element Structuring in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Promotes readability by breaking down elements with multiple attributes into separate lines, assigning one attribute per line. This follows the common JavaScript convention for object properties.

```html
<img
  src="https://vuejs.org/images/logo.png"
  alt="Vue Logo"
>
```

```html
<MyComponent
  foo="a"
  bar="b"
  baz="c"
/>
```

--------------------------------

### Vue.js: Component Integration with Vuex Actions (Good Practice)

Source: https://v2.vuejs.org/v2/style-guide

This Vue.js component demonstrates how to interact with the Vuex store to trigger state modifications. It uses `mapActions` to map the `removeTodo` action from the Vuex store to a local method, allowing the component to dispatch the action when a button is clicked. This promotes clean and maintainable component logic.

```vue
<!-- TodoItem.vue -->
<template>
  <span>
    {{ todo.text }}
    <button @click="removeTodo(todo)">
      X
    </button>
  </span>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  props: {
    todo: {
      type: Object,
      required: true
    }
  },
  methods: mapActions(['removeTodo'])
}
</script>
```

--------------------------------

### Update Vue Router `data` hook with reactive `$route` watcher

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

The `data` hook for fetching route data has been replaced. The `$route` property is now reactive, so you should use a watcher on `$route` to trigger data fetching methods, such as `fetchData`.

```javascript
watch: {
  '$route': 'fetchData'
},
methods: {
  fetchData: function () {
    // ...
  }
}
```

--------------------------------

### Replace `lowercase` Filter (JavaScript)

Source: https://v2.vuejs.org/v2/guide/migration

A simple JavaScript code snippet that replaces the Vue.js `lowercase` filter. This function converts an entire string to lowercase characters, useful for case normalization.

```javascript
text.toLowerCase()
```

--------------------------------

### Configure Rollup for Production Mode with @rollup/plugin-replace

Source: https://v2.vuejs.org/v2/guide/deployment

This Rollup configuration snippet shows how to use the `@rollup/plugin-replace` plugin to set `process.env.NODE_ENV` to 'production'. This is essential for enabling Vue.js's production mode when using Rollup as a build tool.

```javascript
const replace = require('@rollup/plugin-replace')

rollup({
  // ...
  plugins: [
    replace({
      'process.env.NODE_ENV': JSON.stringify( 'production' )
    })
  ]
}).then(...)
```

--------------------------------

### Vue.js Dynamic JavaScript Transitions with Velocity.js

Source: https://v2.vuejs.org/v2/guide/transitions

This example shows how to create dynamic JavaScript-driven transitions in Vue.js using event hooks like 'before-enter', 'enter', and 'leave'. It utilizes the Velocity.js library to animate opacity based on slider inputs for fade-in and fade-out durations.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.3/velocity.min.js"></script>

<div id="dynamic-fade-demo" class="demo">
  Fade In: <input type="range" v-model="fadeInDuration" min="0" v-bind:max="maxFadeDuration">
  Fade Out: <input type="range" v-model="fadeOutDuration" min="0" v-bind:max="maxFadeDuration">
  <transition
    v-bind:css="false"
    v-on:before-enter="beforeEnter"
    v-on:enter="enter"
    v-on:leave="leave"
  >
    <p v-if="show">hello</p>
  </transition>
  <button
    v-if="stop"
    v-on:click="stop = false; show = false"
  >Start animating</button>
  <button
    v-else
    v-on:click="stop = true"
  >Stop it!</button>
</div>
```

```javascript
new Vue({
  el: '#dynamic-fade-demo',
  data: {
    show: true,
    fadeInDuration: 1000,
    fadeOutDuration: 1000,
    maxFadeDuration: 1500,
    stop: true
  },
  mounted: function () {
    this.show = false
  },
  methods: {
    beforeEnter: function (el) {
      el.style.opacity = 0
    },
    enter: function (el, done) {
      var vm = this
      Velocity(el,
        { opacity: 1 },
        {
          duration: this.fadeInDuration,
          complete: function () {
            done()
            if (!vm.stop) vm.show = false
          }
        }
      )
    },
    leave: function (el, done) {
      var vm = this
      Velocity(el,
        { opacity: 0 },
        {
          duration: this.fadeOutDuration,
          complete: function () {
            done()
            vm.show = true
          }
        }
      )
    }
  }
})
```

--------------------------------

### Initialize Google Map Component (Vue.js)

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This Vue.js component initializes a Google Map instance. It accepts a map configuration object and an API key as props. The map is mounted to a designated div in the template. It uses the google-maps-api-loader library to load the API and exposes the google maps objects via a scoped slot.

```html
<template>
  <div>
    <div class="google-map" ref="googleMap"></div>
    <template v-if="Boolean(this.google) && Boolean(this.map)">
      <slot
        :google="google"
        :map="map"
      />
    </template>
  </div>
</template>
```

```javascript
import GoogleMapsApiLoader from 'google-maps-api-loader'

export default {
  props: {
    mapConfig: Object,
    apiKey: String,
  },
  data() {
    return {
      google: null,
      map: null
    }
  },
  async mounted() {
    const googleMapApi = await GoogleMapsApiLoader({
      apiKey: this.apiKey
    })
    this.google = googleMapApi
    this.initializeMap()
  },
  methods: {
    initializeMap() {
      const mapContainer = this.$refs.googleMap
      this.map = new this.google.maps.Map(mapContainer, this.mapConfig)
    }
  }
}
```

--------------------------------

### Component Name Casing Conventions in Vue.js Templates

Source: https://v2.vuejs.org/v2/style-guide

Illustrates recommended component name casing for Vue.js templates. PascalCase is preferred for Single-File Components (SFCs) and string templates to leverage editor autocompletion and improve visual distinction from HTML elements. Kebab-case is mandatory for DOM templates due to HTML's case-insensitivity. An alternative consistent approach using kebab-case everywhere is also acceptable.

```vue
<!-- In single-file components and string templates -->
<MyComponent/>
```

```html
<!-- In DOM templates -->
<my-component></my-component>
```

```html
<!-- Everywhere (alternative) -->
<my-component></my-component>
```

--------------------------------

### Vue Dynamic Component Transition

Source: https://v2.vuejs.org/v2/guide/transitions

Demonstrates how to transition between dynamic components using the <transition> component without needing a 'key' attribute. It allows for smooth visual changes when switching between different views.

```html
<transition name="component-fade" mode="out-in">
  <component v-bind:is="view"></component>
</transition>
```

--------------------------------

### Vue Render Function for Dynamic Content

Source: https://v2.vuejs.org/v2/guide/render-function

A basic Vue.js render function example demonstrating how to dynamically render an H1 tag with content from a 'blogTitle' property. This showcases the programmatic approach to DOM manipulation in Vue, contrasting with templates. Requires Vue.js.

```javascript
render: function (createElement) {
  return createElement('h1', this.blogTitle)
}
```

--------------------------------

### Add App Name to Vue Prototype

Source: https://v2.vuejs.org/v2/cookbook/adding-instance-properties

This example demonstrates how to add a global application name property ('$appName') to all Vue instances by defining it on Vue.prototype. This makes the property accessible before any Vue instance is created. It highlights the convention of using '$' for instance properties.

```javascript
Vue.prototype.$appName = 'My App'
```

```javascript
new Vue({
  beforeCreate: function() {
    console.log(this.$appName)
  }
})
```

--------------------------------

### Vue Router Route Definitions: `router.map` vs. `routes` Array

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

Illustrates the change in defining routes, moving from the `router.map` object syntax to a `routes` array configuration. This new array format ensures predictable route matching order across different browsers.

```javascript
router.map({
  '/foo': {
    component: Foo
  },
  '/bar': {
    component: Bar
  }
})
```

```javascript
var router = new VueRouter({
  routes: [
    { path: '/foo', component: Foo },
    { path: '/bar', component: Bar }
  ]
})
```

--------------------------------

### Vue Single Select Example

Source: https://v2.vuejs.org/v2/guide/forms

Demonstrates a basic single select dropdown using Vue's v-model. The 'selected' data property is bound to the chosen option. Includes a disabled option for iOS compatibility.

```html
<select v-model="selected">
  <option disabled value="">Please select one</option>
  <option>A</option>
  <option>B</option>
  <option>C</option>
</select>
<span>Selected: {{ selected }}</span>
```

```javascript
new Vue({
  el: '...',
  data: {
    selected: ''
  }
})
```

--------------------------------

### Replace `uppercase` Filter (JavaScript)

Source: https://v2.vuejs.org/v2/guide/migration

A straightforward JavaScript implementation to replace the Vue.js `uppercase` filter. This code converts an entire string to uppercase characters. It's a common string manipulation utility.

```javascript
text.toUpperCase()
```

--------------------------------

### Vue.js: Using keep-alive as a Wrapper Component

Source: https://v2.vuejs.org/v2/guide/migration

The `keep-alive` attribute is now a wrapper component, similar to `<transition>`. It can wrap multiple conditional children, but only the first will be rendered. Nest `<keep-alive>` inside `<transition>` if used together.

```html
<keep-alive>
  <component v-bind:is="view"></component>
</keep-alive>
```

```html
<keep-alive>
  <todo-list v-if="todos.length > 0"></todo-list>
  <no-todos-gif v-else></no-todos-gif>
</keep-alive>
```

```html
<transition>
  <keep-alive>
    <component v-bind:is="view"></component>
  </keep-alive>
</transition>
```

--------------------------------

### Vue: Conditional Rendering with `v-if`/`v-else` and `key`

Source: https://v2.vuejs.org/v2/style-guide

When using `v-if` and `v-else` on elements of the same type, it is recommended to provide a unique `key` attribute to each. This helps Vue efficiently manage DOM updates by ensuring elements are replaced rather than patched, preventing potential unintended side effects and improving performance.

```html
<div
  v-if="error"
  key="search-status"
>
  Error: {{ error }}
</div>
<div
  v-else
  key="search-results"
>
  {{ results }}
</div>
```

--------------------------------

### Vue.js Functional Component Render Function Example

Source: https://v2.vuejs.org/v2/guide/render-function

This snippet demonstrates how to create a functional component in Vue.js using a render function. It shows how to explicitly pass attributes, event listeners, and children to the root element by utilizing `context.data` and `context.children`.

```javascript
Vue.component('my-functional-button', { 
  functional: true, 
  render: function (createElement, context) { 
    // Transparently pass any attributes, event listeners, children, etc. 
    return createElement('button', context.data, context.children) 
  } 
})

```

--------------------------------

### Vue 2.0: Migrating Two-Way Currency Filter to Component Input

Source: https://v2.vuejs.org/v2/guide/migration

Demonstrates the migration of a two-way currency filter to a `<currency-input>` component. This approach improves explicit state updates and allows for richer features like input selection on focus. It extracts business logic into a separate validator for better modularity and testability.

```javascript
            // http://stackoverflow.com/questions/1269722/selecting-text-on-focus-using-jquery-not-working-in-safari-and-chrome

```

--------------------------------

### Using Full Words for Component Names in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Recommends using full, descriptive words for component names in Vue.js instead of abbreviations. This practice enhances code clarity and maintainability, especially with modern editor autocompletion features. Avoiding uncommon abbreviations is particularly important.

```treeview
components/
|- StudentDashboardSettings.vue
|- UserProfileOptions.vue
```

--------------------------------

### Import Vue Component in Application (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

Demonstrates how to import a Vue.js component packaged for npm into a parent application's build process using JavaScript.

```javascript
import MyComponent from 'my-component';

export default {
  components: {
    MyComponent,
  },
  // rest of the component
}
```

--------------------------------

### Quoted Attribute Values in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Mandates the use of quotes (single or double) for non-empty HTML attribute values. This prevents potential readability issues and avoids implicitly discouraging spaces within attribute values.

```html
<input type="text">
```

```html
<AppSidebar :style="{ width: sidebarWidth + 'px' }">
```

--------------------------------

### Vue.js v-el/v-ref replaced by ref Attribute - Dynamic Assignment

Source: https://v2.vuejs.org/v2/guide/migration

Shows how to use the `ref` attribute dynamically with `v-for` in Vue.js v2. This replaces the deprecated `v-el` and `v-ref` directives. Refs are not reactive and primarily for JavaScript access.

```html
<p v-for="item in items" v-bind:ref="'item' + item.id"></p>
```

--------------------------------

### Vue.js Watcher: Imperative Code Example

Source: https://v2.vuejs.org/v2/guide/computed

An imperative Vue.js watcher implementation where a `fullName` is updated based on changes to `firstName` and `lastName`. This method is less declarative and more verbose compared to using computed properties for the same task.

```javascript
var vm = new Vue({
  el: '#demo',
  data: {
    firstName: 'Foo',
    lastName: 'Bar',
    fullName: 'Foo Bar'
  },
  watch: {
    firstName: function (val) {
      this.fullName = val + ' ' + this.lastName
    },
    lastName: function (val) {
      this.fullName = this.firstName + ' ' + val
    }
  }
})
```

--------------------------------

### Vue 2 ESM Named Exports Example

Source: https://v2.vuejs.org/v2/guide/migration-vue-2-7

Demonstrates how to correctly import Composition API functions like `ref` using named exports in Vue 2 ESM builds. Accessing them as properties of the global `Vue` object is not supported.

```javascript
import Vue, { ref } from "vue";  

Vue.ref; // undefined, use named export instead  
```

--------------------------------

### Update Vue Router `abstract` option

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

The `abstract: true` option for Vue Router has been replaced by a single `mode: 'abstract'` option. This change consolidates routing mode configurations into a unified property. Update your VueRouter constructor accordingly.

```javascript
var router = new VueRouter({
  abstract: 'true'
})
```

```javascript
var router = new VueRouter({
  mode: 'abstract'
})
```

--------------------------------

### Vue.js GoogleMapLoader Component Template

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This template defines the structure for the GoogleMapLoader component. It includes a div for the map container and a conditional template that renders the scoped slot, passing 'google' and 'map' objects to the parent component.

```html
<template>
  <div>
    <div class="google-map" ref="googleMap"></div>
    <template v-if="Boolean(this.google) && Boolean(this.map)">
      <slot
        :google="google"
        :map="map"
      />
    </template>
  </div>
</template>
```

--------------------------------

### Axios API Request with Basic Error Handling (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This snippet demonstrates a basic Axios GET request to fetch data from an API. It includes a `.catch()` block to log any errors that occur during the request, such as network issues or incorrect URLs. The response data is processed in the `.then()` block.

```javascript
axios \
  .get('https://api.coindesk.com/v1/bpi/currentprice.json') \
  .then(response => (this.info = response.data.bpi)) \
  .catch(error => console.log(error)) \

```

--------------------------------

### Create Google Map Polyline Factory Component (Vue.js)

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This Vue.js component acts as a factory for generating Google Maps polylines. It requires `google` and `map` objects for map interaction and a `path` prop containing an array of coordinates. A new `google.maps.Polyline` is instantiated and added to the map when the component mounts.

```javascript
import { LINE_PATH_CONFIG } from '@/constants/mapSettings'  

export default {
  props: {
    google: {
      type: Object,
      required: true
    },
    map: {
      type: Object,
      required: true
    },
    path: {
      type: Array,
      required: true
    }
  },

  mounted() {
    new this.google.maps.Polyline({
      path: this.path,
      map: this.map,
      ...LINE_PATH_CONFIG
    })
  }
}
```

--------------------------------

### Serve Vue Component with Vue CLI 3

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

This command uses Vue CLI 3 to serve a Vue component locally, enabling features like hot module reloading (HMR) for a streamlined development experience. It's an alternative to direct Rollup configuration for development purposes.

```bash
vue serve --open src/my-component.vue
```

--------------------------------

### Display Commit Date - Vue.js

Source: https://v2.vuejs.org/v2/examples/commits

This snippet shows how to format and display the author's date for a commit within a Vue.js template. It utilizes a custom 'formatDate' filter for date presentation. Assumes 'record.commit.author.date' is available in the component's data.

```html
<span class="date">{{ record.commit.author.date | formatDate }}</span>
```

--------------------------------

### Vue.js v-on Directive: Handling Custom Component Events

Source: https://v2.vuejs.org/v2/api

Illustrates how to use the v-on directive to listen for custom events emitted by child components in Vue.js. It includes examples of basic event listening, inline statements with arguments, and listening for native events on component roots.

```html
<my-component @my-event="handleThis"></my-component>

<!-- inline statement -->
<my-component @my-event="handleThis(123, $event)"></my-component>

<!-- native event on component -->
<my-component @click.native="onClick"></my-component>
```

--------------------------------

### Reusable Transition Component with Template in Vue.js

Source: https://v2.vuejs.org/v2/guide/transitions

This snippet shows how to create a reusable transition component in Vue.js using a template. The `<transition>` component is placed at the root of the template, and child elements are passed through a slot. It includes example JavaScript hooks for `beforeEnter` and `afterEnter` for custom animation logic.

```javascript
Vue.component('my-special-transition', {  
  template: '  
    <transition
      name="very-special-transition"
      mode="out-in"
      v-on:before-enter="beforeEnter"
      v-on:after-enter="afterEnter"
    >
      <slot></slot>
    </transition>
  ', 
  methods: {  
    beforeEnter: function (el) {  
      // ...  
    },  
    afterEnter: function (el) {  
      // ...  
    }  
  }  
})  

```

--------------------------------

### Vue.js Component Style Scoping Strategies

Source: https://v2.vuejs.org/v2/style-guide

Illustrates various methods for achieving scoped styles in Vue.js components to prevent style conflicts. It covers the `scoped` attribute, CSS Modules, and the BEM convention, showcasing how each approach helps in isolating component styles and improving maintainability, especially in large projects or when integrating third-party CSS.

```Vue.js
<template>
  <button class="btn btn-close">X</button>
</template>

<style>
.btn-close {
  background-color: red;
}
</style>
```

```Vue.js
<template>
  <button class="button button-close">X</button>
</template>

<style scoped>
.button {
  border: none;
  border-radius: 2px;
}

.button-close {
  background-color: red;
}
</style>
```

```Vue.js
<template>
  <button :class="[$style.button, $style.buttonClose]">X</button>
</template>

<style module>
.button {
  border: none;
  border-radius: 2px;
}

.buttonClose {
  background-color: red;
}
</style>
```

```Vue.js
<template>
  <button class="c-Button c-Button--close">X</button>
</template>

<style>
.c-Button {
  border: none;
  border-radius: 2px;
}

.c-Button--close {
  background-color: red;
}
</style>
```

--------------------------------

### Vue.js Local Storage Form Input (HTML)

Source: https://v2.vuejs.org/v2/cookbook/client-side-storage

This HTML snippet sets up a basic Vue.js application with a single input field. The input is bound to a Vue data property 'name' using v-model, enabling two-way data binding. This is the UI part of the client-side storage example.

```html
<div id="app">
  My name is <input v-model="name">
</div>

```

--------------------------------

### Vue.js Main App Structure with Media Layouts

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

The main Vue application structure displays a scrolling example using a custom 'media-layout' component. This component is designed to hold image content and can be flipped for different visual presentations. It relies on the Vue framework and its template system.

```html
<div id="app">
  <main>
    <h1>Scrolling Example</h1>
    <div class="mediumstart">
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad aut reprehenderit maiores perferendis optio iste, quis consectetur, impedit molestias consequatur asperiores ipsa, perspiciatis adipisci voluptas similique laboriosam nihil sunt quae? Lorem, ipsum dolor sit amet consectetur adipisicing elit. Placeat animi quas nulla perferendis pariatur dolore quo natus! Culpa eius temporibus, asperiores repellat, vitae ex, doloremque quo ratione obcaecati in blanditiis.</p>
    </div>

    <media-layout :flipped="true">
      <image-one />
    </media-layout>
    
    <media-layout>
      <image-two />
    </media-layout>
    
    <media-layout :flipped="true">
      <image-three />
    </media-layout>
    
  </main>
</div>
```

--------------------------------

### Vue.js Reactivity: Updating Objects with New Properties

Source: https://v2.vuejs.org/v2/guide/reactivity

Illustrates the recommended approach for updating an object with multiple new properties to ensure reactivity, by creating a fresh object.

```javascript
// instead of `Object.assign(this.someObject, { a: 1, b: 2 })`
this.someObject = Object.assign({}, this.someObject, { a: 1, b: 2 })
```

--------------------------------

### Vue.js: Animate List Item Position Changes with transition-group

Source: https://v2.vuejs.org/v2/guide/transitions

Demonstrates using Vue's `<transition-group>` component with the `v-move` class to animate changes in list item positions. It includes the necessary HTML structure, Vue instance setup for shuffling items, and CSS for the transition.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.14.1/lodash.min.js"></script>  
  
<div id="flip-list-demo" class="demo">  
  <button v-on:click="shuffle">Shuffle</button>  
  <transition-group name="flip-list" tag="ul">  
    <li v-for="item in items" v-bind:key="item">  
      {{ item }}  
    </li>  
  </transition-group>  
</div>  

```

```javascript
new Vue({
  el: '#flip-list-demo',
  data: {
    items: [1,2,3,4,5,6,7,8,9]
  },
  methods: {
    shuffle: function () {
      this.items = _.shuffle(this.items)
    }
  }
})

```

```css
.flip-list-move {
  transition: transform 1s;
}

```

--------------------------------

### Vue.js Template-Based Functional Component Example

Source: https://v2.vuejs.org/v2/guide/render-function

This snippet illustrates how to create a template-based functional component in Vue.js. It demonstrates the manual addition of attributes and event listeners using `v-bind="data.attrs"` and `v-on="listeners"`, respectively, to ensure proper propagation.

```html
<template functional>
  <button
    class="btn btn-primary"
    v-bind="data.attrs"
    v-on="listeners"
  >
    <slot/>
  </button>
</template>

```

--------------------------------

### Vue vs React: Optimization Differences

Source: https://v2.vuejs.org/v2/guide/comparison

Explains how Vue automatically tracks dependencies for efficient re-rendering, contrasting it with React's manual optimization methods like PureComponent or shouldComponentUpdate. Vue's approach simplifies performance tuning for developers.

```javascript
/*
 * React Optimization:
 * When state changes, re-renders entire sub-tree.
 * Requires manual optimization using PureComponent or shouldComponentUpdate.
 * May need immutable data structures.
 * Caveats: Optimizations assume render output is solely dependent on current component's props.
 */
class MyComponent extends React.Component {
  shouldComponentUpdate(nextProps, nextState) {
    // Manual check for updates
    return true; 
  }
  render() {
    return <div>{this.props.data}</div>;
  }
}

/*
 * Vue Optimization:
 * Automatically tracks dependencies during render.
 * Precisely knows which components need re-rendering.
 * `shouldComponentUpdate` is effectively implemented automatically.
 * Avoids nested component caveats of React's manual optimizations.
 */
// Vue component example (conceptual)
// No explicit shouldComponentUpdate needed for dependency tracking
new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  },
  template: '<div>{{ message }}</div>'
});
```

--------------------------------

### Vue.js: Example Rendered HTML from Deprecated Slot Syntax

Source: https://v2.vuejs.org/v2/guide/components-slots

This snippet represents the final rendered HTML structure resulting from using the deprecated `slot` attribute for named slots in a Vue.js component like `<base-layout>`. It shows how content directed to 'header', 'default', and 'footer' slots is organized within the component's layout.

```html
<div class="container">
  <header>
    <h1>Here might be a page title</h1>
  </header>
  <main>
    <p>A paragraph for the main content.</p>
    <p>And another one.</p>
  </main>
  <footer>
    <p>Here's some contact info</p>
  </footer>
</div>
```

--------------------------------

### Using Custom Directive in Vue.js Template

Source: https://v2.vuejs.org/v2/guide/custom-directive

This example illustrates how to apply a custom directive, 'v-focus', to an HTML element within a Vue.js template. Once registered (either globally or locally), the directive can be used as an attribute on any element to trigger its defined behavior.

```html
<input v-focus>
```

--------------------------------

### Update Filter Argument Syntax (Vue.js)

Source: https://v2.vuejs.org/v2/guide/migration

Illustrates the updated syntax for filter arguments in Vue.js, changing from space-delimited to parentheses-enclosed and comma-separated arguments. This change aligns filter invocation more closely with standard JavaScript function calls, improving readability and maintainability.

```html
<p>{{ date | formatDate('YY-MM-DD', timeZone) }}</p>
```

--------------------------------

### Vue Tightly Coupled Component Naming (Parent Prefix)

Source: https://v2.vuejs.org/v2/style-guide

Child components tightly coupled with their parent should include the parent's name as a prefix. This convention keeps related files organized alphabetically in editors and makes relationships immediately apparent, avoiding deep directory nesting.

```text
components/
|- TodoList.vue
|- TodoListItem.vue
|- TodoListItemButton.vue
```

```text
components/
|- SearchSidebar.vue
|- SearchSidebarNavigation.vue
```

--------------------------------

### Vue.js: Interpolation in Attributes Replaced with v-bind

Source: https://v2.vuejs.org/v2/guide/migration

Interpolation within attributes is no longer valid. Use inline expressions with `v-bind` or data/computed properties instead. This change aims to simplify attribute handling and avoid potential parsing issues.

```html
<button v-bind:class="'btn btn-' + size"></button>
```

```javascript
computed: {
  buttonClasses: function () {
    return 'btn btn-' + size
  }
}
```

--------------------------------

### Vue.js: Integrating Pikaday Datepicker with Manual Cleanup

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Illustrates a common pattern for integrating a third-party library like Pikaday. It shows how to initialize the datepicker in the `mounted` hook and clean it up in the `beforeDestroy` hook by saving the picker instance to the component. This approach can lead to code clutter.

```javascript
mounted: function () {
  this.picker = new Pikaday({
    field: this.$refs.input,
    format: 'YYYY-MM-DD'
  })
},
beforeDestroy: function () {
  this.picker.destroy()
}
```

--------------------------------

### Netlify Serverless Function for Product Name Validation (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/form-validation

A Netlify serverless function written in Node.js that checks if a provided product name is in a list of disallowed names. It returns a 400 status code with an error message for invalid names and a 204 status code for valid names. It uses `event.queryStringParameters` to access the 'name' parameter.

```javascript
exports.handler = async (event, context) => {
    
    const badNames = ['vista', 'empire', 'mbp'];
    const name = event.queryStringParameters.name;
  
    if (badNames.includes(name)) {
      return { 
        statusCode: 400,
        body: JSON.stringify({error: 'Invalid name passed.'})
      }
    }
  
    return {
      statusCode: 204
    }
  
}
```

--------------------------------

### Vue.js: Inline Template Definition

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

This example shows how to define a Vue.js component's template using the `inline-template` special attribute. The content within the `inline-template` directive is compiled as the component's own template, offering flexibility but potentially making scope management more complex.

```html
<my-component inline-template>
  <div>
    <p>These are compiled as the component's own template.</p>
    <p>Not parent's transclusion content.</p>
  </div>
</my-component>
```

--------------------------------

### Provide / Inject

Source: https://v2.vuejs.org/v2/api

The `provide` and `inject` options facilitate dependency injection, allowing ancestor components to serve data to any descendant.

```APIDOC
## Provide / Inject

### Description
This pair of options enables a powerful dependency injection system, allowing ancestor components to make data available to any descendant component in the same parent chain, similar to React's context feature.

### Method
Component Option

### Endpoint
N/A

### Parameters
#### Request Body
- **provide** (Object | Function) - Required - An object or function returning an object containing properties available for injection.
- **inject** (Array<string> | Object) - Required - Defines which properties to inject from the ancestor. Can be an array of strings or an object mapping local names to the source property, with optional default values.

### Request Example
```javascript
// Parent Component
var Parent = {
  provide: {
    message: 'Hello from Parent'
  },
  template: '<div><child></child></div>'
};

// Child Component
var Child = {
  inject: ['message'],
  template: '<div>Injected: {{ message }}</div>'
};

// App Registration
new Vue({
  el: '#app',
  components: {
    Parent: Parent,
    Child: Child
  },
  template: '<Parent/>'
});
```

### Response
#### Success Response (200)
N/A

#### Response Example
N/A
```

--------------------------------

### Replace Vue Router `saveScrollPosition` with `scrollBehavior`

Source: https://v2.vuejs.org/v2/guide/migration-vue-router

The `saveScrollPosition: true` option is replaced by a more flexible `scrollBehavior` function. This function allows for per-route scroll behavior customization. To replicate the old behavior, return `savedPosition` or `{ x: 0, y: 0 }`.

```javascript
saveScrollPosition: true
```

```javascript
scrollBehavior: function (to, from, savedPosition) {
  return savedPosition || { x: 0, y: 0 }
}
```

--------------------------------

### Vue v-for with Key

Source: https://v2.vuejs.org/v2/style-guide

Illustrates the correct usage of the `key` attribute with `v-for` in Vue.js templates. Assigning a unique key to each item ensures predictable component state and behavior, especially during list updates, sorting, or when using animations. It's a best practice for maintaining internal component state.

```html
<ul>
  <li
    v-for="todo in todos"
    :key="todo.id"
  >
    {{ todo.text }}
  </li>
</ul>
```

--------------------------------

### v-model Lazy and Number Attribute Migration to Modifiers

Source: https://v2.vuejs.org/v2/guide/migration

Illustrates the migration of the `lazy` and `number` parameter attributes for `v-model` to modifiers in Vue.js. Previously, these were added as separate attributes. The new approach uses dot notation directly on the `v-model` directive for clarity and consistency.

```html
<input v-model="name" lazy>
<input v-model="age" type="number" number>
```

```html
<input v-model.lazy="name">
<input v-model.number="age" type="number">
```

--------------------------------

### Vue Component Data Function Requirement (JavaScript)

Source: https://v2.vuejs.org/v2/style-guide

Enforces that the `data` property in Vue components must be a function returning an object. This prevents data object sharing issues across component instances, ensuring data is unique per instance.

```javascript
// Bad example (data is not a function):
/*
new Vue({
  el: '#app',
  data: {
    message: 'Hello'
  }
});
*/

// Good example (data is a function):
new Vue({
  el: '#app',
  data: function () {
    return {
      message: 'Hello'
    };
  }
});
```

--------------------------------

### Replace Debounce Filter with Lodash

Source: https://v2.vuejs.org/v2/guide/migration

Demonstrates replacing the deprecated `debounce` filter used within directives with Lodash's `debounce` function. This approach moves the debouncing logic into the component's methods, offering better reusability and maintainability.

```html
<input v-on:keyup="doStuff | debounce 500">

```

```javascript
methods: {  
  doStuff: function () {  
    // ...  
  }  
}  

```

```html
<input v-on:keyup="doStuff">

```

```javascript
methods: {  
  doStuff: _.debounce(function () {  
    // ...  
  }, 500)  
}  

```

--------------------------------

### Advanced Vuex-like Option Merge Strategy in Vue.js

Source: https://v2.vuejs.org/v2/guide/mixins

An advanced example illustrating a custom merge strategy similar to Vuex's 1.x version. This strategy handles merging for nested properties like getters, state, and actions, using a pre-defined 'computed' merge strategy for its sub-properties.

```javascript
const merge = Vue.config.optionMergeStrategies.computed;
Vue.config.optionMergeStrategies.vuex = function (toVal, fromVal) {
  if (!toVal) return fromVal;
  if (!fromVal) return toVal;
  return {
    getters: merge(toVal.getters, fromVal.getters),
    state: merge(toVal.state, fromVal.state),
    actions: merge(toVal.actions, fromVal.actions)
  };
}
```

--------------------------------

### Vue.js: Deprecated Named Slot Usage with `slot` Attribute (Direct Element)

Source: https://v2.vuejs.org/v2/guide/components-slots

This example demonstrates the deprecated usage of the `slot` attribute directly on normal HTML elements to target named slots. It shows how to assign content to 'header' and 'footer' slots within a `<base-layout>` component.

```html
<base-layout>
  <h1 slot="header">Here might be a page title</h1>

  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <p slot="footer">Here's some contact info</p>
</base-layout>
```

--------------------------------

### Vue.js Form HTML Structure

Source: https://v2.vuejs.org/v2/cookbook/form-validation

The HTML structure for a Vue.js form that collects a product name. It includes basic error display using `v-if` and `v-for`, input binding with `v-model`, and form submission handling. The form is linked to a Vue instance via the `id='app'` attribute.

```html
<form
  id="app"
  @submit="checkForm"
  method="post"
>
  
  <p v-if="errors.length">
    <b>Please correct the following error(s):</b>
    <ul>
      <li v-for="error in errors">{{ error }}</li>
    </ul>
  </p>
  
  <p>
    <label for="name">New Product Name: </label>
    <input
      id="name"
      v-model="name"
      type="text"
      name="name"
    >
  </p>
  
  <p>
    <input
      type="submit"
      value="Submit"
    >
  </p>
  
</form>
```

--------------------------------

### Define a Vue.js Button Counter Component

Source: https://v2.vuejs.org/v2/guide/components

This snippet defines a reusable Vue component named 'button-counter'. It manages a 'count' data property and uses a template to display a button that increments the count when clicked. This is a fundamental example of creating a custom, interactive element in Vue.

```javascript
Vue.component('button-counter', {
  data: function () {
    return {
      count: 0
    }
  },
  template: '<button v-on:click="count++">You clicked me {{ count }} times.</button>'
})
```

--------------------------------

### Vue.js updated Hook Example

Source: https://v2.vuejs.org/v2/api

The `updated` hook is called after a data change causes the virtual DOM to be re-rendered and patched. Use `$nextTick` within this hook to ensure operations run after the entire view has been re-rendered. This hook is not called during server-side rendering.

```javascript
updated: function () {
  this.$nextTick(function () {
    // Code that will run only after the
    // entire view has been re-rendered
  })
}
```

--------------------------------

### Caching Components with `<keep-alive>` in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-dynamic-async

This example shows how to wrap a dynamic <component> with the <keep-alive> directive. This directive caches inactive component instances, preventing them from being re-rendered and destroyed when switching away, thus preserving their state. Components within <keep-alive> must have a name defined.

```html
<keep-alive>
  <component v-bind:is="currentTabComponent"></component>
</keep-alive>
```

--------------------------------

### Self-Closing Component Syntax in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Demonstrates the correct usage of self-closing component tags in different Vue.js template contexts. Self-closing tags are recommended for components with no content to improve code clarity and conciseness. This is applicable in Single-File Components (SFCs), string templates, and JSX, but not in DOM templates where full closing tags are required by HTML specifications.

```vue
<!-- In single-file components, string templates, and JSX -->
<MyComponent/>
```

```html
<!-- In DOM templates -->
<my-component></my-component>
```

--------------------------------

### Animate CSS Color Changes with Vue.js, Tween.js, and Color.js

Source: https://v2.vuejs.org/v2/guide/transitioning-state

This example shows how to animate changes to CSS colors in Vue.js. It uses `v-model` for color input, `watch` to detect color changes, and a combination of Tween.js for animation and Color.js for color manipulation. The `tweenedCSSColor` computed property converts the animated color values to a CSS-compatible string. Requires Tween.js and Color.js libraries.

```html
<script src="https://cdn.jsdelivr.net/npm/tween.js@16.3.4"></script>  
<script src="https://cdn.jsdelivr.net/npm/color-js@1.0.3"></script>  
  
<div id="example-7">  
  <input  
    v-model="colorQuery"  
    v-on:keyup.enter="updateColor"  
    placeholder="Enter a color"  
  >
  <button v-on:click="updateColor">Update</button>  
  <p>Preview:</p>  
  <span  
    v-bind:style="{ backgroundColor: tweenedCSSColor }"  
    class="example-7-color-preview"
  ></span>  
  <p>{{ tweenedCSSColor }}</p>  
</div>  
```

```javascript
var Color = net.brehaut.Color  
  
new Vue({
  el: '#example-7',
  data: {
    colorQuery: '',
    color: {
      red: 0,
      green: 0,
      blue: 0,
      alpha: 1
    },
    tweenedColor: {}
  },
  created: function () {
    this.tweenedColor = Object.assign({}, this.color)
  },
  watch: {
    color: function () {
      function animate () {
        if (TWEEN.update()) {
          requestAnimationFrame(animate)
        }
      }

      new TWEEN.Tween(this.tweenedColor)
        .to(this.color, 750)
        .start()

      animate()
    }
  },
  computed: {
    tweenedCSSColor: function () {
      return new Color({
        red: this.tweenedColor.red,
        green: this.tweenedColor.green,
        blue: this.tweenedColor.blue,
        alpha: this.tweenedColor.alpha
      }).toCSS()
    }
  },
  methods: {
    updateColor: function () {
      this.color = new Color(this.colorQuery).toRGB()
      this.colorQuery = ''
    }
  }
})
```

```css
.example-7-color-preview {  
  display: inline-block;  
  width: 50px;  
  height: 50px;  
}  
```

--------------------------------

### Accessing Child Component Instance with Ref (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Assign a 'ref' attribute to a child component in the template to get a direct reference to its instance in the parent. This is useful for imperative actions like focusing an input. Refs are populated after render and are not reactive.

```html
<base-input ref="usernameInput"></base-input>
```

```javascript
this.$refs.usernameInput
```

--------------------------------

### Dockerfile for Vue.js App with NGINX (Multi-stage)

Source: https://v2.vuejs.org/v2/cookbook/dockerize-vuejs-app

This multi-stage Dockerfile builds a Vue.js application in a 'build' stage using Node.js and then serves the production-ready static files using NGINX in a separate 'production' stage. This approach is optimized for smaller production image sizes.

```dockerfile
# build stage  
FROM node:lts-alpine as build-stage  
WORKDIR /app  
COPY package*.json ./
RUN npm install  
COPY . .
RUN npm run build  
  
# production stage  
FROM nginx:stable-alpine as production-stage  
COPY --from=build-stage /app/dist /usr/share/nginx/html  
EXPOSE 80  
CMD ["nginx", "-g", "daemon off;"]  

```

--------------------------------

### Replace `capitalize` Filter (JavaScript)

Source: https://v2.vuejs.org/v2/guide/migration

Provides a JavaScript snippet to replace the Vue.js `capitalize` filter. This function takes a string and returns a new string with the first character converted to uppercase and the rest of the string unchanged. It's useful for proper noun formatting.

```javascript
text[0].toUpperCase() + text.slice(1)
```

--------------------------------

### Annotate Vue Component Method and Computed Property Return Types

Source: https://v2.vuejs.org/v2/guide/typescript

This example illustrates the necessity of annotating return types for methods like `greet` and computed properties like `greeting` in Vue.js components when using TypeScript. It also shows how to correctly annotate the `render` function's return type (`VNode`) for better type inference.

```typescript
import Vue, { VNode } from 'vue'
  
const Component = Vue.extend({
  data () {
    return {
      msg: 'Hello'
    }
  },
  methods: {
    greet (): string {
      return this.msg + ' world'
    }
  },
  computed: {
    greeting(): string {
      return this.greet() + '!'
    }
  },
  render (createElement): VNode {
    return createElement('div', this.greeting)
  }
})
```

--------------------------------

### Use Component with Props in Vue.js

Source: https://v2.vuejs.org/v2/guide/components

Demonstrates how to use the 'blog-post' component and pass static string data to its 'title' prop. This is useful for simple, predefined content.

```html
<blog-post title="My journey with Vue"></blog-post>
<blog-post title="Blogging with Vue"></blog-post>
<blog-post title="Why Vue is so fun"></blog-post>
```

--------------------------------

### Vue.js Form Validation Logic (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/form-validation

The JavaScript code for a Vue.js application that handles form submission and server-side validation. It uses `fetch` to send the product name to a Netlify function, checks the response status (204 for success, 400 for errors), and updates the `errors` array accordingly. The `checkForm` method prevents default form submission and performs a basic client-side check for an empty name.

```javascript
const apiUrl = 'https://vuecookbook.netlify.app/.netlify/functions/product-name?name=';

const app = new Vue({
  el: '#app',
  data: {
    errors: [],
    name: ''
  },
  methods:{
    checkForm: function (e) {
      e.preventDefault();

      this.errors = [];

      if (this.name === '') {
        this.errors.push('Product name is required.');
      } else {
        fetch(apiUrl + encodeURIComponent(this.name))
        .then(async res => {
          if (res.status === 204) {
            alert('OK');
          } else if (res.status === 400) {
            let errorResponse = await res.json();
            this.errors.push(errorResponse.error);
          }
        });
      }
    }
  }
})
```

--------------------------------

### Vue Instance for Transition Control

Source: https://v2.vuejs.org/v2/guide/transitions

JavaScript code for a Vue instance that controls the visibility of an element targeted by a transition component. It initializes the 'show' data property and binds the instance to the '#demo' element.

```javascript
new Vue({
  el: '#demo',
  data: {
    show: true
  }
})

```

--------------------------------

### Add Markers and Polylines to Map (Vue.js)

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This snippet demonstrates how to add custom markers and polylines to a Google Map within a Vue.js application. It utilizes the previously defined factory components (`GoogleMapMarker`, `GoogleMapLine`) and iterates over data arrays to render multiple elements, passing necessary props like `google`, `map`, `marker`, and `path`.

```html
<GoogleMapLoader 
  :mapConfig="mapConfig"  
  apiKey="yourApiKey"
>
  <template slot-scope="{ google, map }">
    <GoogleMapMarker 
      v-for="marker in markers"
      :key="marker.id"
      :marker="marker"
      :google="google"
      :map="map"
    />
    <GoogleMapLine 
      v-for="line in lines"
      :key="line.id"
      :path.sync="line.path"
      :google="google"
      :map="map"
    />
  </template>
</GoogleMapLoader>
```

```javascript
import { mapSettings } from '@/constants/mapSettings'  

export default {
  components: {
    GoogleMapLoader,
    GoogleMapMarker,
    GoogleMapLine
  },

  data () {
    return {
      markers: [
      { id: 'a', position: { lat: 3, lng: 101 } },
      { id: 'b', position: { lat: 5, lng: 99 } },
      { id: 'c', position: { lat: 6, lng: 97 } },
      ],
      lines: [
        { id: '1', path: [{ lat: 3, lng: 101 }, { lat: 5, lng: 99 }] },
        { id: '2', path: [{ lat: 5, lng: 99 }, { lat: 6, lng: 97 }] }
      ],
    }
  },

  computed: {
    mapConfig () {
      return {
        ...mapSettings,
        center: this.mapCenter
      }
    },

    mapCenter () {
      return this.markers[1].position
    }
  },
}
```

--------------------------------

### Vue.js: Multiline Text Input Binding with v-model

Source: https://v2.vuejs.org/v2/guide/forms

Shows how to use `v-model` with a `<textarea>` element for multiline text input. It binds the textarea's content to the 'message' data property, allowing for two-way data binding. This example also demonstrates displaying the multiline content using a `<p>` tag with `white-space: pre-line;`.

```html
<span>Multiline message is:</span>
<p style="white-space: pre-line;">{{ message }}</p>
<br>
<textarea v-model="message" placeholder="add multiple lines"></textarea>
```

--------------------------------

### Vue.js Unit Test: Refactored with Factory Function

Source: https://v2.vuejs.org/v2/cookbook/unit-testing-vue-components

An improved unit test suite for a Vue.js component using a factory function to create component instances. This approach consolidates setup, allowing each test to focus on a single assertion for better clarity and maintainability. It tests the welcome message, error rendering for short usernames, and correct error suppression for valid usernames.

```javascript
import { shallowMount } from '@vue/test-utils'
import Foo from './Foo'

const factory = (values = {}) => {
  return shallowMount(Foo, {
    data () {
      return {
        ...values
      }
    }
  })
}

describe('Foo', () => {
  it('renders a welcome message', () => {
    const wrapper = factory()

    expect(wrapper.find('.message').text()).toEqual("Welcome to the Vue.js cookbook")
  })

  it('renders an error when username is less than 7 characters', () => {
    const wrapper = factory({ username: '' })

    expect(wrapper.find('.error').exists()).toBeTruthy()
  })

  it('renders an error when username is whitespace', () => {
    const wrapper = factory({ username: ' '.repeat(7) })

    expect(wrapper.find('.error').exists()).toBeTruthy()
  })

  it('does not render an error when username is 7 characters or more', () => {
    const wrapper = factory({ username: 'Lachlan' })

    expect(wrapper.find('.error').exists()).toBeFalsy()
  })
})

```

--------------------------------

### Immediate Callback with vm.$watch immediate option

Source: https://v2.vuejs.org/v2/api

Trigger the watcher's callback immediately upon creation by setting `{ immediate: true }` in the options. The callback will receive the current value of the watched expression without waiting for the first change.

```javascript
vm.$watch('a', callback, {
  immediate: true
})
// `callback` is fired immediately with current value of `a`
```

--------------------------------

### Vue Parent-Child Communication: Props and Events

Source: https://v2.vuejs.org/v2/style-guide

For parent-child component communication in Vue, prefer using props for passing data down and emitting events for passing data up. Avoid direct prop mutation or using `this.$parent`, as these patterns can lead to less predictable state flow and harder-to-maintain code. This 'props down, events up' approach enhances component reusability and understanding.

```javascript
Vue.component('TodoItem', {
  props: {
    todo: {
      type: Object,
      required: true
    }
  },
  template: '
    <input
      :value="todo.text"
      @input="$emit(\'input\', $event.target.value)"
    >
  '
})
```

```javascript
Vue.component('TodoItem', {
  props: {
    todo: {
      type: Object,
      required: true
    }
  },
  template: '
    <span>
      {{ todo.text }}
      <button @click="$emit(\'delete\')">
        X
      </button>
    </span>
  '
})
```

--------------------------------

### Replace detached lifecycle hook with destroyed and $nextTick in Vue.js

Source: https://v2.vuejs.org/v2/guide/migration

The `detached` lifecycle hook has been removed. To achieve similar functionality, use the `destroyed` hook combined with `this.$nextTick` to ensure DOM operations occur after the component is destroyed and the next DOM update cycle.

```javascript
detached: function () {
  doSomething()
}
```

```javascript
destroyed: function () {
  this.$nextTick(function () {
    doSomething()
  })
}
```

--------------------------------

### vm.$nextTick( [callback] )

Source: https://v2.vuejs.org/v2/api

Defers the execution of a callback until the next DOM update cycle.

```APIDOC
## vm.$nextTick( [callback] )

### Description
Defers the callback to be executed after the next DOM update cycle. Useful for waiting for DOM updates after data changes.

### Method
`$nextTick`

### Endpoint
N/A (Instance Method)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```javascript
new Vue({
  // ...
  methods: {
    example: function () {
      // modify data
      this.message = 'changed'
      // DOM is not updated yet
      this.$nextTick(function () {
        // DOM is now updated
        // `this` is bound to the current instance
        this.doSomethingElse()
      })
    }
  }
})
```

### Response
#### Success Response (200)
Returns a Promise if no callback is provided and Promises are supported.

#### Response Example
N/A
```

--------------------------------

### Component Configuration Options

Source: https://v2.vuejs.org/v2/api

Explains various configuration options available for Vue.js components, including delimiters, functional components, model customization, attribute inheritance, and comment handling.

```APIDOC
## Component Configuration Options

### delimiters
  * **Type:** `Array<string>`
  * **Default:** `["{{, }}"]`
  * **Restrictions:** Only available in the full build with in-browser compilation.
  * **Details:** Allows customization of plain text interpolation delimiters.
  * **Example:**
    ```javascript
    new Vue({
      delimiters: ['${', '}']
    })
    ```

### functional
  * **Type:** `boolean`
  * **Details:** Configures a component to be stateless and instanceless, functioning solely as a render function for efficiency.

### model
  * **Type:** `{ prop?: string, event?: string }`
  * **Details:** Enables customization of the prop and event used by `v-model` for custom components. Defaults to `value` prop and `input` event.
  * **Example:**
    ```javascript
    Vue.component('my-checkbox', {
      model: {
        prop: 'checked',
        event: 'change'
      },
      props: {
        value: String,
        checked: {
          type: Number,
          default: 0
        }
      }
      // ...
    })
    ```

### inheritAttrs
  * **Type:** `boolean`
  * **Default:** `true`
  * **Details:** Controls whether non-prop attribute bindings from the parent scope fall through to the component's root element. Setting to `false` disables this behavior, making attributes available via `$attrs`.
  * **Note:** Does not affect `class` and `style` bindings.

### comments
  * **Type:** `boolean`
  * **Default:** `false`
  * **Restrictions:** Only available in the full build with in-browser compilation.
  * **Details:** When `true`, preserves and renders HTML comments in templates; otherwise, they are discarded.
```

--------------------------------

### Vue.js Form Validation Logic

Source: https://v2.vuejs.org/v2/cookbook/form-validation

This JavaScript code defines a Vue instance that manages form data and validation. It initializes form fields and an errors array. The `checkForm` method is called on form submission to validate the 'name' and 'age' fields, adding errors to the `errors` array if validation fails and preventing default submission.

```javascript
const app = new Vue({
  el: '#app',
  data: {
    errors: [],
    name: null,
    age: null,
    movie: null
  },
  methods:{
    checkForm: function (e) {
      if (this.name && this.age) {
        return true;
      }

      this.errors = [];

      if (!this.name) {
        this.errors.push('Name required.');
      }
      if (!this.age) {
        this.errors.push('Age required.');
      }

      e.preventDefault();
    }
  }
})
```

--------------------------------

### Vue.js: Using Scoped Slot for Custom Todo Item Rendering

Source: https://v2.vuejs.org/v2/guide/components-slots

This example demonstrates how a parent component can use a scoped slot to customize the rendering of todo items provided by a child component (e.g., `<todo-list>`). It defines a template for the 'todo' slot, receiving the 'todo' object and conditionally rendering a checkmark based on `todo.isComplete`.

```html
<todo-list v-bind:todos="todos">
  <template v-slot:todo="{ todo }">
    <span v-if="todo.isComplete">✓</span>
    {{ todo.text }}
  </template>
</todo-list>
```

--------------------------------

### Vue.js Custom Email Validation Logic (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/form-validation

JavaScript code for a Vue.js application that implements custom form validation. It includes methods to check for required fields and validate the email format using a regular expression. Errors are collected in an array and displayed to the user.

```javascript
const app = new Vue({
  el: '#app',
  data: {
    errors: [],
    name: null,
    email: null,
    movie: null
  },
  methods: {
    checkForm: function (e) {
      this.errors = [];

      if (!this.name) {
        this.errors.push("Name required.");
      }
      if (!this.email) {
        this.errors.push('Email required.');
      } else if (!this.validEmail(this.email)) {
        this.errors.push('Valid email required.');
      }

      if (!this.errors.length) {
        return true;
      }

      e.preventDefault();
    },
    validEmail: function (email) {
      var re = /^(([^<>()[]\.,;:s@"]+(.[^<>()[]\.,;:s@"]+)*)|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$/;
      return re.test(email);
    }
  }
})
```

--------------------------------

### Importing SFC using browser field in package.json

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

This demonstrates how to import a Single File Component (SFC) from a package. The 'browser' field in package.json allows bundlers to resolve a specific alias to the component's source file, enabling SSR optimizations.

```javascript
import MyComponent from 'my-component/sfc'; // Note the '/sfc'
```

--------------------------------

### Vue.js: Radio Button Binding with v-model

Source: https://v2.vuejs.org/v2/guide/forms

Shows how to bind radio buttons to a data property using `v-model`. The `value` of the selected radio button is assigned to the 'picked' data property. This example demonstrates how to group radio buttons and display the user's selection.

```html
<input type="radio" id="one" value="One" v-model="picked">
<label for="one">One</label>
<br>
<input type="radio" id="two" value="Two" v-model="picked">
<label for="two">Two</label>
<br>
<span>Picked: {{ picked }}</span>
```

--------------------------------

### HTML Structure for Bitcoin Price Display

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

Provides the HTML structure for the Vue application, including a main container, a heading, and a loop to display currency descriptions, symbols, and formatted prices. It uses Vue's data binding and directives.

```html
<div id="app">  
  <h1>Bitcoin Price Index</h1>  
  <div  
    v-for="currency in info"
    class="currency"  
  >
    {{ currency.description }}:  
    <span class="lighten">  
      <span v-html="currency.symbol"></span>{{ currency.rate_float | currencydecimal }}
    </span>  
  </div>  
</div>  
```

--------------------------------

### Dynamic Sizing of SVG Icons in Vue.js

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

Illustrates how to dynamically adjust the size of an SVG icon component in Vue.js by passing `width` and `height` props to the `icon-base` component. It shows examples of using default sizes and custom smaller or larger sizes.

```vue
<p>  
  <!-- you can pass in a smaller `width` and `height` as props -->  
  <icon-base  
    width="12"
    height="12"
    icon-name="write"
  ><icon-write /></icon-base>  
  <!-- or you can use the default, which is 18 -->  
  <icon-base icon-name="write"><icon-write /></icon-base>  
  <!-- or make it a little bigger too :) -->  
  <icon-base  
    width="30"
    height="30"
    icon-name="write"
  ><icon-write /></icon-base>  
</p>
```

--------------------------------

### Dynamically Render Components with v-bind in Vue.js

Source: https://v2.vuejs.org/v2/guide/components

Renders multiple 'blog-post' components using 'v-for' to iterate over a 'posts' array. 'v-bind:key' is used for efficient list rendering, and 'v-bind:title' dynamically passes the 'title' property from each post object to the component's 'title' prop.

```html
<blog-post 
  v-for="post in posts"
  v-bind:key="post.id"
  v-bind:title="post.title"
></blog-post>
```

--------------------------------

### Vue.js Watcher Options

Source: https://v2.vuejs.org/v2/api

Demonstrates various ways to define watchers in Vue.js, including simple callbacks, string method names, deep watching, immediate execution, and arrays of handlers. Also shows watching nested properties.

```javascript
var vm = new Vue({
  data: {
    a: 1,
    b: 2,
    c: 3,
    d: 4,
    e: {
      f: {
        g: 5
      }
    }
  },
  watch: {
    a: function (val, oldVal) {
      console.log('new: %s, old: %s', val, oldVal)
    },
    // string method name
    b: 'someMethod',
    // the callback will be called whenever any of the watched object properties change regardless of their nested depth
    c: {
      handler: function (val, oldVal) { /* ... */ },
      deep: true
    },
    // the callback will be called immediately after the start of the observation
    d: {
      handler: 'someMethod',
      immediate: true
    },
    // you can pass array of callbacks, they will be called one-by-one
    e: [
      'handle1',
      function handle2 (val, oldVal) { /* ... */ },
      {
        handler: function handle3 (val, oldVal) { /* ... */ },
        /* ... */
      }
    ],
    // watch vm.e.f's value: {g: 5}
    'e.f': function (val, oldVal) { /* ... */ }
  }
})
vm.a = 2 // => new: 2, old: 1
```

--------------------------------

### Control CSS Injection with Vue.js Style Bindings

Source: https://v2.vuejs.org/v2/guide/security

Securely apply user-defined styles in Vue.js by using the object syntax for style bindings (`v-bind:style`). This allows you to restrict user input to specific, safe CSS properties, preventing clickjacking attacks. Avoid rendering `<style>` tags directly with user content, and consider sandboxed iframes for full CSS control.

```html
<a
  v-bind:href="sanitizedUrl"
  v-bind:style="{
    color: userProvidedColor,
    background: userProvidedBackground
  }"
>
  click me
</a>
```

--------------------------------

### Vue $mount: Manually mount an instance

Source: https://v2.vuejs.org/v2/api

The $mount method is used to manually mount a Vue instance to a DOM element if the 'el' option was not provided during instantiation. It returns the instance itself, allowing for method chaining. If no argument is provided, the template renders off-document.

```javascript
var MyComponent = Vue.extend({
  template: '<div>Hello!</div>'
})

// create and mount to #app (will replace #app)
new MyComponent().$mount('#app')

// or, render off-document and append afterwards:
var component = new MyComponent().$mount()
document.getElementById('app').appendChild(component.$el)
```

--------------------------------

### Vue.js: Watch Route Changes and Fetch Posts

Source: https://v2.vuejs.org/v2/cookbook/serverless-blog

This snippet demonstrates how to watch for route changes in a Vue.js application using `$route`. When the route changes, it triggers a method to fetch posts. This is useful for dynamically updating content based on the URL.

```javascript
    $route: {
      immediate: true,
      handler(to, from) {
        this.getPost()
      }
    }
  }
}
</script>
```

--------------------------------

### Replace coerce prop option with computed property in Vue.js

Source: https://v2.vuejs.org/v2/guide/migration

The `coerce` option for props has been removed. To achieve prop coercion, define a local computed property that processes the prop's value. This approach also provides better clarity by naming the coerced value.

```javascript
props: {
  username: {
    type: String,
    coerce: function (value) {
      return value
        .toLowerCase()
        .replace(/\s+/, '-')
    }
  }
}
```

```javascript
props: {
  username: String,
},
computed: {
  normalizedUsername: function () {
    return this.username
      .toLowerCase()
      .replace(/\s+/, '-')
  }
}
```

--------------------------------

### CSS Styling for Bitcoin Price App

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

Defines the CSS styles for the Vue application's user interface. It includes styles for centering content, background colors, fonts, layout, and specific elements like the main container and price display.

```css
body {
  display: flex;
  justify-content: center;
  background: #7E8D85;
  font-family: 'Roboto Slab', serif;
  line-height: 1.4;
}

#app {
  margin-top: 20px;
  width: 300px;
  padding: 0 40px 40px;
  background: #2F242C;
  border-radius: 5px;
  color: #B3BFB8;
}

h1 {
  color: #F0F7F4;
}

.lighten {
  color: white;
}
```

--------------------------------

### Using Instance Methods with Prototype Context in Vue

Source: https://v2.vuejs.org/v2/cookbook/adding-instance-properties

Demonstrates how to add a method ('$reverseText') to Vue.prototype, leveraging JavaScript's prototype method context. This allows the method to access and modify instance properties using `this`. The example shows reversing a 'message' data property within a Vue instance's created hook.

```javascript
Vue.prototype.$reverseText = function(propertyName) {
  this[propertyName] = this[propertyName]
    .split('')
    .reverse()
    .join('')
}

new Vue({
  data: {
    message: 'Hello'
  },
  created: function() {
    console.log(this.message) // => "Hello"
    this.$reverseText('message')
    console.log(this.message) // => "olleH"
  }
})
```

--------------------------------

### Vue.js Instance Mount Element (el)

Source: https://v2.vuejs.org/v2/api

Explains the 'el' option in Vue.js for mounting an instance to an existing DOM element. It can be a CSS selector or an HTMLElement, and the resolved element is available as vm.$el after mounting.

```javascript
var vm = new Vue({
  el: '#app',
  // ... other options
  data: {
    message: 'Hello Vue!'
  }
})
```

--------------------------------

### Vue.js: Resolve Circular Component References with require

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

This snippet demonstrates how to resolve circular references between Vue.js components when using a module system like Webpack. By delaying the registration of a component within the `beforeCreate` lifecycle hook using `require`, the module system can avoid getting stuck in an infinite loop.

```javascript
beforeCreate: function () {
  this.$options.components.TreeFolderContents = require('./tree-folder-contents.vue').default
}
```

--------------------------------

### Optimize v-for and v-if Directive Usage in Vue.js

Source: https://v2.vuejs.org/v2/style-guide

Demonstrates how to optimize the performance of v-for and v-if directives in Vue.js. It shows inefficient usage where v-if is inside v-for, leading to unnecessary iterations, and the optimized approach using computed properties or moving v-if to a parent element. This improves rendering efficiency and logic decoupling.

```Vue.js
<ul>
  <li
    v-for="user in users"
    v-if="user.isActive"
    :key="user.id"
  >
    {{ user.name }}
  </li>
</ul>
```

```JavaScript
this.users.map(function (user) {
  if (user.isActive) {
    return user.name
  }
})
```

```Vue.js
computed: {
  activeUsers: function () {
    return this.users.filter(function (user) {
      return user.isActive
    })
  }
}
```

```Vue.js
<ul>
  <li
    v-for="user in activeUsers"
    :key="user.id"
  >
    {{ user.name }}
  </li>
</ul>
```

```Vue.js
<ul>
  <li
    v-for="user in users"
    v-if="shouldShowUsers"
    :key="user.id"
  >
    {{ user.name }}
  </li>
</ul>
```

```Vue.js
<ul v-if="shouldShowUsers">
  <li
    v-for="user in users"
    :key="user.id"
  >
    {{ user.name }}
  </li>
</ul>
```

--------------------------------

### Vue.js Custom Directive: Pin Element (Static)

Source: https://v2.vuejs.org/v2/guide/custom-directive

This example demonstrates a Vue.js custom directive 'pin' that applies fixed positioning to an element. The directive's 'bind' hook sets the element's 'position' style to 'fixed' and its 'top' style based on the directive's value, useful for creating sticky elements.

```javascript
Vue.directive('pin', {
  bind: function (el, binding, vnode) {
    el.style.position = 'fixed'
    el.style.top = binding.value + 'px'
  }
})

new Vue({
  el: '#baseexample'
})
```

--------------------------------

### Async Component with Promise and Dynamic Imports (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-dynamic-async

This snippet illustrates defining an asynchronous component by returning a Promise from the factory function, leveraging dynamic imports (supported by Webpack 2 and ES2015). This provides a more modern approach to handling asynchronous component loading.

```javascript
Vue.component(
  'async-webpack-example',
  // A dynamic import returns a Promise.
  () => import('./my-async-component')
)
```

--------------------------------

### Vue.js Custom Directive: Object Literals for Multiple Values

Source: https://v2.vuejs.org/v2/guide/custom-directive

This example shows how to use JavaScript object literals to pass multiple named values to a custom Vue.js directive. The directive function receives the object in 'binding.value', allowing access to individual properties. This enables more complex directive configurations.

```html
<div v-demo="{ color: 'white', text: 'hello!' }"></div>
```

```javascript
Vue.directive('demo', function (el, binding) {
  console.log(binding.value.color) // => "white"
  console.log(binding.value.text)  // => "hello!"
})
```

--------------------------------

### vm.$mount( [elementOrSelector] )

Source: https://v2.vuejs.org/v2/api

Manually mounts an unmounted Vue instance to a DOM element. Returns the instance itself.

```APIDOC
## vm.$mount( [elementOrSelector] )

### Description
Manually starts the mounting process of an unmounted Vue instance. If no element is provided, the instance is rendered off-document.

### Method
`$mount`

### Endpoint
N/A (Instance Method)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```javascript
var MyComponent = Vue.extend({
  template: '<div>Hello!</div>'
})

// create and mount to #app (will replace #app)
new MyComponent().$mount('#app')

// or, render off-document and append afterwards:
var component = new MyComponent().$mount()
document.getElementById('app').appendChild(component.$el)
```

### Response
#### Success Response (200)
`vm` - the instance itself

#### Response Example
N/A
```

--------------------------------

### Vue Custom Scroll Directive with GSAP Animation

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This snippet defines a custom Vue.js directive 'v-scroll' that listens for scroll events. When the scroll threshold is met, it triggers a GSAP TweenMax animation on the element. It includes the main Vue application setup to handle the scroll logic.

```javascript
Vue.directive('scroll', {
  inserted: function (el, binding) {
    let f = function (evt) {
      if (binding.value(evt, el)) {
        window.removeEventListener('scroll', f)
      }
    }
    window.addEventListener('scroll', f)
  }
})

// main app
new Vue({
  el: '#app',
  methods: {
    handleScroll: function (evt, el) {
      if (window.scrollY > 50) {
        TweenMax.to(el, 1.5, {
          y: -10,
          opacity: 1,
          ease: Sine.easeOut
        })
      }
      return window.scrollY > 100
    }
  }
})
```

--------------------------------

### Initialize Parent Component with Data for Font Size Control

Source: https://v2.vuejs.org/v2/guide/components

Sets up the root Vue instance with a 'posts' array and a 'postFontSize' data property to manage the font size of blog posts. This serves as the central state for the font enlargement feature.

```javascript
new Vue({
  el: '#blog-posts-events-demo',
  data: {
    posts: [/* ... */],
    postFontSize: 1
  }
})
```

--------------------------------

### HTML Form Structure for Vue Validation

Source: https://v2.vuejs.org/v2/cookbook/form-validation

This HTML snippet defines a form with three input fields: name, age, and favorite movie. It includes a section to display validation errors and uses Vue's v-model for data binding. The form also has a submit handler (@submit) that triggers the validation logic.

```html
<form
  id="app"
  @submit="checkForm"
  action="https://vuejs.org/"
  method="post"
>

  <p v-if="errors.length">
    <b>Please correct the following error(s):</b>
    <ul>
      <li v-for="error in errors">{{ error }}</li>
    </ul>
  </p>

  <p>
    <label for="name">Name</label>
    <input
      id="name"
      v-model="name"
      type="text"
      name="name"
    >
  </p>

  <p>
    <label for="age">Age</label>
    <input
      id="age"
      v-model="age"
      type="number"
      name="age"
      min="0"
    >
  </p>

  <p>
    <label for="movie">Favorite Movie</label>
    <select
      id="movie"
      v-model="movie"
      name="movie"
    >
      <option>Star Wars</option>
      <option>Vanilla Sky</option>
      <option>Atomic Blonde</option>
    </select>
  </p>

  <p>
    <input
      type="submit"
      value="Submit"
    >
  </p>

</form>
```

--------------------------------

### Replace `filterBy` with `.filter()` in Computed Property (Vue.js)

Source: https://v2.vuejs.org/v2/guide/migration

Demonstrates replacing the `filterBy` filter with JavaScript's native `.filter()` method in a computed property. This method allows for more complex filtering logic, including case-insensitive string matching. It takes an array of objects and a search query, returning filtered results.

```html
<p v-for="user in filteredUsers">{{ user.name }}</p>
```

```javascript
computed: {
  filteredUsers: function () {
    var self = this
    return self.users.filter(function (user) {
      return user.name.indexOf(self.searchQuery) !== -1
    })
  }
}
```

--------------------------------

### Vue.js JavaScript for Budget Allocation Validation

Source: https://v2.vuejs.org/v2/cookbook/form-validation

This JavaScript code initializes a Vue.js application to manage form data and validation. It defines data properties for feature budgets, computed property for the total sum, and a method to check the form's validity. The `checkForm` method ensures the total budget equals 100 before allowing form submission. It also handles a known Vue.js issue with number inputs returning strings when empty.

```javascript
const app = new Vue({
  el: '#app',
  data:{
    errors: [],
    weapons: 0,
    shields: 0,
    coffee: 0,
    ac: 0,
    mousedroids: 0
  },
  computed: {
     total: function () {
       // must parse because Vue turns empty value to string
       return Number(this.weapons) +
         Number(this.shields) +
         Number(this.coffee) +
         Number(this.ac+this.mousedroids);
     }
  },
  methods:{
    checkForm: function (e) {
      this.errors = [];

      if (this.total != 100) {
        this.errors.push('Total must be 100!');
      }

      if (!this.errors.length) {
        return true;
      }

      e.preventDefault();
    }
  }
})
```

--------------------------------

### Vue.js Reactivity: Initializing Reactive Data

Source: https://v2.vuejs.org/v2/guide/reactivity

Demonstrates how Vue makes properties reactive when they are initialized in the `data` object. Properties added after initialization are not reactive.

```javascript
var vm = new Vue({
  data: {
    a: 1
  }
})
// `vm.a` is now reactive
vm.b = 2
// `vm.b` is NOT reactive
```

--------------------------------

### Vue.js Form for Budget Allocation Validation

Source: https://v2.vuejs.org/v2/cookbook/form-validation

This HTML structure defines a form for a budget allocation task. It includes input fields for various features and displays error messages and the current total. The form uses Vue.js directives for data binding and submission handling. It's designed to work with the provided JavaScript for validation.

```html
<form  
  id="app"  
  @submit="checkForm"  
  action="https://vuejs.org/"  
  method="post"  
  novalidate="true"  
>
  
  <p v-if="errors.length">  
    <b>Please correct the following error(s):</b>  
    <ul>  
      <li v-for="error in errors">{{ error }}</li>  
    </ul>  
  </p>  
  
  <p>  
    Given a budget of 100 dollars, indicate how much  
    you would spend on the following features for the  
    next generation Star Destroyer. Your total must sum up to 100.  
  </p>  
  
  <p>  
    <input  
      v-model.number="weapons"  
      type="number"  
      name="weapons"  
    > Weapons <br/>  
    <input  
      v-model.number="shields"  
      type="number"  
      name="shields"  
    > Shields <br/>  
    <input  
      v-model.number="coffee"  
      type="number"  
      name="coffee"  
    > Coffee <br/>  
    <input  
      v-model.number="ac"  
      type="number"  
      name="ac"  
    > Air Conditioning <br/>  
    <input  
      v-model.number="mousedroids"  
      type="number"  
      name="mousedroids"  
    > Mouse Droids <br/>  
  </p>  
  
  <p>  
    Current Total: {{total}}  
  </p>  
  
  <p>  
    <input  
      type="submit"  
      value="Submit"  
    >  
  </p>  
  
</form>
```

--------------------------------

### Passing Static and Dynamic Props in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-props

Illustrates how to pass static and dynamic props to a Vue component. It shows the usage of `v-bind` (or its shorthand `:`) for dynamic prop binding, enabling the passing of JavaScript expressions, variables, and complex data structures.

```html
<!-- Passing a static string prop -->
<blog-post title="My journey with Vue"></blog-post>

<!-- Dynamically assign the value of a variable -->
<blog-post v-bind:title="post.title"></blog-post>

<!-- Dynamically assign the value of a complex expression -->
<blog-post
  v-bind:title="post.title + ' by ' + post.author.name"
></blog-post>
```

```html
<!-- Passing a static Number prop -->
<blog-post v-bind:likes="42"></blog-post>

<!-- Dynamically assign to the value of a variable -->
<blog-post v-bind:likes="post.likes"></blog-post>
```

```html
<!-- Passing a static Boolean prop (implied true) -->
<blog-post is-published></blog-post>

<!-- Passing a static Boolean prop (explicit false) -->
<blog-post v-bind:is-published="false"></blog-post>

<!-- Dynamically assign to the value of a variable -->
<blog-post v-bind:is-published="post.isPublished"></blog-post>
```

```html
<!-- Passing a static Array prop -->
<blog-post v-bind:comment-ids="[234, 266, 273]"></blog-post>

<!-- Dynamically assign to the value of a variable -->
<blog-post v-bind:comment-ids="post.commentIds"></blog-post>
```

```html
<!-- Passing a static Object prop -->
<blog-post
  v-bind:author="{
    name: 'Veronica',
    company: 'Veridian Dynamics'
  }"
></blog-post>

<!-- Dynamically assign to the value of a variable -->
<blog-post v-bind:author="post.author"></blog-post>
```

--------------------------------

### Vue.js Form with Custom Validation (HTML)

Source: https://v2.vuejs.org/v2/cookbook/form-validation

The HTML structure for a Vue.js form, including input fields for name, email, and favorite movie, along with a submit button. It uses Vue's directives for data binding and error display. The form has 'novalidate' attribute set to true to disable default browser validation.

```html
<form  
  id="app"  
  @submit="checkForm"  
  action="https://vuejs.org/"  
  method="post"  
  novalidate="true"  
>
  
  <p v-if="errors.length">  
    <b>Please correct the following error(s):</b>  
    <ul>  
      <li v-for="error in errors">{{ error }}</li>  
    </ul>  
  </p>  
  
  <p>  
    <label for="name">Name</label>  
    <input  
      id="name"  
      v-model="name"  
      type="text"  
      name="name"  
    >  
  </p>  
  
  <p>  
    <label for="email">Email</label>  
    <input  
      id="email"  
      v-model="email"  
      type="email"  
      name="email"  
    >  
  </p>  
  
  <p>  
    <label for="movie">Favorite Movie</label>  
    <select  
      id="movie"  
      v-model="movie"  
      name="movie"  
    >  
      <option>Star Wars</option>  
      <option>Vanilla Sky</option>  
      <option>Atomic Blonde</option>  
    </select>  
  </p>  
  
  <p>  
    <input  
      type="submit"  
      value="Submit"  
    >  
  </p>  
  
</form>
```

--------------------------------

### Receive Props in Parent Component with slot-scope (Vue.js)

Source: https://v2.vuejs.org/v2/cookbook/practical-use-of-scoped-slots

This snippet shows how to receive props exposed from a child component in a parent component using the `slot-scope` attribute. It allows the parent template to access child data like `google` and `map` objects, enabling custom content rendering within the child's slot.

```html
<GoogleMapLoader 
  :mapConfig="mapConfig"  
  apiKey="yourApiKey"
>
  <template slot-scope="{ google, map }">  
  	{{ map }}  
  	{{ google }}
  </template>
</GoogleMapLoader>
```

--------------------------------

### Replace `orderBy` with lodash `orderBy` in Computed Property (Vue.js)

Source: https://v2.vuejs.org/v2/guide/migration

Shows how to replace the `orderBy` filter using the lodash library's `orderBy` function within a computed property. This provides a robust way to sort arrays of objects. The function accepts the array and the key(s) to sort by, with optional direction specifiers.

```html
<p v-for="user in orderedUsers">{{ user.name }}</p>
```

```javascript
computed: {
  orderedUsers: function () {
    return _.orderBy(this.users, 'name')
  }
}
```

--------------------------------

### Vue.js: Dynamic Event Argument with v-on Shorthand

Source: https://v2.vuejs.org/v2/guide/syntax

Shows how to use the v-on shorthand (@) with a dynamic argument for event handling in Vue.js (requires version 2.6.0+). This allows for flexible event binding.

```html
<a @[event]="doSomething"> ... </a>
```

--------------------------------

### Replace `limitBy` with `slice` in Computed Property (Vue.js)

Source: https://v2.vuejs.org/v2/guide/migration

Replaces the deprecated `limitBy` filter with JavaScript's `.slice()` method within a computed property for limiting displayed items. This approach enhances performance by performing the slicing operation once per component instance. It expects an array of items and returns a sliced portion.

```html
<p v-for="item in filteredItems">{{ item }}</p>
```

```javascript
computed: {
  filteredItems: function () {
    return this.items.slice(0, 10)
  }
}
```

--------------------------------

### Vue.js v-clipscroll Directive for Morphing SVG

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This directive animates an SVG element by morphing it to a new path when the user scrolls past a specified start point. It uses GSAP's morphSVG plugin and requires TweenMax. The animation stops listening to scroll events after a defined end point.

```javascript
Vue.directive('clipscroll', {
  inserted: function(el, binding) {
    let f = function(evt) {
      var hasRun = false;
      if (!hasRun && window.scrollY > binding.value.start) {
        hasRun = true;
        TweenMax.to(el, 2, {
          morphSVG: binding.value.toPath,
          ease: Sine.easeIn
        });
      }
      if (window.scrollY > binding.value.end) {
        window.removeEventListener('scroll', f);
      }
    };
    window.addEventListener('scroll', f);
  }
});
```

--------------------------------

### v-model and Initial Value Attribute Behavior Change

Source: https://v2.vuejs.org/v2/guide/migration

Explains the change in `v-model` behavior regarding the initial `value` attribute in Vue.js. In v2, `v-model` ignores the inline `value` attribute for inputs and existing content for textareas, always using the Vue instance data as the source of truth for predictability. This ensures a consistent data flow.

```html
<input v-model="text" value="foo">
```

```javascript
data: {
  text: 'bar'
}
```

```html
<textarea v-model="text">
  hello world
</textarea>
```

--------------------------------

### Raw HTML Rendering with v-html in Vue.js

Source: https://v2.vuejs.org/v2/guide/syntax

Illustrates how to render raw HTML content using the `v-html` directive. This is contrasted with text interpolation, which treats content as plain text. It highlights that `v-html` is powerful but carries XSS risks if used with untrusted content.

```html
<p>Using mustaches: {{ rawHtml }}</p>
<p>Using v-html directive: <span v-html="rawHtml"></span></p>
```

--------------------------------

### Vue.js Watcher with Imperative Logic and API Call

Source: https://v2.vuejs.org/v2/guide/computed

Shows a Vue.js watcher used for performing side effects, such as making an asynchronous API call in response to data changes. This example utilizes lodash's `_.debounce` to limit the frequency of API requests, which is a common use case for watchers that computed properties cannot handle.

```javascript
<div id="watch-example">
  <p>
    Ask a yes/no question:
    <input v-model="question">
  </p>
  <p>{{ answer }}</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios@0.12.0/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.13.1/lodash.min.js"></script>
<script>
var watchExampleVM = new Vue({
  el: '#watch-example',
  data: {
    question: '',
    answer: 'I cannot give you an answer until you ask a question!'
  },
  watch: {
    // whenever question changes, this function will run
    question: function (newQuestion, oldQuestion) {
      this.answer = 'Waiting for you to stop typing...'
      this.debouncedGetAnswer()
    }
  },
  created: function () {
    // _.debounce is a function provided by lodash to limit how
    // often a particularly expensive operation can be run.
    this.debouncedGetAnswer = _.debounce(this.getAnswer, 500)
  },
  methods: {
    getAnswer: function () {
      if (this.question.indexOf('?') === -1) {
        this.answer = 'Questions usually contain a question mark. ;-)'
        return
      }
      this.answer = 'Thinking...'
      var vm = this
      axios.get('https://yesno.wtf/api')
        .then(function (response) {
          vm.answer = _.capitalize(response.data.answer)
        })
        .catch(function (error) {
          vm.answer = 'Error! Could not reach the API. ' + error
        })
    }
  }
})
</script>
```

--------------------------------

### Build Docker Image for Vue.js App

Source: https://v2.vuejs.org/v2/cookbook/dockerize-vuejs-app

Command to build a Docker image for a Vue.js application. This command tags the image with 'vuejs-cookbook/dockerize-vuejs-app' and uses the current directory as the build context. This is a common step after defining the Dockerfile.

```bash
docker build -t vuejs-cookbook/dockerize-vuejs-app .

```

--------------------------------

### Render HTML Safely with Vue.js

Source: https://v2.vuejs.org/v2/guide/security

Explicitly render safe HTML content in Vue.js using the `v-html` directive in templates, or within render functions and JSX by setting `innerHTML` on DOM elements. Vue automatically escapes HTML to prevent XSS, but these methods allow controlled rendering when the HTML is known to be safe. Ensure user-provided HTML is sanitized or used only in sandboxed environments.

```html
<div v-html="userProvidedHtml"></div>
```

```javascript
h('div', {
  domProps: {
    innerHTML: this.userProvidedHtml
  }
})
```

```javascript
<div domPropsInnerHTML={this.userProvidedHtml}></div>
```

--------------------------------

### Vue.js: Compilation Scope in Slots

Source: https://v2.vuejs.org/v2/guide/components-slots

Explains the concept of compilation scope in Vue.js slots. Content provided to a slot is compiled in the parent's scope, not the child's. This example shows that data like `user.name` is accessible, but `url` (defined in the parent) is not directly accessible within the slot's content if it were intended to be from the child's scope.

```html
<navigation-link url="/profile">
  Logged in as {{ user.name }}
</navigation-link>
```

```html
<navigation-link url="/profile">
  Clicking here will send you to: {{ url }}
  <!--
  The `url` will be undefined, because this content is passed
  _to_ <navigation-link>, rather than defined _inside_ the
  <navigation-link> component.
  -->
</navigation-link>
```

--------------------------------

### Vue.js SVG Image Component with Scroll Directives

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This Vue.js component defines an SVG image with scroll-based animation directives. The 'v-clipscroll' directive controls clipping paths, and 'v-drawscroll' controls path drawing, both based on scroll start and end points. It uses SVG elements, gradients, and clipping.

```html
<!--imagearea1-->
<script type="text/x-template" id="imagearea1">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 53.86 26.68" class="one">
    <defs>
      <radialGradient id="radial-gradient" cx="9.36" cy="15.58" r="9.56" gradientUnits="userSpaceOnUse">
        <stop offset="0" stop-color="#03037f"/>
        <stop offset="0.23" stop-color="#03037c"/>
        <stop offset="0.4" stop-color="#030372"/>
        <stop offset="0.56" stop-color="#020262"/>
        <stop offset="0.7" stop-color="#02024b"/>
        <stop offset="0.84" stop-color="#01012d"/>
        <stop offset="0.97" stop-color="#000009"/>
        <stop offset="1"/>
      </radialGradient>
      <clipPath id="clip-path" transform="translate(1.17 4.19)">
        <path v-clipscroll="{ start: '50', end: '100', toPath: 'M0.39 0.34H15.99V22.44H0.39z' }" id="poly-shapemorph" d="M12.46 20.76L7.34 22.04 3.67 18.25 5.12 13.18 10.24 11.9 13.91 15.69 12.46 20.76z" class="cls-1"/>
      </clipPath>
    </defs>

    <g clip-path="url(#clip-path)">
      <rect class="cls-2" x="1.56" y="4.53" width="15.6" height="22.1"/>
      <g v-drawscroll="{ start: '50', end: '100' }" class="paths">
        <path class="cls-4" d="M4.08,16.86c1.44.13,3.06,5.72,4.6,5.5s1.59-6,3.09-6.53c1.35-.44,4.83,4.25,6.26,3.58,1.28-.62-.08-6.32,1.27-7.12s5.48,3.25,6.76,2.36c1.59-1,.15-6.82,1.82-7.89s6.1,2.85,7.81,2,1.72-6.91,3.57-7.3S43,6.55,45,7c1.71.4,5.74-3.89,7.51-2.62" transform="translate(1.17 4.19)"/>
        <path class="cls-5" d="M3.79,16.38c1.47.29,2.78,5.92,4.36,5.73s1.65-6,3.18-6.56c1.37-.48,5,4.12,6.43,3.38s-.15-6.35,1.21-7.2,5.59,3.15,6.89,2.23C27.46,13,26,7.09,27.69,6s6.13,2.86,7.86,2,1.79-6.92,3.67-7.3S43,5.82,45,6.25c1.74.37,5.7-4,7.51-2.78" transform="translate(1.17 4.19)"/>
        <path class="cls-6" d="M3.47,15.83c1.5.45,2.5,6.11,4.11,6s1.74-6,3.31-6.57c1.39-.5,5.11,4,6.57,3.24s-.19-6.4,1.19-7.28,5.67,3.05,7,2.12c1.61-1,.17-6.91,1.86-8s6.14,2.88,7.89,2S37.27.44,39.17.05s3.9,5.1,5.9,5.48c1.79.35,5.66-4.12,7.51-2.94" transform="translate(1.17 4.19)"/>
      </g>
    </g>
  </svg>
</script>
```

--------------------------------

### Vue.js Methods Definition

Source: https://v2.vuejs.org/v2/api

Illustrates how to define methods for a Vue instance. Methods are automatically bound to the Vue instance's context ('this') and can be called directly on the instance. Arrow functions should be avoided.

```javascript
var vm = new Vue({
  data: { a: 1 },
  methods: {
    plus: function () {
      this.a++
    }
  }
})
vm.plus()
vm.a // 2
```

--------------------------------

### Preventing Direct Use of Untrusted Templates in Vue.js

Source: https://v2.vuejs.org/v2/guide/security

This code snippet demonstrates the dangerous practice of directly embedding user-provided strings into a Vue component's template. It highlights why this approach is a major security risk, leading to potential arbitrary JavaScript execution and server breaches. Developers should always ensure template content is trusted and controlled.

```javascript
new Vue({
  el: '#app',
  template: `<div>` + userProvidedString + `</div>` // NEVER DO THIS
})
```

--------------------------------

### Vue `scoped` Styles: Prefer Class Selectors

Source: https://v2.vuejs.org/v2/style-guide

In Vue's `scoped` styles, it's advisable to use class selectors over element selectors. Element selectors, when combined with the scoping attribute (e.g., `[data-v-...]`), can lead to slower rendering performance compared to class-attribute selectors. This is particularly relevant in large components or applications.

```html
<template>
  <button class="btn btn-close">X</button>
</template>

<style scoped>
.btn-close {
  background-color: red;
}
</style>
```

--------------------------------

### Vue.extend()

Source: https://v2.vuejs.org/v2/api

Creates a "subclass" of the base Vue constructor with component options.

```APIDOC
## Vue.extend( options )

### Description

Create a “subclass” of the base Vue constructor. The argument should be an object containing component options. The special case to note here is the `data` option - it must be a function when used with `Vue.extend()`.

### Method

`Vue.extend

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

*   **options** (Object) - Component options

### Request Example

```html
<div id="mount-point"></div>  
```

```javascript
// create constructor  
var Profile = Vue.extend({
  template: '<p>{{firstName}} {{lastName}} aka {{alias}}</p>',
  data: function () {
    return {
      firstName: 'Walter',
      lastName: 'White',
      alias: 'Heisenberg'
    }
  }
})
// create an instance of Profile and mount it on an element  
new Profile().$mount('#mount-point')
```

### Response

None

#### Success Response (200)

None

#### Response Example

```html
<p>Walter White aka Heisenberg</p>
```

### See also

Components
```

--------------------------------

### Vue.js Automatic Attribute Binding Escaping

Source: https://v2.vuejs.org/v2/guide/security

This snippet shows how Vue.js automatically escapes data used in dynamic attribute bindings. If a user-provided string attempts to close an attribute and inject malicious JavaScript via an event handler, Vue escapes the problematic characters, preventing the injection. This relies on native browser APIs such as `setAttribute`.

```html
<h1 v-bind:title="userProvidedString">
  hello
</h1>
```

```javascript
userProvidedString = '" onclick="alert(\'hi\')'
```

```html
&quot; onclick=&quot;alert('hi')
```

--------------------------------

### v-model with v-for on Primitive Values Removed

Source: https://v2.vuejs.org/v2/guide/migration

Details the removal of support for `v-model` when iterating over primitive values with `v-for` in Vue.js. This pattern is no longer supported because `v-model`'s two-way binding does not work correctly with local variables created within the iterator function. The recommended alternative is to iterate over an array of objects and bind `v-model` to a property of each object.

```html
<input v-for="str in strings" v-model="str">
```

```html
<input v-for="obj in objects" v-model="obj.str">
```

--------------------------------

### Debounce Operation with Lodash in Vue.js

Source: https://v2.vuejs.org/v2/guide/migration

Demonstrates how to use Lodash's debounce function with Vue.js to limit expensive operations, such as Ajax requests. It shows the decoupling of the debounce logic from Vue's core to allow for more complex state management, like detecting a 'typing' state. This approach enhances flexibility by allowing debounce to be applied anywhere, not just within templates.

```html
<script src="https://cdn.jsdelivr.net/lodash/4.13.1/lodash.js"></script>
<div id="debounce-search-demo">
  <input v-model="searchQuery" placeholder="Type something">
  <strong>{{ searchIndicator }}</strong>
</div>
```

```javascript
new Vue({
  el: '#debounce-search-demo',
  data: {
    searchQuery: '',
    searchQueryIsDirty: false,
    isCalculating: false
  },
  computed: {
    searchIndicator: function () {
      if (this.isCalculating) {
        return '⟳ Fetching new results'
      } else if (this.searchQueryIsDirty) {
        return '... Typing'
      } else {
        return '✓ Done'
      }
    }
  },
  watch: {
    searchQuery: function () {
      this.searchQueryIsDirty = true
      this.expensiveOperation()
    }
  },
  methods: {
    // This is where the debounce actually belongs.
    expensiveOperation: _.debounce(function () {
      this.isCalculating = true
      setTimeout(function () {
        this.isCalculating = false
        this.searchQueryIsDirty = false
      }.bind(this), 1000)
    }, 500)
  }
})
```

--------------------------------

### Vue Data Reactivity (JavaScript)

Source: https://v2.vuejs.org/v2/guide/instance

Explains Vue's reactivity system by showing how properties added to the `data` object are tracked. Changes to these properties automatically update the view.

```javascript
// Our data object
var data = { a: 1 }

// The object is added to a Vue instance
var vm = new Vue({
  data: data
})

// Getting the property on the instance
// returns the one from the original data
vm.a == data.a // => true

// Setting the property on the instance
// also affects the original data
vm.a = 2
data.a // => 2

// ... and vice-versa
data.a = 3
vm.a // => 3
```

--------------------------------

### Sanitize URLs in Vue.js

Source: https://v2.vuejs.org/v2/guide/security

Prevent JavaScript execution in URLs bound to `href` attributes in Vue.js using `v-bind:href`. While libraries like `sanitize-url` can help, it's crucial to sanitize user-provided URLs on the backend before saving them to avoid security issues across all clients. Vue cannot guarantee the safety of linked destinations even with sanitized URLs.

```html
<a v-bind:href="userProvidedUrl">
  click me
</a>
```

--------------------------------

### Global App Object Pattern (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/adding-instance-properties

Demonstrates creating a global 'App' object to hold shared properties and functions, suitable for applications without module systems. Object.freeze is used to make properties immutable, preventing future state bugs. This pattern improves explicitness by centralizing shared resources.

```javascript
var App = Object.freeze({
  name: 'My App',
  version: '2.1.4',
  helpers: {
    // This is a purely functional version of
    // the $reverseText method we saw earlier
    reverseText: function(text) {
      return text
        .split('')
        .reverse()
        .join('')
    }
  }
})

```

```javascript
new Vue({
  data: {
    appVersion: App.version
  },
  methods: {
    reverseText: App.helpers.reverseText
  }
})

```

--------------------------------

### Cleanup Data in keep-alive Component's deactivated Hook

Source: https://v2.vuejs.org/v2/cookbook/avoiding-memory-leaks

This example illustrates how to perform cleanup operations within the `deactivated()` lifecycle hook of a component managed by `keep-alive`. The `deactivated()` hook is called when the component is removed from the cache. This is the appropriate place to remove temporary data or reset states that should not persist when the component is no longer active, ensuring a clean state upon subsequent activations.

```javascript
deactivated: function () {
  // remove any data you do not want to keep alive
}
```

--------------------------------

### Vue PropsData Option for Instance Creation

Source: https://v2.vuejs.org/v2/api

Allows passing props to a Vue instance during its creation, primarily for simplifying unit testing. It accepts an object where keys are prop names and values are the corresponding prop values.

```javascript
var Comp = Vue.extend({
  props: ['msg'],
  template: '<div>{{ msg }}</div>'
})
  
var vm = new Comp({
  propsData: {
    msg: 'hello'
  }
})
```

--------------------------------

### Instance Properties

Source: https://v2.vuejs.org/v2/api

Details the accessible properties on a Vue.js instance, providing insights into the component's data, props, DOM element, options, and relationships with other instances.

```APIDOC
## Instance Properties

### vm.$data
  * **Type:** `Object`
  * **Details:** The observed data object of the Vue instance. Properties are proxied for direct access.

### vm.$props
  * **Type:** `Object`
  * **Details:** An object containing the current props received by the component. Props are proxied for direct access.

### vm.$el
  * **Type:** `Element`
  * **Read only**
  * **Details:** The root DOM element managed by the Vue instance.

### vm.$options
  * **Type:** `Object`
  * **Read only**
  * **Details:** The instantiation options used for the current Vue instance. Useful for accessing custom options.
  * **Example:**
    ```javascript
    new Vue({
      customOption: 'foo',
      created: function () {
        console.log(this.$options.customOption) // => 'foo'
      }
    })
    ```

### vm.$parent
  * **Type:** `Vue instance`
  * **Read only**
  * **Details:** The parent Vue instance, if one exists.

### vm.$root
  * **Type:** `Vue instance`
  * **Read only**
  * **Details:** The root Vue instance of the component tree. If the instance has no parent, this refers to itself.

### vm.$children
  * **Type:** `Array<Vue instance>`
  * **Read only**
  * **Details:** An array of direct child components. Note: Order is not guaranteed, and this property is not reactive. Consider using `v-for` with an array for reactive child management.
```

--------------------------------

### vm.$isServer

Source: https://v2.vuejs.org/v2/api

A boolean indicating whether the current Vue instance is executing in a server-side rendering environment.

```APIDOC
## vm.$isServer

### Description
Whether the current Vue instance is running on the server.

### Type
`boolean`

### Read only
Yes

### See also
* Server-Side Rendering
```

--------------------------------

### vm.$destroy()

Source: https://v2.vuejs.org/v2/api

Completely destroys the Vue instance, cleaning up event listeners and directives.

```APIDOC
## vm.$destroy()

### Description
Completely destroys a Vue instance. It cleans up connections with other instances, unbinds directives, and turns off event listeners. This triggers `beforeDestroy` and `destroyed` hooks.

### Method
`$destroy`

### Endpoint
N/A (Instance Method)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```javascript
// Generally not needed in normal use cases, prefer data-driven control (v-if, v-for)
// this.$destroy()
```

### Response
#### Success Response (200)
N/A (This is an instance method, not an API endpoint)

#### Response Example
N/A
```

--------------------------------

### vm.$emit( eventName, […args] )

Source: https://v2.vuejs.org/v2/api

Triggers an event on the current Vue instance. Additional arguments are passed to the listener's callback function.

```APIDOC
## vm.$emit( eventName, […args] )

### Description
Triggers an event on the current instance. Any additional arguments will be passed into the listener’s callback function.

### Method
`$emit`

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```javascript
// Using $emit with only an event name:
Vue.component('welcome-button', {
  template: `
    <button v-on:click="$emit('welcome')">
      Click me to be welcomed
    </button>
  `
})

new Vue({
  el: '#emit-example-simple',
  methods: {
    sayHi: function () {
      alert('Hi!')
    }
  }
})

// Using $emit with additional arguments:
Vue.component('magic-eight-ball', {
  data: function () {
    return {
      possibleAdvice: ['Yes', 'No', 'Maybe']
    }
  },
  methods: {
    giveAdvice: function () {
      var randomAdviceIndex = Math.floor(Math.random() * this.possibleAdvice.length)
      this.$emit('give-advice', this.possibleAdvice[randomAdviceIndex])
    }
  },
  template: `
    <button v-on:click="giveAdvice">
      Click me for advice
    </button>
  `
})

new Vue({
  el: '#emit-example-argument',
  methods: {
    showAdvice: function (advice) {
      alert(advice)
    }
  }
})
```

### Response
#### Success Response (200)
N/A (This is an instance method, not an API endpoint)

#### Response Example
N/A
```

--------------------------------

### Handling Loading and Error States for Async Components (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-dynamic-async

This code illustrates how to configure an asynchronous component to display loading and error states. The factory function can return an object specifying the component to load, a `loading` component, an `error` component, a `delay` for the loading state, and a `timeout` for the error state.

```javascript
const AsyncComponent = () => ({
  // The component to load (should be a Promise)
  component: import('./MyComponent.vue'),
  // A component to use while the async component is loading
  loading: LoadingComponent,
  // A component to use if the load fails
  error: ErrorComponent,
  // Delay before showing the loading component. Default: 200ms.
  delay: 200,
  // The error component will be displayed if a timeout is
  // provided and exceeded. Default: Infinity.
  timeout: 3000
})
```

--------------------------------

### Using v-model with Custom Input Component

Source: https://v2.vuejs.org/v2/guide/components

Demonstrates the usage of v-model on the previously defined 'custom-input' component, enabling two-way data binding with the 'searchText' property.

```html
<custom-input v-model="searchText"></custom-input>
```

--------------------------------

### CSS for Vue.js Bitcoin Price Index Application (CSS)

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This CSS code styles the Vue.js Bitcoin Price Index application. It centers the content, sets a background color, defines typography, and styles the main application container (`#app`) with specific padding, background, border-radius, and text color. It also styles the main heading and a 'lighten' class for emphasis.

```css
body {
  display: flex;
  justify-content: center;
  background: #7E8D85;
  font-family: 'Roboto Slab', serif;
  line-height: 1.4;
}

#app {
  margin-top: 20px;
  width: 300px;
  padding: 0 40px 40px;
  background: #2F242C;
  border-radius: 5px;
  color: #B3BFB8;
}

h1 {
  color: #F0F7F4;
}

.lighten {
  color: white;
}

```

--------------------------------

### Vue Provide/Inject with ES2015 Symbols

Source: https://v2.vuejs.org/v2/api

Demonstrates using ES2015 Symbols with 'provide' and 'inject' in Vue.js. This allows for more robust and private injection keys. The 'provide' option can be a function returning an object, and 'inject' can map symbols to local properties.

```javascript
const s = Symbol()

const Provider = {
  provide () {
    return {
      [s]: 'foo'
    }
  }
}

const Child = {
  inject: { s },
  // ...
}
```

--------------------------------

### Vue.js Global Component Registration

Source: https://v2.vuejs.org/v2/guide/components-registration

Demonstrates the global registration of a component using `Vue.component`. The first argument is the component name, and the second is the component's options object. Globally registered components are available in any root Vue instance created after registration.

```javascript
Vue.component('my-component-name', {
  // ... options ...
})
```

```javascript
Vue.component('component-a', { /* ... */ })
Vue.component('component-b', { /* ... */ })
Vue.component('component-c', { /* ... */ })

new Vue({ el: '#app' })
```

```html
<div id="app">
  <component-a></component-a>
  <component-b></component-b>
  <component-c></component-c>
</div>
```

--------------------------------

### vm.$refs

Source: https://v2.vuejs.org/v2/api

An object containing registered DOM elements and component instances accessible via `ref` attributes, useful for direct manipulation or interaction with child components.

```APIDOC
## vm.$refs

### Description
An object of DOM elements and component instances, registered with `ref` attributes.

### Type
`Object`

### Read only
Yes

### See also
* Child Component Refs
* Special Attributes - ref
```

--------------------------------

### Listen for Event Once with vm.$once

Source: https://v2.vuejs.org/v2/api

Register a listener for a custom event that will only be triggered once. After the first time the event is emitted and the callback is executed, the listener is automatically removed.

```javascript
vm.$once( event, callback )
```

--------------------------------

### Global Vue.js Component Registration

Source: https://v2.vuejs.org/v2/guide/components

This code shows how to register a Vue component globally using `Vue.component`. Globally registered components are available for use in the templates of any root Vue instance created after the registration, as well as within all of their subcomponents.

```javascript
Vue.component('my-component-name', {
  // ... options ...
})
```

--------------------------------

### Vue Props Option: Simple and Advanced Syntax

Source: https://v2.vuejs.org/v2/api

Specifies attributes that accept data from a parent component. Supports a simple array syntax for prop names and an object syntax for advanced configuration including type checking, defaults, and custom validation.

```javascript
// simple syntax  
Vue.component('props-demo-simple', {
  props: ['size', 'myMessage']
})
  
// object syntax with validation  
Vue.component('props-demo-advanced', {
  props: {
    // type check  
    height: Number,
    // type check plus other validations  
    age: {
      type: Number,
      default: 0,
      required: true,
      validator: function (value) {
        return value >= 0
      }
    }
  }
})
```

--------------------------------

### Accessing Root Instance in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Demonstrates how to access and interact with the root Vue instance from any subcomponent using the `$root` property. This is suitable for demos or small applications but not recommended for larger projects due to scalability issues. Consider Vuex for state management.

```javascript
// The root Vue instance
new Vue({
  data: {
    foo: 1
  },
  computed: {
    bar: function () { /* ... */ }
  },
  methods: {
    baz: function () { /* ... */ }
  }
});

// In a subcomponent:
// Get root data
this.$root.foo;

// Set root data
this.$root.foo = 2;

// Access root computed properties
this.$root.bar;

// Call root methods
this.$root.baz();
```

--------------------------------

### Vue.js Async Update Queue and nextTick

Source: https://v2.vuejs.org/v2/guide/reactivity

Vue.js performs DOM updates asynchronously in batches to optimize performance. To interact with the DOM after updates, use Vue.nextTick or the vm.$nextTick instance method. $nextTick is particularly useful within components as it binds the 'this' context.

```html
<div id="example">{{ message }}</div>
```

```javascript
var vm = new Vue({
  el: '#example',
  data: {
    message: '123'
  }
})vm.message = 'new message' // change data
vm.$el.textContent === 'new message' // false
Vue.nextTick(function () {
  vm.$el.textContent === 'new message' // true
})
```

```javascript
Vue.component('example', {
  template: '<span>{{ message }}</span>',
  data: function () {
    return {
      message: 'not updated'
    }
  },
  methods: {
    updateMessage: function () {
      this.message = 'updated'
      console.log(this.$el.textContent) // => 'not updated'
      this.$nextTick(function () {
        console.log(this.$el.textContent) // => 'updated'
      })
    }
  }
})
```

```javascript
methods: {
  updateMessage: async function () {
    this.message = 'updated'
    console.log(this.$el.textContent) // => 'not updated'
    await this.$nextTick()
    console.log(this.$el.textContent) // => 'updated'
  }
}
```

--------------------------------

### Vue.nextTick()

Source: https://v2.vuejs.org/v2/api

Defers a callback to be executed after the next DOM update cycle.

```APIDOC
## Vue.nextTick( [callback, context] )

### Description

Defer the callback to be executed after the next DOM update cycle. Use it immediately after you’ve changed some data to wait for the DOM update.

### Method

`Vue.nextTick

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

*   **callback** (Function) - Optional callback function
*   **context** (Object) - Optional context for the callback

### Request Example

```javascript
// modify data  
vm.msg = 'Hello'
// DOM not updated yet  
Vue.nextTick(function () {
  // DOM updated  
})

// usage as a promise (2.1.0+, see note below)  
Vue.nextTick()
  .then(function () {
    // DOM updated
  })
```

### Response

None

#### Success Response (200)

None

#### Response Example

None

### See also

Async Update Queue
```

--------------------------------

### Configure Rollup for Vue SFC Builds

Source: https://v2.vuejs.org/v2/cookbook/packaging-sfc-for-npm

This JavaScript configuration file sets up Rollup to bundle Vue.js Single File Components (SFCs). It utilizes plugins for CommonJS module conversion, Vue SFC handling, and ES5 transpilation. The input is specified as 'src/wrapper.js', and output options include a named export and a 'MyComponent' global name.

```javascript
import commonjs from '@rollup/plugin-commonjs';
import vue from 'rollup-plugin-vue';
import buble from '@rollup/plugin-buble';

export default {
    input: 'src/wrapper.js',
    output: {
        name: 'MyComponent',
        exports: 'named',
    },
    plugins: [
        commonjs(),
        vue({
            css: true,
            compileTemplate: true,
        }),
        buble(),
    ],
};
```

--------------------------------

### Vue.js Component: Greeting, Input, and Error Handling

Source: https://v2.vuejs.org/v2/cookbook/unit-testing-vue-components

This Vue.js component displays a welcome message, an input field for a username, and an error message that appears if the username is less than seven characters long. It uses Vue's data and computed properties to manage state and validation.

```html
<template>
  <div>
    <div class="message">
      {{ message }}
    </div>
    Enter your username: <input v-model="username">
    <div
      v-if="error"
      class="error"
    >
      Please enter a username with at least seven letters.
    </div>
  </div>
</template>

<script>
export default {
  name: 'Foo',

  data () {
    return {
      message: 'Welcome to the Vue.js cookbook',
      username: ''
    }
  },

  computed: {
    error () {
      return this.username.trim().length < 7
    }
  }
}
</script>

```

--------------------------------

### Vue Component Prop Definition (Object Syntax)

Source: https://v2.vuejs.org/v2/guide/components-props

Demonstrates defining Vue component props using an object, allowing for type checking. This method documents expected prop types (String, Number, Boolean, Array, Object, Function, Promise) and provides console warnings for type mismatches.

```javascript
props: {
  title: String,
  likes: Number,
  isPublished: Boolean,
  commentIds: Array,
  author: Object,
  callback: Function,
  contactsPromise: Promise // or any other constructor
}
```

--------------------------------

### Vue.js Unit Test: Initial Attempt

Source: https://v2.vuejs.org/v2/cookbook/unit-testing-vue-components

An initial approach to unit testing a Vue.js component. This test verifies message rendering, error visibility based on username length, and updates the username to check for error disappearance. It combines multiple assertions within a single test case.

```javascript
import { shallowMount } from '@vue/test-utils'
import Foo from './Foo.vue'

describe('Foo', () => {
  it('renders a message and responds correctly to user input', () => {
    const wrapper = shallowMount(Foo, {
      data() {
        return {
          message: 'Hello World',
          username: ''
        }
      }
    })

    // see if the message renders
    expect(wrapper.find('.message').text()).toEqual('Hello World')

    // assert the error is rendered
    expect(wrapper.find('.error').exists()).toBeTruthy()

    // update the `username` and assert error is no longer rendered
    wrapper.setData({ username: 'Lachlan' })
    expect(wrapper.find('.error').exists()).toBeFalsy()
  })
})

```

--------------------------------

### Access Vue Instance Options and Custom Properties

Source: https://v2.vuejs.org/v2/api

Provides access to the instantiation options used for the current Vue instance via `$options`. This is particularly useful for including and accessing custom properties defined within the Vue constructor options.

```javascript
new Vue({
  customOption: 'foo',
  created: function () {
    console.log(this.$options.customOption) // => 'foo'
  }
})
```

--------------------------------

### Vue.js: v-on Shorthand for Click Event

Source: https://v2.vuejs.org/v2/guide/syntax

Demonstrates the full v-on syntax and its shorthand equivalent (@) for handling click events in Vue.js. The shorthand is optional and does not affect the rendered markup.

```html
<a v-on:click="doSomething"> ... </a>

<a @click="doSomething"> ... </a>
```

--------------------------------

### Vue.js Animated Integer Component with tween.js

Source: https://v2.vuejs.org/v2/guide/transitioning-state

This snippet defines a reusable Vue component `animated-integer` that animates the display of a number using the tween.js library. It takes a `value` prop and updates its displayed `tweeningValue` over a duration, with a watcher to trigger animations on prop changes and `mounted` to initialize. The `tween` method handles the animation logic.

```html
<script src="https://cdn.jsdelivr.net/npm/tween.js@16.3.4"></script>  
  
<div id="example-8">  
  <input v-model.number="firstNumber" type="number" step="20"> +  
  <input v-model.number="secondNumber" type="number" step="20"> =  
  {{ result }}  
  <p>  
    <animated-integer v-bind:value="firstNumber"></animated-integer> +  
    <animated-integer v-bind:value="secondNumber"></animated-integer> =  
    <animated-integer v-bind:value="result"></animated-integer>  
  </p>  
</div>  

```

```javascript
Vue.component('animated-integer', {  
  template: '<span>{{ tweeningValue }}</span>',  
  props: {  
    value: {  
      type: Number,  
      required: true  
    }  
  },  
  data: function () {  
    return {  
      tweeningValue: 0  
    }  
  },  
  watch: {  
    value: function (newValue, oldValue) {  
      this.tween(oldValue, newValue)  
    }  
  },  
  mounted: function () {  
    this.tween(0, this.value)  
  },  
  methods: {  
    tween: function (startValue, endValue) {  
      var vm = this  
      function animate () {  
        if (TWEEN.update()) {  
          requestAnimationFrame(animate)  
        }  
      }  
  
      new TWEEN.Tween({ tweeningValue: startValue })  
        .to({ tweeningValue: endValue }, 500)  
        .onUpdate(function () {  
          vm.tweeningValue = this.tweeningValue.toFixed(0)  
        })  
        .start()  
  
      animate()  
    }  
  }  
})

new Vue({  
  el: '#example-8',  
  data: {  
    firstNumber: 20,  
    secondNumber: 40  
  },  
  computed: {  
    result: function () {  
      return this.firstNumber + this.secondNumber  
    }  
  }
})
```

--------------------------------

### Vue.js: Reusable Datepicker Integration with Methods and $once

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Demonstrates how to create a reusable pattern for integrating multiple datepicker instances using a `attachDatepicker` method. Each datepicker is automatically cleaned up using `$once` when its corresponding component is destroyed, promoting modularity.

```javascript
mounted: function () {
  this.attachDatepicker('startDateInput')
  this.attachDatepicker('endDateInput')
},
methods: {
  attachDatepicker: function (refName) {
    var picker = new Pikaday({
      field: this.$refs[refName],
      format: 'YYYY-MM-DD'
    })

    this.$once('hook:beforeDestroy', function () {
      picker.destroy()
    })
  }
}
```

--------------------------------

### Handling Initial Prop Values as Local Data in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-props

Illustrates how to initialize a child component's local data property with a prop's value. This pattern is useful when a prop serves as an initial value, and the child component needs to manage its own mutable state based on that initial value.

```javascript
props: ['initialCounter'],
data: function () {
  return {
    counter: this.initialCounter
  }
}
```

--------------------------------

### Text Interpolation with Mustaches in Vue.js

Source: https://v2.vuejs.org/v2/guide/syntax

Demonstrates basic text interpolation using the mustache syntax `{{ }}` to display data from a Vue instance. This binding updates automatically when the data changes. It also shows one-time interpolation using `v-once` which will not update.

```html
<span>Message: {{ msg }}</span>
<span v-once>This will never change: {{ msg }}</span>
```

--------------------------------

### Listen for Custom Events with vm.$on

Source: https://v2.vuejs.org/v2/api

Register a listener for custom events emitted by the Vue instance using `vm.$on`. The callback function receives any additional arguments passed when the event is triggered via `vm.$emit`. Supports listening for multiple events using an array (v2.2.0+).

```javascript
vm.$on('test', function (msg) {
  console.log(msg)
})
vm.$emit('test', 'hi')
// => "hi"
```

--------------------------------

### Vue.js: Transition Between Elements with v-if/v-else and Keys

Source: https://v2.vuejs.org/v2/guide/transitions

Enables transitions between different elements, particularly useful for conditional rendering using `v-if` and `v-else`. When transitioning between elements with the same tag name, unique `key` attributes must be provided to ensure Vue treats them as distinct elements. This is also good practice for any multiple items within a `<transition>` component.

```html
<transition>
  <table v-if="items.length > 0">
    <!-- ... -->
  </table>
  <p v-else>Sorry, no items found.</p>
</transition>
```

```html
<transition>
  <button v-if="isEditing" key="save">
    Save
  </button>
  <button v-else key="edit">
    Edit
  </button>
</transition>
```

```html
<transition>
  <button v-bind:key="isEditing">
    {{ isEditing ? 'Save' : 'Edit' }}
  </button>
</transition>
```

```html
<transition>
  <button v-if="docState === 'saved'" key="saved">
    Edit
  </button>
  <button v-if="docState === 'edited'" key="edited">
    Save
  </button>
  <button v-if="docState === 'editing'" key="editing">
    Cancel
  </button>
</transition>
```

```html
<transition>
  <button v-bind:key="docState">
    {{ buttonMessage }}
  </button>
</transition>
```

```javascript
// ...
computed: {
  buttonMessage: function () {
    switch (this.docState) {
      case 'saved': return 'Edit'
      case 'edited': return 'Save'
      case 'editing': return 'Cancel'
    }
  }
}
```

--------------------------------

### Child Blog-Post Component Template

Source: https://v2.vuejs.org/v2/guide/components

Defines the structure for a single blog post component, including a title, an 'Enlarge text' button, and the post content. It accepts a 'post' object as a prop.

```html
Vue.component('blog-post', {
  props: ['post'],
  template: `
    <div class="blog-post">
      <h3>{{ post.title }}</h3>
      <button>
        Enlarge text
      </button>
      <div v-html="post.content"></div>
    </div>
  `
})
```

--------------------------------

### Extends

Source: https://v2.vuejs.org/v2/api

The `extends` option allows declarative extension of another component, useful for single-file components, without needing `Vue.extend()`.

```APIDOC
## Extends

### Description
Allows declarative extension of another component, enabling code reuse between components without explicit use of `Vue.extend()`.

### Method
Component Option

### Endpoint
N/A

### Parameters
#### Request Body
- **extends** (Object | Function) - Required - The component options object or constructor to extend.

### Request Example
```javascript
var CompA = {
  data: function() {
    return { message: 'Hello from CompA' };
  }
};

var CompB = {
  extends: CompA,
  template: '<div>{{ message }}</div>'
};
```

### Response
#### Success Response (200)
N/A

#### Response Example
N/A
```

--------------------------------

### Dynamic Arguments for v-bind and v-on

Source: https://v2.vuejs.org/v2/guide/syntax

Dynamic arguments allow the directive argument to be a JavaScript expression evaluated at runtime, enclosed in square brackets. This enables dynamic attribute binding and event listening. The evaluated argument must be a string or null.

```html
<a v-bind:[attributeName]="url"> ... </a>
```

```html
<a v-on:[eventName]="doSomething"> ... </a>
```

```html
<a :[key]="url"> ... </a>
```

--------------------------------

### Vue.js v-on Directive: Basic Usage and Modifiers

Source: https://v2.vuejs.org/v2/api

Demonstrates the core usage of the v-on directive and its shorthand '@' for attaching event listeners in Vue.js. It covers method handlers, inline statements, dynamic events, and various modifiers like stop, prevent, capture, and key modifiers.

```html
<button v-on:click="doThis"></button>

<!-- dynamic event (2.6.0+) -->
<button v-on:[event]="doThis"></button>

<!-- inline statement -->
<button v-on:click="doThat('hello', $event)"></button>

<!-- shorthand -->
<button @click="doThis"></button>

<!-- shorthand dynamic event (2.6.0+) -->
<button @[event]="doThis"></button>

<!-- stop propagation -->
<button @click.stop="doThis"></button>

<!-- prevent default -->
<button @click.prevent="doThis"></button>

<!-- prevent default without expression -->
<form @submit.prevent></form>

<!-- chain modifiers -->
<button @click.stop.prevent="doThis"></button>

<!-- key modifier using keyAlias -->
<input @keyup.enter="onEnter">

<!-- key modifier using keyCode -->
<input @keyup.13="onEnter">

<!-- the click event will be triggered at most once -->
<button v-on:click.once="doThis"></button>

<!-- object syntax (2.4.0+) -->
<button v-on='{ mousedown: doThis, mouseup: doThat }'></button>
```

--------------------------------

### Vue.js: Basic createElement Usage

Source: https://v2.vuejs.org/v2/guide/render-function

Demonstrates the basic return value of the createElement function in Vue.js, which is a VNode (Virtual Node) describing a DOM element. This VNode contains information for Vue to render the actual DOM.

```javascript
return createElement('h1', this.blogTitle)
```

--------------------------------

### Local Vue Component Registration with ES2015 Modules

Source: https://v2.vuejs.org/v2/guide/components-registration

Shows local component registration using ES2015 module syntax. Components are imported and then registered using the shorthand property name notation, where the variable name serves as both the custom element name and the component definition reference.

```javascript
import ComponentA from './ComponentA.vue'

export default {
  components: {
    ComponentA
  },
  // ...
}
```

--------------------------------

### Parent Template Using Font Size Data Property

Source: https://v2.vuejs.org/v2/guide/components

Renders blog posts within a div whose font size is dynamically bound to the 'postFontSize' data property of the parent component. This allows the parent to control the overall font size.

```html
<div id="blog-posts-events-demo">
  <div :style="{ fontSize: postFontSize + 'em' }">
    <blog-post
      v-for="post in posts"
      v-bind:key="post.id"
      v-bind:post="post"
    ></blog-post>
  </div>
</div>
```

--------------------------------

### Vue CLI/webpack Dependency Upgrades

Source: https://v2.vuejs.org/v2/guide/migration-vue-2-7

Instructions for updating local Vue CLI dependencies, the 'vue' package, and verifying transitive dependencies like 'vue-loader' and 'vue-demi' when upgrading to Vue.js 2.7.

```bash
npm install --save-dev @vue/cli-service@~4.5.18
npm install --save-dev @vue/cli-service@~5.0.6
npm install vue@^2.7.0
```

--------------------------------

### Register or Retrieve Global Vue Component

Source: https://v2.vuejs.org/v2/api

Registers a new global component with a given ID or retrieves an existing one. It accepts either an extended constructor or an options object. Registration automatically sets the component's name.

```javascript
Vue.component('my-component', Vue.extend({ /* ... */ }))

Vue.component('my-component', { /* ... */ })

var MyComponent = Vue.component('my-component')
```

--------------------------------

### Vue.js: Apply Transition on Initial Render

Source: https://v2.vuejs.org/v2/guide/transitions

Applies a transition to an element when it is first rendered in the DOM. This is achieved by adding the `appear` attribute to the `<transition>` component. Custom CSS classes or JavaScript hooks can also be specified for more fine-grained control over the appear transition.

```html
<transition appear>
  <!-- ... -->
</transition>
```

```html
<transition
  appear
  appear-class="custom-appear-class"
  appear-to-class="custom-appear-to-class" (2.1.8+)
  appear-active-class="custom-appear-active-class"
>
  <!-- ... -->
</transition>
```

```html
<transition
  appear
  v-on:before-appear="customBeforeAppearHook"
  v-on:appear="customAppearHook"
  v-on:after-appear="customAfterAppearHook"
  v-on:appear-cancelled="customAppearCancelledHook"
>
  <!-- ... -->
</transition>
```

--------------------------------

### Vue.set()

Source: https://v2.vuejs.org/v2/api

Adds a property to a reactive object, ensuring the new property is also reactive.

```APIDOC
## Vue.set( target, propertyName/index, value )

### Description

Adds a property to a reactive object, ensuring the new property is also reactive, so triggers view updates. This must be used to add new properties to reactive objects, as Vue cannot detect normal property additions (e.g. `this.myObject.newProperty = 'hi'`). The target object cannot be a Vue instance, or the root data object of a Vue instance.

### Method

`Vue.set

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

*   **target** (Object | Array) - The target object or array
*   **propertyName/index** (string | number) - The name or index of the property to set
*   **value** (any) - The value to set

### Request Example

None

### Response

*   **Returns** the set value.

#### Success Response (200)

None

#### Response Example

None

### See also

Reactivity in Depth
```

--------------------------------

### Dependency Injection: Provide Option (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

The 'provide' instance option in a parent component allows it to make data or methods available to all its descendants without explicitly passing them down via props. This is useful for shared functionalities like accessing a map instance.

```javascript
provide: function () {
  return {
    getMap: this.getMap
  }
}
```

--------------------------------

### Chaining Filters in Vue.js Interpolations

Source: https://v2.vuejs.org/v2/guide/filters

Explains and demonstrates how to chain multiple filters in Vue.js. The output of one filter is passed as the input to the next filter in the sequence.

```html
{{ message | filterA | filterB }}
```

--------------------------------

### Vue.extend: Create Component Subclass

Source: https://v2.vuejs.org/v2/api

Creates a 'subclass' of the base Vue constructor by accepting an object of component options. The `data` option must be a function. This is useful for creating reusable component constructors.

```javascript
var Profile = Vue.extend({
  template: '<p>{{firstName}} {{lastName}} aka {{alias}}</p>',
  data: function () {
    return {
      firstName: 'Walter',
      lastName: 'White',
      alias: 'Heisenberg'
    }
  }
})
new Profile().$mount('#mount-point')
```

--------------------------------

### Vue.js: X-Template Definition

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

This code demonstrates defining a Vue.js component template using a script tag with the type `text/x-template` and referencing it by its ID. This method is useful for large templates in demos or small applications but is generally discouraged as it separates the template from the component's logic.

```html
<script type="text/x-template" id="hello-world-template">
  <p>Hello hello hello</p>
</script>
```

```javascript
Vue.component('hello-world', {
  template: '#hello-world-template'
})
```

--------------------------------

### CSS for Fade Transition

Source: https://v2.vuejs.org/v2/guide/transitions

CSS styles defining the 'fade' transition effect for elements. It includes styles for the transition activation state (`-enter-active`, `-leave-active`) and the initial/final states (`-enter`, `-leave-to`) to control opacity over 0.5 seconds.

```css
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

```

--------------------------------

### Apply Classes to Vue Component Root Element

Source: https://v2.vuejs.org/v2/guide/class-and-style

Demonstrates how classes applied to a custom Vue component are merged with existing classes on its root element. Existing classes are preserved and new classes are appended.

```javascript
Vue.component('my-component', {
  template: '<p class="foo bar">Hi</p>'
})

```

```html
<my-component class="baz boo"></my-component>

```

```html
<p class="foo bar baz boo">Hi</p>

```

--------------------------------

### Standard v-model on Input Element

Source: https://v2.vuejs.org/v2/guide/components

Represents the standard usage of v-model on a native input element, synchronizing its value with the 'searchText' data property.

```html
<input v-model="searchText">
```

--------------------------------

### vm.$forceUpdate()

Source: https://v2.vuejs.org/v2/api

Forces the Vue instance to re-render itself and its child components with inserted slot content.

```APIDOC
## vm.$forceUpdate()

### Description
Forces the Vue instance to re-render. This does not affect all child components, only the instance itself and child components with inserted slot content.

### Method
`$forceUpdate`

### Endpoint
N/A (Instance Method)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```javascript
// Example usage (within a method or lifecycle hook):
this.$forceUpdate()
```

### Response
#### Success Response (200)
N/A (This is an instance method, not an API endpoint)

#### Response Example
N/A
```

--------------------------------

### Define and Use a Vue Mixin Object

Source: https://v2.vuejs.org/v2/guide/mixins

Demonstrates how to define a mixin object with lifecycle hooks and methods, and then use it in a Vue component. The mixin's 'created' hook and 'hello' method are integrated into the component.

```javascript
var myMixin = {
  created: function () {
    this.hello()
  },
  methods: {
    hello: function () {
      console.log('hello from mixin!')
    }
  }
}

var Component = Vue.extend({
  mixins: [myMixin]
})

var component = new Component() // => "hello from mixin!"
```

--------------------------------

### CSS Styling for Cat List Item

Source: https://v2.vuejs.org/v2/cookbook/client-side-storage

Provides basic styling for the '.cat' class used within the Vue.js application to display cat names with a fixed width.

```css
.cat {
  width: 100px;
  display: inline-block;
}

```

--------------------------------

### Handling Unwatch with Immediate Option in vm.$watch

Source: https://v2.vuejs.org/v2/api

When using the `immediate: true` option with `vm.$watch`, calling the `unwatch` function within the first callback invocation can lead to errors. It's recommended to check for the `unwatch` function's availability before calling it.

```javascript
var unwatch = vm.$watch(
  'value',
  function () {
    doSomething()
    if (unwatch) {
      unwatch()
    }
  },
  { immediate: true }
)
```

--------------------------------

### v-bind: Attribute and Prop Binding in Vue.js

Source: https://v2.vuejs.org/v2/api

Dynamically binds one or more attributes or component props to an expression. Supports shorthand `:`, dynamic attribute names, class and style bindings (objects/arrays), and DOM property binding with `.prop`. Requires props to be declared in child components for prop binding.

```html
<!-- bind an attribute -->
<img v-bind:src="imageSrc">

<!-- dynamic attribute name (2.6.0+) -->
<button v-bind:[key]="value"></button>

<!-- shorthand -->
<img :src="imageSrc">

<!-- shorthand dynamic attribute name (2.6.0+) -->
<button :[key]="value"></button>

<!-- with inline string concatenation -->
<img :src="'/path/to/images/' + fileName">

<!-- class binding -->
<div :class="{ red: isRed }"></div>
<div :class="[classA, classB]"></div>
<div :class="[classA, { classB: isB, classC: isC }]"></div>

<!-- style binding -->
<div :style="{ fontSize: size + 'px' }"></div>
<div :style="[styleObjectA, styleObjectB]"></div>

<!-- binding an object of attributes -->
<div v-bind="{ id: someProp, 'other-attr': otherProp }"></div>

<!-- DOM attribute binding with prop modifier -->
<div v-bind:text-content.prop="text"></div>

<!-- prop binding. "prop" must be declared in my-component. -->
<my-component :prop="someThing"></my-component>

<!-- pass down parent props in common with a child component -->
<child-component v-bind="$props"></child-component>

<!-- XLink -->
<svg><a :xlink:special="foo"></a></svg>
```

--------------------------------

### Vue.js: Render List with Index using v-for

Source: https://v2.vuejs.org/v2/guide/list

Shows how to render a list using v-for in Vue.js, accessing both the item and its index within the array. It also demonstrates accessing parent scope properties. Requires a Vue instance and an HTML element with the ID 'example-2'.

```html
<ul id="example-2">
  <li v-for="(item, index) in items">
    {{ parentMessage }} - {{ index }} - {{ item.message }}
  </li>
</ul>
```

```javascript
var example2 = new Vue({
  el: '#example-2',
  data: {
    parentMessage: 'Parent',
    items: [
      { message: 'Foo' },
      { message: 'Bar' }
    ]
  }
})
```

--------------------------------

### Custom Input Component Using v-model Pattern

Source: https://v2.vuejs.org/v2/guide/components

Defines a 'custom-input' component that works with v-model. It binds its internal input's value to the 'value' prop and emits an 'input' event with the new value on user input.

```html
Vue.component('custom-input', {
  props: ['value'],
  template: `
    <input
      v-bind:value="value"
      v-on:input="$emit('input', $event.target.value)"
    >
  `
})
```

--------------------------------

### Vue Component Template for Testing

Source: https://v2.vuejs.org/v2/cookbook/unit-testing-vue-components

This is a Vue.js single-file component template used for demonstrating unit testing. It includes an input field, displays an error message based on the username's length, and manages component state using data and computed properties. It has no external dependencies for basic rendering.

```vue
<template>
  <div>
    <input v-model="username">
    <div
      v-if="error"
      class="error"
    >
      {{ error }}
    </div>
  </div>
</template>

<script>
export default {
  name: 'Hello',
  data () {
    return {
      username: ''
    }
  },

  computed: {
    error () {
      return this.username.trim().length < 7
        ? 'Please enter a longer username'
        : ''
    }
  }
}
</script>

```

--------------------------------

### Vue.js: Basic Slot Content Distribution

Source: https://v2.vuejs.org/v2/guide/components-slots

Demonstrates how to use a basic slot in Vue.js to render content provided by a parent component. The `<slot>` element in the child component acts as a placeholder for the parent's content. This is fundamental for creating reusable components.

```html
<navigation-link url="/profile">
  Your Profile
</navigation-link>
```

```html
<a
  v-bind:href="url"
  class="nav-link"
>
  <slot></slot>
</a>
```

--------------------------------

### Staggering List Transitions with Vue.js and Velocity.js

Source: https://v2.vuejs.org/v2/guide/transitions

This snippet demonstrates how to create staggered transitions for a list in Vue.js. It uses the `<transition-group>` component with JavaScript hooks (`before-enter`, `enter`, `leave`) to animate list items. The Velocity.js library is included to handle the animations, and data attributes are used to control the staggering delay.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.3/velocity.min.js"></script>  
  
<div id="staggered-list-demo">  
  <input v-model="query">  
  <transition-group  
    name="staggered-fade"  
    tag="ul"  
    v-bind:css="false"  
    v-on:before-enter="beforeEnter"  
    v-on:enter="enter"  
    v-on:leave="leave"  
  >  
    <li  
      v-for="(item, index) in computedList"  
      v-bind:key="item.msg"  
      v-bind:data-index="index"  
    >{{ item.msg }}</li>  
  </transition-group>  
</div>  

```

```javascript
new Vue({  
  el: '#staggered-list-demo',  
  data: {  
    query: '',  
    list: [  
      { msg: 'Bruce Lee' },  
      { msg: 'Jackie Chan' },  
      { msg: 'Chuck Norris' },  
      { msg: 'Jet Li' },  
      { msg: 'Kung Fury' }  
    ]  
  },  
  computed: {  
    computedList: function () {  
      var vm = this  
      return this.list.filter(function (item) {  
        return item.msg.toLowerCase().indexOf(vm.query.toLowerCase()) !== -1  
      })  
    }  
  },  
  methods: {  
    beforeEnter: function (el) {  
      el.style.opacity = 0  
      el.style.height = 0  
    },  
    enter: function (el, done) {  
      var delay = el.dataset.index * 150  
      setTimeout(function () {  
        Velocity(  
          el,  
          { opacity: 1, height: '1.6em' },  
          { complete: done }  
        )  
      }, delay)  
    },  
    leave: function (el, done) {  
      var delay = el.dataset.index * 150  
      setTimeout(function () {  
        Velocity(  
          el,  
          { opacity: 0, height: 0 },  
          { complete: done }  
        )  
      }, delay)  
    }  
  }  
})  

```

--------------------------------

### Run Docker Container for Vue.js App (http-server)

Source: https://v2.vuejs.org/v2/cookbook/dockerize-vuejs-app

Command to run a Docker container from the built Vue.js image. It maps port 8080 from the host to the container, names the container 'dockerize-vuejs-app-1', and removes the container upon exit. This allows access to the Vue.js app via 'localhost:8080'.

```bash
docker run -it -p 8080:8080 --rm --name dockerize-vuejs-app-1 vuejs-cookbook/dockerize-vuejs-app

```

--------------------------------

### Attribute Binding with v-bind in Vue.js

Source: https://v2.vuejs.org/v2/guide/syntax

Shows how to bind HTML attributes dynamically using the `v-bind` directive. This includes binding regular attributes like `id` and handling boolean attributes such as `disabled`, where their presence or absence controls the attribute's state.

```html
<div v-bind:id="dynamicId"></div>
<button v-bind:disabled="isButtonDisabled">Button</button>
```

--------------------------------

### Vue.js: Handling Multiple Slots with Template Syntax

Source: https://v2.vuejs.org/v2/guide/components-slots

When a component has multiple slots (default and named), the full `<template>` based syntax must be used for all slots to avoid ambiguity. This ensures clarity in how props are passed and accessed.

```html
<current-user>
  <template v-slot:default="slotProps">
    {{ slotProps.user.firstName }}
  </template>

  <template v-slot:other="otherSlotProps">
    ...
  </template>
</current-user>

```

--------------------------------

### VS Code Launch Configurations for Vue.js Debugging

Source: https://v2.vuejs.org/v2/cookbook/debugging-in-vscode

This JSON configuration is for VS Code's `launch.json` file, enabling debugging of Vue.js applications in Chrome and Firefox. It specifies the debugger type, launch request, URL, and workspace root, along with path mappings for source maps.

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "chrome",
      "request": "launch",
      "name": "vuejs: chrome",
      "url": "http://localhost:8080",
      "webRoot": "${workspaceFolder}/src",
      "breakOnLoad": true,
      "sourceMapPathOverrides": {
        "webpack:///src/*": "${webRoot}/*"
      }
    },
    {
      "type": "firefox",
      "request": "launch",
      "name": "vuejs: firefox",
      "url": "http://localhost:8080",
      "webRoot": "${workspaceFolder}/src",
      "pathMappings": [{
        "url": "webpack:///src/",
        "path": "${webRoot}/"
      }]
    }
  ]
}
```

--------------------------------

### Vue.js App for Managing Cats with Local Storage

Source: https://v2.vuejs.org/v2/cookbook/client-side-storage

A Vue.js application that allows users to add, remove, and view a list of cats. It persists this list in the browser's Local Storage by serializing the array to JSON. The `mounted` hook retrieves data, and methods handle updates and saving.

```html
<div id="app">  
  <h2>Cats</h2>  
  <div v-for="(cat, n) in cats">  
    <p>  
      <span class="cat">{{ cat }}</span>  
      <button @click="removeCat(n)">Remove</button>  
    </p>  
  </div>  
  
  <p>  
    <input v-model="newCat">  
    <button @click="addCat">Add Cat</button>  
  </p>  
</div>  
```

```javascript
const app = new Vue({
  el: '#app',
  data: {
    cats: [],
    newCat: null
  },
  mounted() {
    if (localStorage.getItem('cats')) {
      try {
        this.cats = JSON.parse(localStorage.getItem('cats'));
      } catch(e) {
        localStorage.removeItem('cats');
      }
    }
  },
  methods: {
    addCat() {
      // ensure they actually typed something
      if (!this.newCat) {
        return;
      }

      this.cats.push(this.newCat);
      this.newCat = '';
      this.saveCats();
    },
    removeCat(x) {
      this.cats.splice(x, 1);
      this.saveCats();
    },
    saveCats() {
      const parsed = JSON.stringify(this.cats);
      localStorage.setItem('cats', parsed);
    }
  }
})

```

--------------------------------

### Vue HTML for List Transitions

Source: https://v2.vuejs.org/v2/guide/transitions

Renders a list of items using Vue's <transition-group> component. It includes buttons to add and remove items, with each item having a unique key and applying 'list-item' class.

```html
<div id="list-demo">
  <button v-on:click="add">Add</button>
  <button v-on:click="remove">Remove</button>
  <transition-group name="list" tag="p">
    <span v-for="item in items" v-bind:key="item" class="list-item">
      {{ item }}
    </span>
  </transition-group>
</div>
```

--------------------------------

### Vue.js: Listen for an Event Once with $once

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Shows how to use the `$once` method to listen for an event exactly one time. This is particularly useful for setting up listeners that should only be triggered a single instance, like for cleanup tasks during component destruction. It accepts the event name and a handler function.

```javascript
this.$once('hook:beforeDestroy', function () {
  picker.destroy()
})
```

--------------------------------

### Vue Render Function with Error Handling (JavaScript)

Source: https://v2.vuejs.org/v2/api

Demonstrates how to use the 'render' function for programmatic VNode creation and 'renderError' to provide alternative output when the render function encounters an error. The renderError function is only active in development mode and receives the error object.

```javascript
new Vue({
  render (h) {
    throw new Error('oops')
  },
  renderError (h, err) {
    return h('pre', { style: { color: 'red' }}, err.stack)
  }
}).$mount('#app')
```

--------------------------------

### vm.$slots

Source: https://v2.vuejs.org/v2/api

Provides programmatic access to content distributed by slots, mapping named slots to corresponding properties. The 'default' property holds content not in a named slot or content from v-slot:default.

```APIDOC
## vm.$slots

### Description
Used to programmatically access content distributed by slots. Each named slot has its own corresponding property (e.g. the contents of `v-slot:foo` will be found at `vm.$slots.foo`). The `default` property contains either nodes not included in a named slot or contents of `v-slot:default`.

Slots are **not** reactive. For re-rendering based on slot data changes, use reactive instance options like `props` or `data`.

`v-slot:foo` is supported in v2.6+. For older versions, use deprecated syntax.

Accessing `vm.$slots` is most useful when writing a component with a render function.

### Type
`{ [name: string]: ?Array<VNode> }`

### Read only
Yes

### Reactive?
No

### See also
* `<slot>` Component
* Content Distribution with Slots
* Render Functions - Slots

### Example
```html
<blog-post>
  <template v-slot:header>
    <h1>About Me</h1>
  </template>

  <p>Here's some page content, which will be included in vm.$slots.default, because it's not inside a named slot.</p>

  <template v-slot:footer>
    <p>Copyright 2016 Evan You</p>
  </template>

  <p>If I have some content down here, it will also be included in vm.$slots.default.</p>
</blog-post>
```

```javascript
Vue.component('blog-post', {
  render: function (createElement) {
    var header = this.$slots.header
    var body   = this.$slots.default
    var footer = this.$slots.footer
    return createElement('div', [
      createElement('header', header),
      createElement('main', body),
      createElement('footer', footer)
    ])
  }
})
```
```

--------------------------------

### Display API Data in Vue.js Template

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This snippet illustrates how to display fetched API data within a Vue.js template. It uses Vue's mustache syntax `{{ info }}` to render the data stored in the 'info' component property. This is a simple representation of the output from the previous API call.

```html
<div id="app">
  {{ info }}
</div>
```

--------------------------------

### Set Reactive Property with vm.$set

Source: https://v2.vuejs.org/v2/api

Add or update a property on an object or an element in an array reactively using `vm.$set`. This method is an alias for the global `Vue.set` and ensures that Vue's reactivity system tracks the change.

```javascript
vm.$set( target, propertyNameOrIndex, value )
```

--------------------------------

### Define Async Component with Factory Function (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-dynamic-async

This snippet shows how to define an asynchronous component using a factory function that resolves the component definition after a delay. The factory function receives a `resolve` callback, which should be called with the component definition. This is useful for lazy-loading components.

```javascript
Vue.component('async-example', function (resolve, reject) {
  setTimeout(function () {
    // Pass the component definition to the resolve callback
    resolve({
      template: '<div>I am async!</div>'
    })
  }, 1000)
})
```

--------------------------------

### Custom Key Aliases for Vue Events

Source: https://v2.vuejs.org/v2/api

Defines custom key aliases for v-on event listeners using Vue.config.keyCodes. This allows for shorthand notation in templates, like @keyup.media-play-pause. It maps string aliases to specific key codes.

```javascript
Vue.config.keyCodes = {
  v: 86,
  f1: 112,
  // camelCase won`t work
  mediaPlayPause: 179,
  // instead you can use kebab-case with double quotation marks
  "media-play-pause": 179,
  up: [38, 87]
}
```

```html
<input type="text" @keyup.media-play-pause="method">
```

--------------------------------

### Attribute Binding with v-bind

Source: https://v2.vuejs.org/v2/guide/syntax

The v-bind directive, also known as its shorthand ':', is used to reactively update an HTML attribute. The argument specifies which attribute to bind, and the value is the JavaScript expression whose result will be assigned to the attribute.

```html
<a v-bind:href="url"> ... </a>
```

```html
<a :href="url"> ... </a>
```

--------------------------------

### Vue $destroy: Destroy instance and clean up

Source: https://v2.vuejs.org/v2/api

The $destroy method completely destroys a Vue instance, cleaning up event listeners, unbinding directives, and triggering lifecycle hooks. In most cases, managing component lifecycle with v-if and v-for is preferred over manual destruction.

```javascript
// Usage example:
// this.$destroy()
```

--------------------------------

### Vue v-model Value Bindings

Source: https://v2.vuejs.org/v2/guide/forms

Demonstrates using v-model with radio buttons, checkboxes, and select options to bind to static or dynamic string/boolean values. Shows how v-bind can be used for non-string values.

```html
<!-- `picked` is a string "a" when checked -->
<input type="radio" v-model="picked" value="a">

<!-- `toggle` is either true or false -->
<input type="checkbox" v-model="toggle">

<!-- `selected` is a string "abc" when the first option is selected -->
<select v-model="selected">
  <option value="abc">ABC</option>
</select>
```

--------------------------------

### Local Vue Component Registration in Vue Instance

Source: https://v2.vuejs.org/v2/guide/components-registration

Demonstrates how to locally register components within a Vue instance's `components` option. The keys of the `components` object become the custom element tag names, and the values are the component definition objects.

```javascript
new Vue({
  el: '#app',
  components: {
    'component-a': ComponentA,
    'component-b': ComponentB
  }
})
```

--------------------------------

### Animate Numerical State Changes with Vue.js and GreenSock

Source: https://v2.vuejs.org/v2/guide/transitioning-state

This snippet demonstrates animating numerical state changes in Vue.js using the `watch` property and the GreenSock animation library (GSAP). It listens for changes in a numerical input, tweens the value to a `tweenedNumber` property, and displays the animated result. Requires the GSAP library to be included.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.4/gsap.min.js"></script>  
  
<div id="animated-number-demo">  
  <input v-model.number="number" type="number" step="20">  
  <p>{{ animatedNumber }}</p>  
</div>  
```

```javascript
new Vue({
  el: '#animated-number-demo',
  data: {
    number: 0,
    tweenedNumber: 0
  },
  computed: {
    animatedNumber: function() {
      return this.tweenedNumber.toFixed(0);
    }
  },
  watch: {
    number: function(newValue) {
      gsap.to(this.$data, { duration: 0.5, tweenedNumber: newValue });
    }
  }
})
```

--------------------------------

### Passing Object Properties with v-bind in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-props

Demonstrates how to pass all properties of a JavaScript object as props to a Vue component using `v-bind` without an argument. This simplifies template syntax when a component expects multiple props that match an object's structure.

```javascript
post: {
  id: 1,
  title: 'My Journey with Vue'
}
```

```html
<blog-post v-bind="post"></blog-post>
```

```html
<blog-post
  v-bind:id="post.id"
  v-bind:title="post.title"
></blog-post>
```

--------------------------------

### Parent Listening to Child 'enlarge-text' Event

Source: https://v2.vuejs.org/v2/guide/components

Demonstrates how a parent component listens for a custom 'enlarge-text' event emitted by its child 'blog-post' component. Upon receiving the event, it increments the 'postFontSize' data property.

```html
<blog-post
  ...
  v-on:enlarge-text="postFontSize += 0.1"
></blog-post>
```

--------------------------------

### Vue.js: Listening to DOM Events with v-on

Source: https://v2.vuejs.org/v2/guide/events

Demonstrates how to use the `v-on` directive to listen to DOM events like 'click' and update data properties directly. This is suitable for simple event logic.

```html
<div id="example-1">
  <button v-on:click="counter += 1">Add 1</button>
  <p>The button above has been clicked {{ counter }} times.</p>
</div>
```

```javascript
var example1 = new Vue({
  el: '#example-1',
  data: {
    counter: 0
  }
})
```

--------------------------------

### v-pre: Skip Vue.js Compilation

Source: https://v2.vuejs.org/v2/api

Skips Vue.js compilation for the element and its children, allowing raw mustache tags (`{{ }}`) to be displayed. Useful for displaying uncompiled content or for performance improvements by skipping compilation on large, directive-free nodes.

```html
<span v-pre>{{ this will not be compiled }}</span>
```

--------------------------------

### Dynamic Component Rendering with Vue's 'component' Tag

Source: https://v2.vuejs.org/v2/api

The 'component' tag in Vue.js is used to render dynamic components. The 'is' prop determines which component to render, accepting a string tag name, a component definition, or a component constructor. It can be bound to a data property to control the rendered component dynamically.

```html
<component :is="componentId"></component>

<component :is="$options.components.child"></component>
```

--------------------------------

### Switching Components with 'is' Attribute in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-dynamic-async

This code snippet demonstrates how to use the 'is' attribute on a <component> tag to dynamically switch between different components, commonly used in tabbed interfaces. It requires a data property in the Vue instance to hold the name of the currently active component.

```html
<component v-bind:is="currentTabComponent"></component>
```

--------------------------------

### Vue.js: Programmatically Listen for Events with $on

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Demonstrates how to programmatically listen for events on a Vue instance using the `$on` method. This is useful for advanced event handling scenarios not covered by template directives. It takes the event name and a handler function as arguments.

```javascript
this.$on('eventName', function (event) {
  // Handle the event
})
```

--------------------------------

### Defining Global Filters in Vue.js

Source: https://v2.vuejs.org/v2/guide/filters

Illustrates how to define filters globally using `Vue.filter()`. Global filters are accessible in any Vue instance or component after their definition.

```javascript
Vue.filter('capitalize', function (value) {
  if (!value) return ''
  value = value.toString()
  return value.charAt(0).toUpperCase() + value.slice(1)
})

new Vue({
  // ...
})
```

--------------------------------

### Vue.js keep-alive with include/exclude Props

Source: https://v2.vuejs.org/v2/api

The `include` and `exclude` props for `<keep-alive>` allow conditional caching of components. They accept a comma-delimited string, a RegExp, or an Array to specify which components should or should not be cached.

```html
<!-- comma-delimited string -->
<keep-alive include="a,b">
  <component :is="view"></component>
</keep-alive>

<!-- regex (use `v-bind`) -->
<keep-alive :include="/a|b/">
  <component :is="view"></component>
</keep-alive>

<!-- Array (use `v-bind`) -->
<keep-alive :include="['a', 'b']">
  <component :is="view"></component>
</keep-alive>
```

--------------------------------

### Accessing Parent Instance in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Illustrates how to access the parent component instance from a child component using the `$parent` property. While useful in specific scenarios like abstract components or shared libraries, it can make debugging difficult and is generally discouraged in favor of props or dependency injection.

```html
<google-map>
  <google-map-markers v-bind:places="iceCreamShops"></google-map-markers>
</google-map>
```

```javascript
// Inside <google-map-markers> accessing parent map property
// this.$parent.getMap

// Example of fragile access when nesting components
var map = this.$parent.map || this.$parent.$parent.map;
```

--------------------------------

### Vue.js: Simple Store Pattern for State Management

Source: https://v2.vuejs.org/v2/guide/state-management

Implements a basic store pattern for centralized state management in Vue.js. It includes state, actions to mutate the state, and debugging capabilities. This pattern helps in managing complex applications by centralizing state changes.

```javascript
var store = {
  debug: true,
  state: {
    message: 'Hello!'
  },
  setMessageAction (newValue) {
    if (this.debug) console.log('setMessageAction triggered with', newValue)
    this.state.message = newValue
  },
  clearMessageAction () {
    if (this.debug) console.log('clearMessageAction triggered')
    this.state.message = ''
  }
}
```

--------------------------------

### Conditional Loop Execution with v-if and v-else (Vue.js)

Source: https://v2.vuejs.org/v2/guide/list

Shows how to conditionally execute the entire v-for loop using v-if on a wrapper element. This approach is preferred when you want to skip the loop entirely based on a condition, with v-else providing fallback content.

```html
<ul v-if="todos.length">
  <li v-for="todo in todos">
    {{ todo }}
  </li>
</ul>
<p v-else>No todos left!</p>
```

--------------------------------

### Vue.directive()

Source: https://v2.vuejs.org/v2/api

Registers or retrieves a global directive.

```APIDOC
## Vue.directive( id, [definition] )

### Description

Register or retrieve a global directive.

### Method

`Vue.directive

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

*   **id** (string) - The ID of the directive
*   **definition** (Function | Object) - Optional directive definition

### Request Example

```javascript
// register  
Vue.directive('my-directive', {
  bind: function () {},
  inserted: function () {},
  update: function () {},
  componentUpdated: function () {},
  unbind: function () {}
})

// register (function directive)  
Vue.directive('my-directive', function () {
  // this will be called as `bind` and `update`
})

// getter, return the directive definition if registered  
var myDirective = Vue.directive('my-directive')
```

### Response

None

#### Success Response (200)

None

#### Response Example

None

### See also

Custom Directives
```

--------------------------------

### Vue.js Template Using Base Components

Source: https://v2.vuejs.org/v2/guide/components-registration

This HTML snippet illustrates how base components, once registered globally or manually, can be used directly in a Vue.js template. It shows the usage of BaseInput, BaseButton, and BaseIcon components with event handling and v-model binding.

```html
<BaseInput  
  v-model="searchText"  
  @keydown.enter="search"  
/>  
<BaseButton @click="search">  
  <BaseIcon name="search"/>  
</BaseButton>
```

--------------------------------

### Reusable Transition Component with Functional Components in Vue.js

Source: https://v2.vuejs.org/v2/guide/transitions

This snippet illustrates creating a reusable transition component using Vue.js functional components. Functional components are well-suited for this purpose as they are stateless and do not have instances. The `render` function uses `createElement` to define the `<transition>` component with its props and event listeners.

```javascript
Vue.component('my-special-transition', {  
  functional: true,  
  render: function (createElement, context) {  
    var data = {  
      props: {  
        name: 'very-special-transition',  
        mode: 'out-in'  
      },  
      on: {  
        beforeEnter: function (el) {  
          // ...  
        },  
        afterEnter: function (el) {  
          // ...  
        }  
      }  
    }  
    return createElement('transition', data, context.children)  
  }  
})  

```

--------------------------------

### Vue.js: createElement Function Signature and Arguments

Source: https://v2.vuejs.org/v2/guide/render-function

Details the signature and arguments of Vue.js's createElement function. It accepts an HTML tag name or component, an optional data object for attributes and properties, and an optional array of children VNodes or text strings.

```javascript
// @returns {VNode}
createElement(
  // {String | Object | Function}
  // An HTML tag name, component options, or async
  // function resolving to one of these. Required.
  'div',

  // {Object}
  // A data object corresponding to the attributes
  // you would use in a template. Optional.
  {
    // (see details in the next section below)
  },

  // {String | Array}
  // Children VNodes, built using `createElement()`,
  // or using strings to get 'text VNodes'. Optional.
  [
    'Some text comes first.',
    createElement('h1', 'A headline'),
    createElement(MyComponent, {
      props: {
        someProp: 'foobar'
      }
    })
  ]
)
```

--------------------------------

### vm.$listeners

Source: https://v2.vuejs.org/v2/api

Contains event listeners from the parent scope (excluding `.native` modifiers) bound using `v-on`. This can be passed down to an inner component using `v-on="$listeners"`, facilitating the creation of transparent wrapper components.

```APIDOC
## vm.$listeners

### Description
Contains parent-scope `v-on` event listeners (without `.native` modifiers). This can be passed down to an inner component via `v-on="$listeners"` - useful when creating transparent wrapper components.

### Type
`{ [key: string]: Function | Array<Function> }`

### Read only
Yes

### New in
2.4.0+
```

--------------------------------

### Vue.js JavaScript Transition Hooks

Source: https://v2.vuejs.org/v2/guide/transitions

Define JavaScript hooks for various stages of the enter and leave transitions. These hooks allow for custom logic execution before, during, and after transitions. For JavaScript-only transitions, the `done` callback in `enter` and `leave` hooks is mandatory.

```html
<transition
  v-on:before-enter="beforeEnter"
  v-on:enter="enter"
  v-on:after-enter="afterEnter"
  v-on:enter-cancelled="enterCancelled"

  v-on:before-leave="beforeLeave"
  v-on:leave="leave"
  v-on:after-leave="afterLeave"
  v-on:leave-cancelled="leaveCancelled"
>
  <!-- ... -->
</transition>
```

```javascript
methods: {
  beforeEnter: function (el) {
    // ...
  },
  enter: function (el, done) {
    // ...
    done()
  },
  afterEnter: function (el) {
    // ...
  },
  enterCancelled: function (el) {
    // ...
  },

  beforeLeave: function (el) {
    // ...
  },
  leave: function (el, done) {
    // ...
    done()
  },
  afterLeave: function (el) {
    // ...
  },
  leaveCancelled: function (el) {
    // ...
  }
}
```

--------------------------------

### Vue.js: Bind Class with Object Syntax

Source: https://v2.vuejs.org/v2/guide/class-and-style

Dynamically toggle CSS classes by binding an object to `v-bind:class`. The presence of a class is determined by the truthiness of the corresponding data property. This supports multiple class toggles and can coexist with static class attributes.

```html
<div v-bind:class="{ active: isActive }"></div>
```

```html
<div class="static" v-bind:class="{ active: isActive, 'text-danger': hasError }"></div>
```

```javascript
data: {
  isActive: true,
  hasError: false
}
```

```html
<div v-bind:class="classObject"></div>
```

```javascript
data: {
  classObject: {
    active: true,
    'text-danger': false
  }
}
```

```html
<div v-bind:class="classObject"></div>
```

```javascript
data: {
  isActive: true,
  error: null
},
computed: {
  classObject: function () {
    return {
      active: this.isActive && !this.error,
      'text-danger': this.error && this.error.type === 'fatal'
    }
  }
}
```

--------------------------------

### Apply Multiple Inline Styles using Array Syntax in Vue

Source: https://v2.vuejs.org/v2/guide/class-and-style

Explains how to apply multiple style objects to a single Vue element using the array syntax for v-bind:style. This allows for merging styles from different sources.

```html
<div v-bind:style="[baseStyles, overridingStyles]"></div>

```

--------------------------------

### Mixins

Source: https://v2.vuejs.org/v2/api

The `mixins` option accepts an array of mixin objects, allowing you to reuse component logic. Mixin hooks are called before the component's own hooks.

```APIDOC
## Mixins

### Description
Allows reusing component logic by providing an array of mixin objects. These objects merge with the component's options, and their hooks are called before the component's own hooks.

### Method
Component Option

### Endpoint
N/A

### Parameters
#### Request Body
- **mixins** (Array<Object>) - Required - An array of mixin objects. Each object can contain instance options like `created`, `methods`, `data`, etc.

### Request Example
```javascript
var mixin = {
  created: function() {
    console.log('Mixin created hook');
  }
};

var MyComponent = {
  template: '<div>My Component</div>',
  created: function() {
    console.log('Component created hook');
  },
  mixins: [mixin]
};
```

### Response
#### Success Response (200)
N/A (This is a component option, not an API endpoint)

#### Response Example
N/A
```

--------------------------------

### Vue Optional Injection with Default (2.5.0+)

Source: https://v2.vuejs.org/v2/api

Demonstrates making injections optional with a default value in Vue.js (v2.5.0+). The 'inject' option can be an object where the default value is specified.

```javascript
const Child = {
  inject: {
    foo: { default: 'foo' }
  }
}
```

--------------------------------

### Bind Dynamic Classes to Vue Component

Source: https://v2.vuejs.org/v2/guide/class-and-style

Illustrates using the v-bind:class directive to dynamically add classes to a Vue component based on a data property. Classes are merged with existing ones.

```html
<my-component v-bind:class="{ active: isActive }"></my-component>

```

```html
<p class="foo bar active">Hi</p>

```

--------------------------------

### Vue.js Template Compilation Demo

Source: https://v2.vuejs.org/v2/guide/render-function

This snippet is part of a demo showcasing Vue.js's template compilation process. It specifically shows how the `staticRenderFns` property, generated by `Vue.compile`, can be formatted, highlighting the compilation of template features into render functions.

```javascript
staticRenderFns: result.staticRenderFns.map(this.formatFunction)

```

--------------------------------

### vm.$scopedSlots

Source: https://v2.vuejs.org/v2/api

Allows programmatic access to scoped slots. Each slot, including the default, is represented by a function that returns VNodes. It's recommended to use this for render functions, as it simplifies refactoring and migration to Vue 3.

```APIDOC
## vm.$scopedSlots

### Description
Used to programmatically access scoped slots. For each slot, including the `default` one, the object contains a corresponding function that returns VNodes.

Accessing `vm.$scopedSlots` is most useful when writing a component with a render function.

**Note:** since 2.6.0+, there are two notable changes to this property:
    1. Scoped slot functions are now guaranteed to return an array of VNodes, unless the return value is invalid, in which case the function will return `undefined`.
    2. All `$slots` are now also exposed on `$scopedSlots` as functions. If you work with render functions, it is now recommended to always access slots via `$scopedSlots`, whether they currently use a scope or not. This will not only make future refactors to add a scope simpler, but also ease your eventual migration to Vue 3, where all slots will be functions.

### Type
`{ [name: string]: props => Array<VNode> | undefined }`

### Read only
Yes

### New in
2.1.0+

### See also
* `<slot>` Component
* Scoped Slots
* Render Functions - Slots
```

--------------------------------

### Custom Warning Handler for Vue

Source: https://v2.vuejs.org/v2/api

Assigns a custom function to Vue.config.warnHandler to handle runtime Vue warnings. This handler is only active in development environments and receives the warning message, Vue instance, and component trace.

```javascript
Vue.config.warnHandler = function (msg, vm, trace) {
  // `trace` is the component hierarchy trace
}
```

--------------------------------

### v-if, v-else-if, and v-else Directives

Source: https://v2.vuejs.org/v2/api

These directives provide conditional rendering capabilities. `v-if` conditionally renders an element, destroying and reconstructing it on toggles. `v-else-if` allows for chained conditional rendering, and `v-else` provides a fallback block. They trigger transitions when conditions change.

```APIDOC
## v-if

### Description
Conditionally render the element based on the truthy-ness of the expression value. The element and its contained directives / components are destroyed and re-constructed during toggles. This directive triggers transitions when its condition changes.

### Expects
`any`

### See also
Conditional Rendering - v-if
```

```APIDOC
## v-else

### Description
Denote the “else block” for `v-if` or a `v-if`/`v-else-if` chain. The previous sibling element must have `v-if` or `v-else-if`.

### Restriction
Previous sibling element must have `v-if` or `v-else-if`.

### Example
```html
<div v-if="Math.random() > 0.5">
  Now you see me
</div>
<div v-else>
  Now you don't
</div>
```

### See also
Conditional Rendering - v-else
```

```APIDOC
## v-else-if

### Description
Denote the “else if block” for `v-if`. Can be chained. The previous sibling element must have `v-if` or `v-else-if`.

### Restriction
Previous sibling element must have `v-if` or `v-else-if`.

### Expects
`any`

### Example
```html
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'B'">
  B
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>
```

### See also
Conditional Rendering - v-else-if
```

--------------------------------

### Define Component Accepting an Object Prop in Vue.js

Source: https://v2.vuejs.org/v2/guide/components

Registers a Vue component that accepts a single 'post' prop, which is an object. The component's template then accesses properties like 'post.title' and 'post.content' from this object. Uses JavaScript template literals for multi-line template readability.

```javascript
Vue.component('blog-post', {
  props: ['post'],
  template: `
    <div class="blog-post">
      <h3>{{ post.title }}</h3>
      <div v-html="post.content"></div>
    </div>
  `
})
```

--------------------------------

### Vue Auto-prefixing for Inline Styles

Source: https://v2.vuejs.org/v2/guide/class-and-style

Highlights Vue's automatic vendor prefixing for CSS properties like 'transform' when used with v-bind:style. This ensures cross-browser compatibility.

--------------------------------

### Vue.js: Method Event Handlers with v-on

Source: https://v2.vuejs.org/v2/guide/events

Shows how to associate DOM events with methods defined in the Vue instance's `methods` object for more complex event handling logic. It also demonstrates accessing the native DOM event within the method.

```html
<div id="example-2">
  <button v-on:click="greet">Greet</button>
</div>
```

```javascript
var example2 = new Vue({
  el: '#example-2',
  data: {
    name: 'Vue.js'
  },
  methods: {
    greet: function (event) {
      alert('Hello ' + this.name + '!');
      if (event) {
        alert(event.target.tagName);
      }
    }
  }
});

example2.greet()
```

--------------------------------

### Vue.js TypeScript Configuration (tsconfig.json)

Source: https://v2.vuejs.org/v2/guide/typescript

This JSON configuration is essential for enabling TypeScript support within a Vue.js project. It specifies compiler options like target JavaScript version, strict type checking, and module resolution, ensuring compatibility and robust type inference.

```json
{
  "compilerOptions": {
    "target": "es5",
    "strict": true,
    "module": "es2015",
    "moduleResolution": "node"
  }
}
```

--------------------------------

### Vue.js: Sharing State Between Instances

Source: https://v2.vuejs.org/v2/guide/state-management

Demonstrates how to share a single source of truth between multiple Vue instances by directly referencing the same data object. This allows for automatic view updates when the shared state is mutated.

```javascript
var sourceOfTruth = {}
  
var vmA = new Vue({
  data: sourceOfTruth
})
  
var vmB = new Vue({
  data: sourceOfTruth
})
```

--------------------------------

### Manual Component Registration in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-registration

This snippet demonstrates the traditional way of importing and registering components within a Vue.js component's script. It requires explicit import statements for each base component and their subsequent listing in the 'components' option.

```javascript
import BaseButton from './BaseButton.vue'  
import BaseIcon from './BaseIcon.vue'  
import BaseInput from './BaseInput.vue'  
  
export default {  
  components: {  
    BaseButton,  
    BaseIcon,  
    BaseInput  
  }  
}
```

--------------------------------

### Define Component Props in Vue.js

Source: https://v2.vuejs.org/v2/guide/components

Registers a Vue component named 'blog-post' that accepts a 'title' prop. The prop is then displayed within the component's template. This is the fundamental way to declare accepted props for a component.

```javascript
Vue.component('blog-post', {
  props: ['title'],
  template: '<h3>{{ title }}</h3>'
})
```

--------------------------------

### Vue.js: Global Component Registration for Recursive Components

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Shows how global component registration using `Vue.component` automatically sets the component's `name` option. This simplifies the process of making components available globally and enabling recursive self-referencing.

```javascript
Vue.component('unique-name-of-my-component', {
  // ... component options
})
```

--------------------------------

### Watch Expression or Function with vm.$watch

Source: https://v2.vuejs.org/v2/api

Observe changes in a Vue instance's expression or computed function. The callback receives new and old values. Supports dot-delimited paths for expressions or a function for complex logic. Note that for object/array mutations, old and new values might reference the same object.

```javascript
vm.$watch('a.b.c', function (newVal, oldVal) {
  // do something
})

vm.$watch(
  function () {
    return this.a + this.b
  },
  function (newVal, oldVal) {
    // do something
  }
)
```

--------------------------------

### Vue Component Definitions for Media Layout

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

Defines several Vue components including ImageOne, ImageTwo, ImageThree, and MediaLayout. MediaLayout accepts a 'flipped' prop and manages its own 'media' data property. These are registered in the main Vue instance.

```javascript
const ImageOne = {
  template: '#imagearea1'
}

const ImageTwo = {
  template: '#imagearea2'
}

const ImageThree = {
  template: '#imagearea3'
}

const MediaLayout = {
  template: '#medialayout',
  props: {
    flipped: {
      default: false,
      type: Boolean,
      required: false
    }
  },
  data() {
    return {
      media: 'media'
    }
  }
}

new Vue({
  el: '#app',
  components: {
    MediaLayout,
    ImageOne,
    ImageTwo,
    ImageThree
  }
})
```

--------------------------------

### Vue.js: Render Object Properties with Key using v-for

Source: https://v2.vuejs.org/v2/guide/list

Shows how to use v-for in Vue.js to iterate over an object's properties, accessing both the value and its corresponding key (property name).

```html
<div v-for="(value, name) in object">
  {{ name }}: {{ value }}
</div>
```

--------------------------------

### Vue.js Reactivity: Adding Reactive Properties to Nested Objects

Source: https://v2.vuejs.org/v2/guide/reactivity

Shows how to add new reactive properties to a nested object within a Vue instance using `Vue.set` or the instance's `$set` method.

```javascript
Vue.set(vm.someObject, 'b', 2)
```

```javascript
this.$set(this.someObject, 'b', 2)
```

--------------------------------

### Name Option

Source: https://v2.vuejs.org/v2/api

The `name` option allows a component to recursively invoke itself and improves debugging and identification in tools like Vue Devtools.

```APIDOC
## Name Option

### Description
Assigns a name to a component, which is crucial for recursive component invocation and provides more informative debugging messages and clearer component identification in Vue Devtools.

### Method
Component Option

### Endpoint
N/A

### Parameters
#### Request Body
- **name** (string) - Required - The name of the component.

### Request Example
```javascript
var RecursiveComponent = {
  name: 'RecursiveComponent',
  template: '<div><recursive-component></recursive-component></div>'
};
```

### Response
#### Success Response (200)
N/A

#### Response Example
N/A
```

--------------------------------

### key Attribute for Efficient List Reconciliation

Source: https://v2.vuejs.org/v2/api

The key attribute is a hint for Vue's virtual DOM diffing algorithm, identifying VNodes when comparing lists. It helps in reordering elements based on key changes and ensures proper element removal/destruction. Duplicate keys cause render errors. It expects a number, string, boolean, or symbol.

```html
<ul>
  <li v-for="item in items" :key="item.id">...</li>
</ul>
```

```html
<transition>
  <span :key="text">{{ text }}</span>
</transition>
```

--------------------------------

### Bind Inline Styles via Style Object in Vue

Source: https://v2.vuejs.org/v2/guide/class-and-style

Demonstrates binding inline styles to a Vue element by referencing a style object defined in the component's data. This simplifies template readability.

```html
<div v-bind:style="styleObject"></div>

```

```javascript
data: {
  styleObject: {
    color: 'red',
    fontSize: '13px'
  }
}

```

--------------------------------

### HTML Attribute Casing for Vue Props

Source: https://v2.vuejs.org/v2/guide/components-props

Explains the difference in prop casing between JavaScript (camelCase) and HTML (kebab-case). When using in-DOM templates, camelCased prop names in JavaScript must be converted to their kebab-cased equivalents in the HTML template.

```html
<!-- kebab-case in HTML -->
<blog-post post-title="hello!"></blog-post>
```

--------------------------------

### Passing Arguments to Vue.js Filters

Source: https://v2.vuejs.org/v2/guide/filters

Shows how to pass arguments to filters in Vue.js expressions. The filter function receives the value as the first argument, followed by any additional arguments passed in the expression.

```html
{{ message | filterA('arg1', arg2) }}
```

--------------------------------

### Vue CSS for Component Fade Transition

Source: https://v2.vuejs.org/v2/guide/transitions

Provides CSS rules for the 'component-fade' transition effect. It defines opacity changes during the enter and leave phases of a component transition, creating a fading effect.

```css
.component-fade-enter-active, .component-fade-leave-active {
  transition: opacity .3s ease;
}
.component-fade-enter, .component-fade-leave-to 
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
```

--------------------------------

### v-for with Custom Component (Vue.js)

Source: https://v2.vuejs.org/v2/guide/list

Illustrates using the v-for directive on a custom Vue.js component. A 'key' attribute is required for components when using v-for in versions 2.2.0+.

```html
<my-component v-for="item in items" :key="item.id"></my-component>
```

--------------------------------

### Vue.js Component Naming: PascalCase

Source: https://v2.vuejs.org/v2/guide/components-registration

Illustrates defining a component name using PascalCase. When using PascalCase, you can reference the custom element in either PascalCase or kebab-case (e.g., `<MyComponentName>` or `<my-component-name>`). However, only kebab-case is valid directly in the DOM.

```javascript
Vue.component('MyComponentName', { /* ... */ })
```

--------------------------------

### Vue.js Basic keep-alive Usage

Source: https://v2.vuejs.org/v2/api

The `<keep-alive>` component is an abstract component used to cache inactive component instances. It does not render a DOM element itself. When wrapped around a dynamic component, it prevents the component from being destroyed when toggled.

```html
<keep-alive>
  <component :is="view"></component>
</keep-alive>

<!-- multiple conditional children -->
<keep-alive>
  <comp-a v-if="a > 1"></comp-a>
  <comp-b v-else></comp-b>
</keep-alive>

<!-- used together with `<transition>` -->
<transition>
  <keep-alive>
    <component :is="view"></component>
  </keep-alive>
</transition>
```

--------------------------------

### HTML Structure for Choices.js Integration in Vue

Source: https://v2.vuejs.org/v2/cookbook/avoiding-memory-leaks

This HTML snippet sets up the basic structure for a Vue component that uses the Choices.js library. It includes the necessary CSS and JavaScript external links and a conditional rendering of a select element managed by Vue.

```html
<link rel='stylesheet prefetch' href='https://joshuajohnson.co.uk/Choices/assets/styles/css/choices.min.css?version=3.0.3'>
<script src='https://joshuajohnson.co.uk/Choices/assets/scripts/dist/choices.min.js?version=3.0.3'></script>

<div id="app">
  <button
    v-if="showChoices"
    @click="hide"
  >Hide</button>
  <button
    v-if="!showChoices"
    @click="show"
  >Show</button>
  <div v-if="showChoices">
    <select id="choices-single-default"></select>
  </div>
</div>
```

--------------------------------

### Unit Test a Vue Component with Vue Test Utils

Source: https://v2.vuejs.org/v2/cookbook/unit-testing-vue-components

This JavaScript code snippet demonstrates unit testing a Vue.js component using Vue Test Utils. It renders the component in isolation, simulates user input to change component state, and asserts that the UI correctly reflects these state changes, specifically focusing on the rendering of an error message. It requires `@vue/test-utils` and the component being tested.

```javascript
import { shallowMount } from '@vue/test-utils'
import Hello from './Hello.vue'

test('Hello', () => {
  // render the component
  const wrapper = shallowMount(Hello)

  // should not allow for `username` less than 7 characters, excludes whitespace
  wrapper.setData({ username: ' '.repeat(7) })

  // assert the error is rendered
  expect(wrapper.find('.error').exists()).toBe(true)

  // update the name to be long enough
  wrapper.setData({ username: 'Lachlan' })

  // assert the error has gone away
  expect(wrapper.find('.error').exists()).toBe(false)
})

```

--------------------------------

### Vue Inject Default Factory for Non-Primitives

Source: https://v2.vuejs.org/v2/api

Shows how to provide a factory function for default values of non-primitive types when injecting in Vue.js. This ensures that new default values are created for each component instance if needed.

```javascript
const Child = {
  inject: {
    foo: {
      from: 'bar',
      default: () => [1, 2, 3]
    }
  }
}
```

--------------------------------

### Vue.js: Resolve Circular Component References with Async Import

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

An alternative method to resolve circular component references in Vue.js using asynchronous `import()` within the component's local registration. This approach leverages dynamic imports to break the dependency loop, allowing components to be loaded on demand.

```javascript
components: {
  TreeFolderContents: () => import('./tree-folder-contents.vue')
}
```

--------------------------------

### Volar Configuration for Vue 2.7

Source: https://v2.vuejs.org/v2/guide/migration-vue-2-7

Configuration snippet for 'tsconfig.json' to enable Volar's template type inference support for Vue 2.7, leveraging its improved type definitions.

```json
{
  "vueCompilerOptions": {
    "target": 2.7
  }
}
```

--------------------------------

### Delete Reactive Property with vm.$delete

Source: https://v2.vuejs.org/v2/api

Remove a property from an object reactively using `vm.$delete`. This method is an alias for the global `Vue.delete` and ensures that Vue's reactivity system correctly removes the property.

```javascript
vm.$delete( target, propertyNameOrIndex )
```

--------------------------------

### Vue.js Component Naming: Kebab-Case

Source: https://v2.vuejs.org/v2/guide/components-registration

Shows how to define a component name using kebab-case. When using kebab-case for a component name, it must also be used when referencing the custom element in templates (e.g., `<my-component-name>`).

```javascript
Vue.component('my-component-name', { /* ... */ })
```

--------------------------------

### Vue.js: Render List Items from Array using v-for

Source: https://v2.vuejs.org/v2/guide/list

Demonstrates rendering an unordered list from an array of objects using the v-for directive in Vue.js. It iterates over the 'items' array and displays the 'message' property of each item. Requires a Vue instance and an HTML element with the ID 'example-1'.

```html
<ul id="example-1">
  <li v-for="item in items" :key="item.message">
    {{ item.message }}
  </li>
</ul>
```

```javascript
var example1 = new Vue({
  el: '#example-1',
  data: {
    items: [
      { message: 'Foo' },
      { message: 'Bar' }
    ]
  }
})
```

--------------------------------

### Compile Vue Template String to Render Function

Source: https://v2.vuejs.org/v2/api

Compiles a template string into a render function and static render functions. This feature is only available in the full build of Vue.js. The compiled functions can be used in a Vue instance's render option.

```javascript
var res = Vue.compile('<div><span>{{ msg }}</span></div>')

new Vue({
  data: {
    msg: 'hello'
  },
  render: res.render,
  staticRenderFns: res.staticRenderFns
})
```

--------------------------------

### Run Docker Container for Vue.js App (NGINX)

Source: https://v2.vuejs.org/v2/cookbook/dockerize-vuejs-app

Command to run a Docker container using the NGINX-based Vue.js image. It maps host port 8080 to container port 80 (where NGINX serves the app), names the container, and ensures it's removed upon stopping. This is used when the Dockerfile is configured to use NGINX.

```bash
docker run -it -p 8080:80 --rm --name dockerize-vuejs-app-1 vuejs-cookbook/dockerize-vuejs-app

```

--------------------------------

### Object.freeze() and Reactivity (JavaScript)

Source: https://v2.vuejs.org/v2/guide/instance

Demonstrates the effect of `Object.freeze()` on Vue's reactivity. Freezing an object prevents its properties from being modified and thus from triggering view updates.

```javascript
var obj = {
  foo: 'bar'
}

Object.freeze(obj)

new Vue({
  el: '#app',
  data: obj
})
```

--------------------------------

### Vue.js Prop Validation with Custom Constructor

Source: https://v2.vuejs.org/v2/guide/components-props

Demonstrates validating a prop against a custom JavaScript constructor function (`Person`). This allows for strict type checking using `instanceof`, ensuring props are instances of specific classes.

```javascript
function Person (firstName, lastName) {
  this.firstName = firstName
  this.lastName = lastName
}

Vue.component('blog-post', {
  props: {
    author: Person
  }
})
```

--------------------------------

### Vue.js Template for Conditional Rendering of API Data (HTML)

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This HTML template is designed for a Vue.js application that fetches data using Axios. It uses conditional rendering (`v-if`, `v-else-if`, `v-else`) to display different content based on the application's state: an error message if `errored` is true, a loading indicator if `loading` is true, or the fetched data when available. It also includes a filter `currencydecimal` for formatting.

```html
<div id="app"> \
  <h1>Bitcoin Price Index</h1> \
  \
  <section v-if="errored"> \
    <p>We're sorry, we're not able to retrieve this information at the moment, please try back later</p> \
  </section> \
  \
  <section v-else> \
    <div v-if="loading">Loading...</div> \
 \
    <div \
      v-else \
      v-for="currency in info" \
      class="currency" \
    > \
      {{ currency.description }}: \
      <span class="lighten"> \
        <span v-html="currency.symbol"></span>{{ currency.rate_float | currencydecimal }}
      </span> \
    </div> \
 \
  </section> \
</div> \

```

--------------------------------

### v-slot: Named and Prop-Receiving Slots in Vue.js

Source: https://v2.vuejs.org/v2/api

Denotes named slots or slots that accept props, using the `#` shorthand. The argument specifies the slot name (defaults to 'default'), and an expression can be used to receive props, supporting destructuring. Limited to `<template>` tags and components for lone default slots.

```html
<!-- Named slots -->
<base-layout>
  <template v-slot:header>
    Header content
  </template>

  Default slot content

  <template v-slot:footer>
    Footer content
  </template>
</base-layout>

<!-- Named slot that receives props -->
<infinite-scroll>
  <template v-slot:item="slotProps">
    <div class="item">
      {{ slotProps.item.text }}
    </div>
  </template>
</infinite-scroll>

<!-- Default slot that receive props, with destructuring -->
<mouse-position v-slot="{ x, y }">
  Mouse position: {{ x }}, {{ y }}
</mouse-position>
```

--------------------------------

### Make an Object Reactive in Vue.js

Source: https://v2.vuejs.org/v2/api

Makes a JavaScript object reactive, enabling it to trigger updates when mutated. Internally used for the `data` option, it can also serve as a simple cross-component state store. Recommended to use the returned object for consistency across Vue versions.

```javascript
const state = Vue.observable({ count: 0 })

const Demo = {
  render(h) {
    return h('button', {
      on: { click: () => { state.count++ }}
    }, `count is: ${state.count}`)
  }
}
```

--------------------------------

### v-for Directive

Source: https://v2.vuejs.org/v2/api

The `v-for` directive renders an element or template block multiple times based on the source data (Array, Object, number, string, or Iterable). It supports aliasing elements and indices, and requires a `key` for efficient reordering.

```APIDOC
## v-for

### Description
Render the element or template block multiple times based on the source data. The directive’s value must use the special syntax `alias in expression` to provide an alias for the current element being iterated on. When used together with v-if, v-for has a higher priority than v-if.

### Expects
`Array | Object | number | string | Iterable (since 2.6)`

### Usage
```html
<div v-for="item in items">
  {{ item.text }}
</div>

<div v-for="(item, index) in items"></div>
<div v-for="(val, key) in object"></div>
<div v-for="(val, name, index) in object"></div>
```

### Key Special Attribute
To force elements to be reordered, provide an ordering hint with the `key` special attribute:

```html
<div v-for="item in items" :key="item.id">
  {{ item.text }}
</div>
```

### Iterable Support (2.6+)
In 2.6+, `v-for` can also work on values that implement the Iterable Protocol (e.g., `Map`, `Set`). Note that Vue 2.x does not currently support reactivity on `Map` and `Set` values.

### See also
List Rendering
key
```

--------------------------------

### Vue.js Filter Usage in Interpolations and v-bind

Source: https://v2.vuejs.org/v2/guide/filters

Demonstrates how to apply filters using the pipe symbol in Vue.js mustache interpolations and v-bind expressions. Filters are used for common text formatting.

```html
<!-- in mustaches -->
{{ message | capitalize }}

<!-- in v-bind -->
<div v-bind:id="rawId | formatId"></div>
```

--------------------------------

### Vue.js: Computed Property vs. Method for Reversing String

Source: https://v2.vuejs.org/v2/guide/computed

Compares using a computed property versus a method to achieve the same string reversal functionality in Vue.js. It illustrates the template syntax for calling a method and the corresponding method definition within the Vue component. This highlights the difference in caching behavior.

```html
<p>Reversed message: "{{ reverseMessage() }}"</p>

```

```javascript
// in component
methods: {
  reverseMessage: function () {
    return this.message.split('').reverse().join('')
  }
}

```

--------------------------------

### Define Vue Components as JavaScript Objects

Source: https://v2.vuejs.org/v2/guide/components-registration

Defines Vue components as plain JavaScript objects. These objects contain the configuration for individual components, which can then be locally registered within a Vue instance.

```javascript
var ComponentA = { /* ... */ }
var ComponentB = { /* ... */ }
var ComponentC = { /* ... */ }
```

--------------------------------

### Declaring Reactive Properties in Vue.js

Source: https://v2.vuejs.org/v2/guide/reactivity

Vue.js requires root-level reactive properties to be declared upfront in the data option, even if initialized as empty. This ensures reactivity and improves code maintainability, acting as a schema for component state.

```javascript
var vm = new Vue({
  data: {
    // declare message with an empty value
    message: ''
  },
  template: '<div>{{ message }}</div>'
})
// set `message` latervm.message = 'Hello!'
```

--------------------------------

### v-text Directive

Source: https://v2.vuejs.org/v2/api

Updates an element's textContent with data. Similar to {{ interpolations }} but for the entire content.

```APIDOC
## v-text Directive

### Description
Updates the element’s `textContent`. Use this when you need to update the entire text content of an element.

### Method
`v-text`

### Endpoint
N/A (Directive)

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Parameters
#### Path Parameters
None

#### Query Parameters
None

#### Request Body
None

### Request Example
```html
<span v-text="msg"></span>
<!-- equivalent to -->
<span>{{msg}}</span>
```

### Response
#### Success Response (200)
N/A (Directive)

#### Response Example
N/A
```

--------------------------------

### Accessing Content with vm.$slots in Vue.js

Source: https://v2.vuejs.org/v2/api

The vm.$slots property provides programmatic access to content distributed by slots. Named slots are accessible via corresponding properties (e.g., vm.$slots.foo for v-slot:foo), while the default slot's content is in vm.$slots.default. Note that slots are not reactive and accessing them is most useful in render functions. This feature is supported for v-slot:foo in v2.6+.

```javascript
Vue.component('blog-post', {
  render: function (createElement) {
    var header = this.$slots.header
    var body   = this.$slots.default
    var footer = this.$slots.footer
    return createElement('div', [
      createElement('header', header),
      createElement('main', body),
      createElement('footer', footer)
    ])
  }
})
```

--------------------------------

### Vue $nextTick: Defer callback after DOM update

Source: https://v2.vuejs.org/v2/api

The $nextTick method defers a callback to be executed after the next DOM update cycle. It's useful after data changes to ensure the DOM reflects the latest state. The 'this' context is automatically bound to the instance. It can also return a Promise if no callback is provided.

```javascript
new Vue({
  // ...
  methods: {
    // ...
    example: function () {
      // modify data
      this.message = 'changed'
      // DOM is not updated yet
      this.$nextTick(function () {
        // DOM is now updated
        // `this` is bound to the current instance
        this.doSomethingElse()
      })
    }
  }
})
```

--------------------------------

### Vue.js 'transition-group' for List Animations

Source: https://v2.vuejs.org/v2/api

The 'transition-group' component in Vue.js is used for animating multiple elements or components within a list. It requires unique keys for each child element. It renders a real DOM element (defaulting to 'span') and supports moving transitions using CSS transforms via the 'move-class' prop and the 'name' prop for auto-generated classes.

```html
<transition-group tag="ul" name="slide">
  <li v-for="item in items" :key="item.id">
    {{ item.text }}
  </li>
</transition-group>
```

--------------------------------

### Configure Vue.js Global Silent Mode

Source: https://v2.vuejs.org/v2/api

Sets Vue.config.silent to true to suppress all Vue logs and warnings. This is a global configuration that affects the entire application. No specific inputs or outputs are defined, it's a boolean flag.

```javascript
Vue.config.silent = true;
```

--------------------------------

### Vue Inject from Different Property Name

Source: https://v2.vuejs.org/v2/api

Explains how to inject a property with a different name using the 'from' key in Vue.js. This allows mapping an injected property to a local variable with a desired name.

```javascript
const Child = {
  inject: {
    foo: {
      from: 'bar',
      default: 'foo'
    }
  }
}
```

--------------------------------

### Vue CSS for List Item Transitions

Source: https://v2.vuejs.org/v2/guide/transitions

Defines CSS styles for list items and their enter/leave animations using the 'list' transition group. It includes styles for opacity and vertical translation during transitions.

```css
.list-item {
  display: inline-block;
  margin-right: 10px;
}
.list-enter-active, .list-leave-active {
  transition: all 1s;
}
.list-enter, .list-leave-to /* .list-leave-active below version 2.1.8 */ {
  opacity: 0;
  transform: translateY(30px);
}
```

--------------------------------

### Vue.js Form with Local Storage Persistence

Source: https://v2.vuejs.org/v2/cookbook/client-side-storage

This snippet shows a Vue.js application with input fields for name and age, and a button to save these values to local storage. The `mounted` hook loads previously saved data, and the `persist` method saves the current data. It utilizes the Vue.js framework and browser's local storage API.

```html
<div id="app">
  <p>
    My name is <input v-model="name">
    and I am <input v-model="age"> years old.
  </p>
  <p>
    <button @click="persist">Save</button>
  </p>
</div>

```

```javascript
const app = new Vue({
  el: '#app',
  data: {
    name: '',
    age: 0
  },
  mounted() {
    if (localStorage.name) {
      this.name = localStorage.name;
    }
    if (localStorage.age) {
      this.age = localStorage.age;
    }
  },
  methods: {
    persist() {
      localStorage.name = this.name;
      localStorage.age = this.age;
      console.log('now pretend I did more stuff...');
    }
  }
})

```

--------------------------------

### Vue $emit: Trigger events on an instance

Source: https://v2.vuejs.org/v2/api

The $emit method triggers an event on the current Vue instance. Additional arguments passed to $emit will be forwarded to the event listener's callback function. This is commonly used for child-to-parent communication.

```javascript
Vue.component('welcome-button', {
  template: '  \n    <button v-on:click="$emit(\'welcome\')">  \n      Click me to be welcomed  \n    </button>  \n  '
})

new Vue({
  el: '#emit-example-simple',
  methods: {
    sayHi: function () {
      alert('Hi!')
    }
  }
})
```

```javascript
Vue.component('magic-eight-ball', {
  data: function () {
    return {
      possibleAdvice: ['Yes', 'No', 'Maybe']
    }
  },
  methods: {
    giveAdvice: function () {
      var randomAdviceIndex = Math.floor(Math.random() * this.possibleAdvice.length)
      this.$emit('give-advice', this.possibleAdvice[randomAdviceIndex])
    }
  },
  template: '  \n    <button v-on:click="giveAdvice">  \n      Click me for advice  \n    </button>  \n  '
})

new Vue({
  el: '#emit-example-argument',
  methods: {
    showAdvice: function (advice) {
      alert(advice)
    }
  }
})
```

--------------------------------

### JavaScript Expressions in Vue.js Template Bindings

Source: https://v2.vuejs.org/v2/guide/syntax

Explains the use of JavaScript expressions within Vue.js template bindings for computed values, conditional rendering, string manipulation, and dynamic attribute construction. It notes the restriction to single expressions per binding and the sandboxed environment.

```html
{{ number + 1 }}
{{ ok ? 'YES' : 'NO' }}
{{ message.split('').reverse().join('') }}
<div v-bind:id="'list-' + id"></div>
```

--------------------------------

### Vue.js: Render Object Properties using v-for

Source: https://v2.vuejs.org/v2/guide/list

Demonstrates how to iterate over the properties of a JavaScript object using the v-for directive in Vue.js. It displays each property's value. Requires a Vue instance and an HTML element with the ID 'v-for-object'.

```html
<ul id="v-for-object" class="demo">
  <li v-for="value in object">
    {{ value }}
  </li>
</ul>
```

```javascript
new Vue({
  el: '#v-for-object',
  data: {
    object: {
      title: 'How to do lists in Vue',
      author: 'Jane Doe',
      publishedAt: '2016-04-10'
    }
  }
})
```

--------------------------------

### Vue.js: Render List Items with Default Slot Content

Source: https://v2.vuejs.org/v2/guide/components-slots

This snippet demonstrates a basic Vue.js component (`todo-list`) that renders a list of items. It uses a default slot to render the text of each todo item, allowing for fallback content within the component itself.

```html
<ul>
  <li
    v-for="todo in filteredTodos"
    v-bind:key="todo.id"
  >
    {{ todo.text }}
  </li>
</ul>
```

--------------------------------

### Vue.js Component Data as a Function

Source: https://v2.vuejs.org/v2/guide/components

This snippet illustrates the correct way to define the 'data' option for a Vue component. It must be a function that returns an object, ensuring that each component instance has its own independent copy of the data. This prevents unintended data sharing between instances.

```javascript
data: function () {
  return {
    count: 0
  }
}
```

--------------------------------

### Local Vue Component Registration in Module System (Import)

Source: https://v2.vuejs.org/v2/guide/components-registration

Registers components locally within a module system environment, typical for projects using Webpack or Babel. Components are imported from their respective files and then listed in the `components` option of the parent component.

```javascript
import ComponentA from './ComponentA'
import ComponentC from './ComponentC'

export default {
  components: {
    ComponentA,
    ComponentC
  },
  // ...
}
```

--------------------------------

### Vue.js: Render Object Properties with Index using v-for

Source: https://v2.vuejs.org/v2/guide/list

Demonstrates iterating over an object's properties using v-for in Vue.js, providing access to the value, key, and the index of the property. Note that object key enumeration order is not guaranteed across JavaScript engines.

```html
<div v-for="(value, name, index) in object">
  {{ index }}. {{ name }}: {{ value }}
</div>
```

--------------------------------

### vm.$attrs

Source: https://v2.vuejs.org/v2/api

Contains attribute bindings from the parent scope (excluding 'class' and 'style') that are not declared as props. Useful for passing down attributes to child components, especially in higher-order components using `v-bind="$attrs"`.

```APIDOC
## vm.$attrs

### Description
Contains parent-scope attribute bindings (except for `class` and `style`) that are not recognized (and extracted) as props. When a component doesn’t have any declared props, this essentially contains all parent-scope bindings (except for `class` and `style`), and can be passed down to an inner component via `v-bind="$attrs"` - useful when creating higher-order components.

### Type
`{ [key: string]: string }`

### Read only
Yes

### New in
2.4.0+
```

--------------------------------

### Vue.filter()

Source: https://v2.vuejs.org/v2/api

Registers or retrieves a global filter.

```APIDOC
## Vue.filter( id, [definition] )

### Description

Register or retrieve a global filter.

### Method

`Vue.filter

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

*   **id** (string) - The ID of the filter
*   **definition** (Function) - Optional filter definition function

### Request Example

```javascript
// register  
Vue.filter('my-filter', function (value) {
  // return processed value
})

// getter, return the filter if registered  
var myFilter = Vue.filter('my-filter')
```

### Response

None

#### Success Response (200)

None

#### Response Example

None

### See also

Filters
```

--------------------------------

### Vue.js Local Storage Form Input (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/client-side-storage

This JavaScript code initializes a Vue instance to manage the form input. It loads the 'name' value from localStorage when the component mounts and watches for changes to the 'name' data property, updating localStorage whenever the input is modified. This enables persistence of the user's input.

```javascript
const app = new Vue({
  el: '#app',
  data: {
    name: ''
  },
  mounted() {
    if (localStorage.name) {
      this.name = localStorage.name;
    }
  },
  watch: {
    name(newName) {
      localStorage.name = newName;
    }
  }
});

```

--------------------------------

### Event Handling with v-on

Source: https://v2.vuejs.org/v2/guide/syntax

The v-on directive, also known as its shorthand '@', is used to listen for DOM events. The argument specifies the event name, and the value is the JavaScript expression to execute when the event is triggered. Modifiers like '.prevent' can alter the event handling behavior.

```html
<a v-on:click="doSomething"> ... </a>
```

```html
<form v-on:submit.prevent="onSubmit"> ... </form>
```

--------------------------------

### Vue Dynamic Select Options

Source: https://v2.vuejs.org/v2/guide/forms

Illustrates binding a select dropdown to dynamically generated options using v-for. Each option's value and text are controlled by properties in the 'options' array.

```html
<select v-model="selected">
  <option v-for="option in options" v-bind:value="option.value">
    {{ option.text }}
  </option>
</select>
<span>Selected: {{ selected }}</span>
```

```javascript
new Vue({
  el: '...',
  data: {
    selected: 'A',
    options: [
      { text: 'One', value: 'A' },
      { text: 'Two', value: 'B' },
      { text: 'Three', value: 'C' }
    ]
  }
})
```

--------------------------------

### Vue.js: Base Layout Structure with Slots

Source: https://v2.vuejs.org/v2/guide/components-slots

Defines a basic HTML structure for a reusable layout component using Vue.js slots. It includes placeholders for header, main content, and footer, with a default slot for the main content.

```html
<div class="container">
  <header>
    <slot name="header"></slot>
  </header>
  <main>
    <slot></slot>
  </main>
  <footer>
    <slot name="footer"></slot>
  </footer>
</div>
```

--------------------------------

### Vue Component Name Option

Source: https://v2.vuejs.org/v2/api

Explains the 'name' option in Vue.js components. Setting a name allows a component to recursively invoke itself and improves debugging and the Vue Devtools component tree readability.

```javascript
name: 'MyComponent'
```

--------------------------------

### Bind Inline Styles to Vue Element using Object Syntax

Source: https://v2.vuejs.org/v2/guide/class-and-style

Shows how to bind inline styles to a Vue element using JavaScript object syntax for CSS properties. Supports camelCase and kebab-case property names.

```html
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>

```

```javascript
data: {
  activeColor: 'red',
  fontSize: 30
}

```

--------------------------------

### Vue Inject as Data Entry (2.2.1+)

Source: https://v2.vuejs.org/v2/api

Shows how to use an injected value as a data entry in Vue.js (v2.2.1+). The 'data' function can access 'this' to retrieve injected values and initialize component state.

```javascript
const Child = {
  inject: ['foo'],
  data () {
    return {
      bar: this.foo
    }
  }
}
```

--------------------------------

### Vue.js Custom Directive: Demo Hook Arguments

Source: https://v2.vuejs.org/v2/guide/custom-directive

This snippet shows a Vue.js custom directive 'demo' that utilizes various binding properties (name, value, expression, argument, modifiers) and vnode properties within its 'bind' hook to display information about the directive's usage. It's useful for debugging or understanding directive configurations.

```javascript
Vue.directive('demo', {
  bind: function (el, binding, vnode) {
    var s = JSON.stringify
    el.innerHTML =
      'name: '       + s(binding.name) + '<br>' +
      'value: '      + s(binding.value) + '<br>' +
      'expression: ' + s(binding.expression) + '<br>' +
      'argument: '   + s(binding.arg) + '<br>' +
      'modifiers: '  + s(binding.modifiers) + '<br>' +
      'vnode keys: ' + Object.keys(vnode).join(', ')
  }
})

new Vue({
  el: '#hook-arguments-example',
  data: {
    message: 'hello!'
  }
})
```

--------------------------------

### Vue.delete()

Source: https://v2.vuejs.org/v2/api

Deletes a property on an object, ensuring the deletion triggers view updates if the object is reactive.

```APIDOC
## Vue.delete( target, propertyName/index )

### Description

Delete a property on an object. If the object is reactive, ensure the deletion triggers view updates. This is primarily used to get around the limitation that Vue cannot detect property deletions, but you should rarely need to use it. The target object cannot be a Vue instance, or the root data object of a Vue instance.

### Method

`Vue.delete

### Parameters

#### Path Parameters

None

#### Query Parameters

None

#### Request Body

*   **target** (Object | Array) - The target object or array
*   **propertyName/index** (string | number) - The name or index of the property to delete

### Request Example

None

### Response

None

#### Success Response (200)

None

#### Response Example

None

### See also

Reactivity in Depth
```

--------------------------------

### Vue Data Option: Object and Function Declaration

Source: https://v2.vuejs.org/v2/api

Defines the data property for a Vue instance. It can be a plain object or a function returning an object. For components, a function is required to ensure data is unique per instance. Reactive properties are automatically proxied.

```javascript
var data = { a: 1 }
  
// direct instance creation  
var vm = new Vue({
  data: data  
})
vm.a // => 1  
vm.$data === data // => true  

// must use function when in Vue.extend()  
var Component = Vue.extend({
  data: function () {
    return { a: 1 }
  }
})

// Arrow function with instance access
data: vm => ({ a: vm.myProp })
```

--------------------------------

### v-html Directive

Source: https://v2.vuejs.org/v2/api

The `v-html` directive updates an element's `innerHTML`. It inserts content as plain HTML and is not suitable for compiling Vue templates. Use with caution due to XSS risks and only on trusted content.

```APIDOC
## v-html

### Description
Updates the element’s `innerHTML`. Note that the contents are inserted as plain HTML - they will not be compiled as Vue templates. Only use `v-html` on trusted content and **never** on user-provided content due to XSS risks.

### Expects
`string`

### Example
```html
<div v-html="html"></div>
```

### See also
Data Binding Syntax - Interpolations
```

--------------------------------

### Vue.js: Abbreviated Syntax for Lone Default Slots

Source: https://v2.vuejs.org/v2/guide/components-slots

When only the default slot is provided content, the component's tags can be used as the slot's template. This allows using `v-slot` directly on the component, and `v-slot` without an argument is assumed to refer to the default slot.

```html
<current-user v-slot:default="slotProps">
  {{ slotProps.user.firstName }}
</current-user>

```

```html
<current-user v-slot="slotProps">
  {{ slotProps.user.firstName }}
</current-user>

```

--------------------------------

### Vue.js Slot Usage

Source: https://v2.vuejs.org/v2/api

The `<slot>` component serves as a placeholder for content distribution within a component's template. It is replaced by the content provided by the parent component. The `name` prop can be used for named slots.

```html
<slot></slot>

<!-- Named slot -->
<slot name="header"></slot>
```

--------------------------------

### Vue.js 'transition' Component for Single Element Animations

Source: https://v2.vuejs.org/v2/api

The 'transition' component in Vue.js applies enter and leave animations to a single wrapped element or component. It supports CSS class transitions and JavaScript hooks. Props like 'name', 'mode', 'appear', and 'duration' customize the animation behavior. It does not render an extra DOM element.

```html
<!-- simple element -->
<transition>
  <div v-if="ok">toggled content</div>
</transition>

<!-- dynamic component -->
<transition name="fade" mode="out-in" appear>
  <component :is="view"></component>
</transition>

<!-- event hooking -->
<div id="transition-demo">
  <transition @after-enter="transitionComplete">
    <div v-show="ok">toggled content</div>
  </transition>
</div>
```

```javascript
new Vue({
  ...
  methods: {
    transitionComplete: function (el) {
      // for passed 'el' that DOM element as the argument, something ...
    }
  }
  ...
}).$mount('#transition-demo')
```

--------------------------------

### Vue.js Key Code Modifiers for Keyboard Events

Source: https://v2.vuejs.org/v2/guide/events

Illustrates using key code modifiers for keyboard events in Vue.js, including direct key code usage and built-in aliases for common keys. Supports legacy browser compatibility.

```html
<input v-on:keyup.13="submit'>
```

--------------------------------

### CSS Styling for Page Layout and Elements

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This CSS code defines the visual styling for the project's web pages, including background, typography, layout components like headers and footers, and responsive design considerations using media queries and CSS Grid.

```css
body {
  background: #313248;
  min-height: 2000px;
  color: rgba(255, 255, 255, 0.8);
  line-height: 1.6;
  font-family: "Josefin Sans", sans-serif;
}

h1 {
  text-align: center;
  font-size: 50px;
  margin: 0 0 1px 0;
}

.mediumstart {
  width: 50vw;
  margin: 0 auto;
  display: table;
}

h2 {
  font-size: 40px;
  background: rgba(0, 0, 0, 0.5);
  padding: 0 10px 0;
}

h1,
h2,
.footer {
  color: white;
  font-weight: normal;
  font-family: "Share Tech Mono", sans-serif;
}

.img {
  position: relative;
  height: 300px;
}

svg {
  overflow: hidden;
  width: 800px;
  margin-top: -55px;
}

svg.one {
  margin-left: -12px;
}
svg.two {
  margin-left: -283px;
}
svg.three {
  margin-top: 0;
  margin-left: -479px;
}

.paths {
  opacity: 0;
}

.cls-1,
.cls-10,
.cls-11,
.cls-12,
.cls-13,
.cls-14,
.cls-15,
.cls-4,
.cls-5,
.cls-6,
.cls-7,
.cls-8,
.cls-9 {
  fill: none;
}

.cls-2 {
  fill: url(#radial-gradient);
}

.cls-4 {
  stroke: #011eff;
  stroke-width: 0.25px;
}

.cls-10,
.cls-11,
.cls-12,
.cls-13,
.cls-14,
.cls-15,
.cls-4,
.cls-5,
.cls-6,
.cls-7,
.cls-8,
.cls-9 {
  stroke-miterlimit: 10;
}

.cls-5 {
  stroke: #181bf5;
  stroke-width: 0.27px;
}

.cls-6 {
  stroke: #2f19ea;
  stroke-width: 0.3px;
}

.cls-7 {
  stroke: #4616e0;
  stroke-width: 0.32px;
}

.cls-8 {
  stroke: #5d13d6;
  stroke-width: 0.34px;
}

.cls-9 {
  stroke: #7410cb;
  stroke-width: 0.36px;
}

.cls-10 {
  stroke: #8c0ec1;
  stroke-width: 0.39px;
}

.cls-11 {
  stroke: #a30bb6;
  stroke-width: 0.41px;
}

.cls-12 {
  stroke: #ba08ac;
  stroke-width: 0.43px;
}

.cls-13 {
  stroke: #d105a2;
  stroke-width: 0.45px;
}

.cls-14 {
  stroke: #e80397;
  stroke-width: 0.48px;
}

.cls-15 {
  stroke: #ff008d;
  stroke-width: 0.5px;
}

main {
  padding: 10vw;
}

/*
//this is from Rachel Andrew Grid by Example Media Object Pattenr
//https://codepen.io/rachelandrew/pen/zwMZVy
*/

*,
*:before,
*:after {
  box-sizing: border-box;
}

img {
  max-width: 100%;
}

.media {
  margin-bottom: 2em;
  padding: 40px 10px;
}

.media > .title {
  grid-area: title;
}
.media > .img {
  grid-area: img;
}
.media > .content {
  grid-area: bd;
}
.media > .footer {
  grid-area: ft;
}

.media {
  display: grid;
  grid-column-gap: 40px;
  grid-template-areas:
    "title"
    "img"
    "bd"
    "ft";
}

@media (min-width: 600px) {
  /* clearfix*/
  .media:after {
    content: "";
    display: block;
    clear: both;
  }

  .media > .media {
    margin-left: 260px;
    clear: both;
  }

  .media .img {
    float: left;
    margin: 0 10px 0 0;
    width: 250px;
  }

  .media .footer {
    padding: 10px;
    background: #505280;
  }

  .media.media-flip .img {
    float: right;
    margin: 0 0 0 10px;
  }

  .media > * {
    margin: 0 0 0 160px;
  }

  .media.media-flip > * {
    margin: 0 160px 0 0;
  }

  @supports (display: grid) {
    /* override */
    .media > *,
    .media.media-flip > * {
      margin: 0;
    }
    .media .img,
    .media.media-flip .img {
      width: auto;
      margin: 0;
    }
    .media:after {
      content: none;
    }

    .media {
      display: grid;
      grid-column-gap: 40px;
      grid-template-columns: 250px 3fr;
      grid-template-rows: auto 1fr auto;
      grid-template-areas:
        "img title"
        "img bd"
        "ft ft";
    }

    .media.media-flip {
      grid-template-columns: 3fr 250px;
      grid-template-areas:
        "title img"
        "bd img"
        "ft ft";
    }

    .media.img-flexie {

```

--------------------------------

### Vue.js keep-alive with max Prop

Source: https://v2.vuejs.org/v2/api

The `max` prop for `<keep-alive>` sets a limit on the number of component instances that can be cached. Once the limit is reached, the least recently accessed cached component instance is destroyed before a new one is created.

```html
<keep-alive :max="10">
  <component :is="view"></component>
</keep-alive>
```

--------------------------------

### v-once Directive for Single-Element Rendering

Source: https://v2.vuejs.org/v2/api

The v-once directive renders an element and its children only once. On subsequent re-renders, they are treated as static content, which can optimize performance. It does not expect an expression and is useful for elements whose content will never change.

```html
<!-- single element -->
<span v-once>This will never change: {{msg}}</span>

<!-- the element have children -->
<div v-once>
  <h1>comment</h1>
  <p>{{msg}}</p>
</div>

<!-- component -->
<my-component v-once :comment="msg"></my-component>

<!-- `v-for` directive -->
<ul>
  <li v-for="i in list" v-once>{{i}}</li>
</ul>
```

--------------------------------

### Vue.js: Using 'of' delimiter in v-for

Source: https://v2.vuejs.org/v2/guide/list

Illustrates an alternative syntax for v-for in Vue.js, using the 'of' delimiter instead of 'in' for iterating over an array. This syntax is closer to JavaScript's iterator protocol.

```html
<div v-for="item of items"></div>
```

--------------------------------

### Vue Component-Scoped CSS with Single-File Components

Source: https://v2.vuejs.org/v2/guide/comparison

Demonstrates how to define component-specific styles within a Vue Single-File Component using the `<style scoped>` tag. The `scoped` attribute ensures styles only apply to the current component, preventing global style conflicts. It can be used with preprocessors and integrates with CSS Modules.

```html
<style scoped>
  @media (min-width: 250px) {
    .list-container:hover {
      background: orange;
    }
  }
</style>

```

--------------------------------

### Vue.js Dynamic Transition Name Binding

Source: https://v2.vuejs.org/v2/guide/transitions

This snippet demonstrates how to dynamically bind the 'name' attribute of a Vue.js transition component to a data property. This allows for switching between different CSS transitions or animations based on component state.

```html
<transition v-bind:name="transitionName">
  <!-- ... -->
</transition>
```

--------------------------------

### Deep Watching with vm.$watch deep option

Source: https://v2.vuejs.org/v2/api

Enable deep observation of nested properties within objects by passing `{ deep: true }` as an option to `vm.$watch`. This ensures the callback is triggered even when nested values change. Array mutations do not require this option.

```javascript
vm.$watch('someObject', callback, {
  deep: true
})
vm.someObject.nestedValue = 123
// callback is fired
```

--------------------------------

### Parent Handling Emitted Event Value with $event

Source: https://v2.vuejs.org/v2/guide/components

Demonstrates how the parent component accesses the value emitted with the 'enlarge-text' event using the special $event variable. This value is then used to update 'postFontSize'.

```html
<blog-post
  ...
  v-on:enlarge-text="postFontSize += $event"
></blog-post>
```

--------------------------------

### Vue.js: Forcing Component Update with $forceUpdate

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

This snippet illustrates how to manually force a Vue.js component to update using the `$forceUpdate` method. It's important to note that this should be a last resort, as it often indicates an underlying issue with reactivity or data management that should be addressed directly.

```javascript
this.$forceUpdate()
```

--------------------------------

### Preventing Conflicts with Instance Properties in Vue

Source: https://v2.vuejs.org/v2/cookbook/adding-instance-properties

Illustrates the potential for naming conflicts when defining instance properties on Vue.prototype without a convention like '$'. This snippet shows how a data property with the same name ('appName') can overwrite the prototype property, leading to unexpected behavior. It emphasizes the importance of scoping instance properties.

```javascript
Vue.prototype.appName = 'My App'
```

```javascript
new Vue({
  data: {
    appName: 'The name of some other app'
  },
  beforeCreate: function() {
    console.log(this.appName)
  },
  created: function() {
    console.log(this.appName)
  }
})
```

--------------------------------

### Vue.js Computed Properties with Getters and Setters

Source: https://v2.vuejs.org/v2/api

Shows the definition of computed properties in Vue.js, including a read-only 'aDouble' and a 'aPlus' property with both a getter and a setter. Dependencies on reactive data trigger re-computation.

```javascript
var vm = new Vue({
  data: { a: 1 },
  computed: {
    // get only
    aDouble: function () {
      return this.a * 2
    },
    // both get and set
    aPlus: {
      get: function () {
        return this.a + 1
      },
      set: function (v) {
        this.a = v - 1
      }
    }
  }
})
vm.aPlus   // => 2
vm.aPlus = 3
vm.a       // => 2
vm.aDouble // => 4
```

--------------------------------

### Vue.js Component with Axios Error Handling and Loading State (JavaScript)

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This Vue.js component utilizes Axios to fetch data and implements robust error handling. It manages a loading state and an error flag. The `.catch()` block sets the `errored` flag to true, and `.finally()` ensures the `loading` flag is set to false regardless of success or failure. This provides a better user experience by indicating data fetching status.

```javascript
new Vue({
  el: '#app',
  data () {
    return {
      info: null,
      loading: true,
      errored: false
    }
  },
  filters: {
    currencydecimal (value) {
      return value.toFixed(2)
    }
  },
  mounted () {
    axios
      .get('https://api.coindesk.com/v1/bpi/currentprice.json')
      .then(response => {
        this.info = response.data.bpi
      })
      .catch(error => {
        console.log(error)
        this.errored = true
      })
      .finally(() => this.loading = false)
  }
})

```

--------------------------------

### Refine API Data Fetching in Vue.js with Axios

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

This snippet refines the API data fetching process by accessing a specific part of the response data. Instead of storing the entire response, it extracts the 'bpi' object from `response.data.bpi` using the .then() callback. This provides more structured data for display.

```javascript
axios
  .get('https://api.coindesk.com/v1/bpi/currentprice.json')
  .then(response => (this.info = response.data.bpi))
```

--------------------------------

### Vue.js Component with v-once Directive

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

This snippet demonstrates how to apply the `v-once` directive to the root element of a Vue.js component. This directive instructs Vue to render the component's content only once and then cache it, which is beneficial for components containing a large volume of static HTML. The `template` property defines the component's structure, including the `v-once` directive on the root `div`.

```javascript
Vue.component('terms-of-service', {
  template: `
    <div v-once>
      <h1>Terms of Service</h1>
      ... a lot of static content ...
    </div>
  `
})
```

--------------------------------

### Vue.js Component Logic for Choices.js with Memory Leak

Source: https://v2.vuejs.org/v2/cookbook/avoiding-memory-leaks

This JavaScript snippet demonstrates a Vue.js component's logic, including initializing Choices.js. The `v-if` directive toggles the component's visibility, and the issue arises because the Choices.js instance is not properly destroyed, leading to a memory leak when the component is repeatedly shown and hidden.

```javascript
new Vue({
  el: "#app",
  data: function () {
    return {
      showChoices: true
    }
  },
  mounted: function () {
    this.initializeChoices()
  },
  methods: {
    initializeChoices: function () {
      let list = []
      // lets load up our select with many choices
      // so it will use a lot of memory
      for (let i = 0; i < 1000; i++) {
        list.push({
          label: "Item " + i,
          value: i
        })
      }
      new Choices("#choices-single-default", {
        searchEnabled: true,
        removeItemButton: true,
        choices: list
      })
    },
    show: function () {
      this.showChoices = true
      this.$nextTick(() => {
        this.initializeChoices()
      })
    },
    hide: function () {
      this.showChoices = false
    }
  }
})
```

--------------------------------

### Vue.js Basic Component Type Inference

Source: https://v2.vuejs.org/v2/guide/typescript

This JavaScript code demonstrates the correct way to define Vue components using `Vue.extend` to enable TypeScript's type inference for component options. Defining components with a plain object literal will not benefit from type checking.

```javascript
import Vue from 'vue'

const Component = Vue.extend({
  // type inference enabled
})

const Component = {
  // this will NOT have type inference,
  // because TypeScript can't tell this is options for a Vue component.
}
```

--------------------------------

### Using the Base SVG Icon Component in Vue.js

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

Demonstrates how to use the custom `icon-base` component in Vue.js to render specific icons like 'write'. It shows how to pass the icon name as a prop and how individual icon paths are contained within a separate component (e.g., `IconWrite.vue`).

```vue
<icon-base icon-name="write"><icon-write /></icon-base>
```

--------------------------------

### Stop Watching with vm.$watch unwatch function

Source: https://v2.vuejs.org/v2/api

The `vm.$watch` method returns a function that can be called to stop the watcher and prevent the callback from being invoked further.

```javascript
var unwatch = vm.$watch('a', cb)
// later, teardown the watcher
unwatch()
```

--------------------------------

### Vue.js Computed Property with Arrow Function

Source: https://v2.vuejs.org/v2/api

Demonstrates defining a computed property using an arrow function, where 'this' is not the component instance but can be accessed as the first argument 'vm'.

```javascript
computed: {
  aDouble: vm => vm.a * 2
}
```

--------------------------------

### Vue.js: Integrating Shared and Private State

Source: https://v2.vuejs.org/v2/guide/state-management

Shows how to manage both private instance state and shared store state within Vue components. Components can access shared state via `store.state` while maintaining their own private data.

```javascript
var vmA = new Vue({
  data: {
    privateState: {},
    sharedState: store.state
  }
})
  
var vmB = new Vue({
  data: {
    privateState: {},
    sharedState: store.state
  }
})
```

--------------------------------

### Provide Multiple Prefixed Values for Vue Inline Styles

Source: https://v2.vuejs.org/v2/guide/class-and-style

Introduces the capability (Vue 2.3.0+) to provide an array of multiple vendor-prefixed values for a single CSS property in v-bind:style. The browser selects the last supported value.

```html
<div v-bind:style="{ display: ['-webkit-box', '-ms-flexbox', 'flex'] }"></div>

```

--------------------------------

### Vue.js: Inline Event Handlers

Source: https://v2.vuejs.org/v2/guide/events

Illustrates using inline JavaScript statements within the `v-on` directive to execute simple logic directly. This allows calling methods with arguments or performing basic operations on event triggers.

```html
<div id="example-3">
  <button v-on:click="say('hi')">Say hi</button>
  <button v-on:click="say('what')">Say what</button>
</div>
```

```javascript
new Vue({
  el: '#example-3',
  methods: {
    say: function (message) {
      alert(message);
    }
  }
})
```

--------------------------------

### Vue Functional Component Declaration

Source: https://v2.vuejs.org/v2/guide/render-function

Illustrates the structure of a functional component in Vue.js. Functional components are stateless and instanceless, receiving their context as a second argument to the render function.

```javascript
Vue.component('my-component', {
  functional: true,
  // Props are optional
  props: {
    // ...
  },
  // To compensate for the lack of an instance,
  // we are now provided a 2nd context argument.
  render: function (createElement, context) {
    // ...
  }
})
```

--------------------------------

### Vue.js Currency Decimal Filter

Source: https://v2.vuejs.org/v2/cookbook/using-axios-to-consume-apis

A custom Vue filter named 'currencydecimal' that formats a given number to two decimal places. This is used to ensure consistent display of currency values.

```javascript
filters: {
  currencydecimal (value) {
    return value.toFixed(2)
  }
}
```

--------------------------------

### is Attribute for Dynamic Components and DOM Workarounds

Source: https://v2.vuejs.org/v2/api

The is attribute is used for dynamic components, allowing them to change based on a variable, and to work around limitations in in-DOM templates, such as placing custom elements within specific HTML structures. It expects a string or a component's options object.

```html
<!-- component changes when currentView changes -->
<component v-bind:is="currentView"></component>

<!-- necessary because `<my-row>` would be invalid inside -->
<!-- a `<table>` element and so would be hoisted out      -->
<table>
  <tr is="my-row"></tr>
</table>
```

--------------------------------

### Vue.nextTick: Defer Callback for DOM Update

Source: https://v2.vuejs.org/v2/api

Defers the execution of a callback function until the next DOM update cycle. It can also be used with Promises for asynchronous operations. It's crucial for waiting for DOM changes after data updates. Requires a Promise polyfill for older browsers.

```javascript
// modify data
vm.msg = 'Hello'
// DOM not updated yet
Vue.nextTick(function () {
  // DOM updated
})

// usage as a promise (2.1.0+, see note below)
Vue.nextTick()
  .then(function () {
    // DOM updated
  })
```

--------------------------------

### Vue Render Functions: Event Modifier Prefixes

Source: https://v2.vuejs.org/v2/guide/render-function

Explains the use of prefixes like `&` (passive), `!` (capture), and `~` (once) with event listeners in Vue render functions to implement event modifiers. This method provides a concise way to control event handling behavior.

```javascript
on: {
  '!click': this.doThisInCapturingMode,
  '~keyup': this.doThisOnce,
  '~!mouseover': this.doThisOnceInCapturingMode
}
```

--------------------------------

### Reuse Existing Merge Strategy (e.g., Methods) in Vue.js

Source: https://v2.vuejs.org/v2/guide/mixins

This code shows how to assign an existing merge strategy, such as the one used for 'methods', to a new custom option. This is useful for options that should behave like methods during the merging process.

```javascript
var strategies = Vue.config.optionMergeStrategies;
strategies.myOption = strategies.methods;
```

--------------------------------

### Vue.js JavaScript for Scissors Icon Animation with GSAP

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

This JavaScript code defines the methods for animating the scissors icon in a Vue.js component. It utilizes the GSAP library to handle the rotation animation, including repeat, yoyo, and svgOrigin properties. The 'startScissors' method orchestrates the animation of both scissor blades.

```javascript
import { TweenMax, Sine } from 'gsap'

export default {
  methods: {
    startScissors() {
      this.scissorAnim(this.$refs.rightscissor, 30)
      this.scissorAnim(this.$refs.leftscissor, -30)
    },
    scissorAnim(el, rot) {
      TweenMax.to(el, 0.25, {
        rotation: rot,
        repeat: 3,
        yoyo: true,
        svgOrigin: '50 45',
        ease: Sine.easeInOut
      })
    }
  }
}

```

--------------------------------

### Customize Interpolation Delimiters in Vue.js

Source: https://v2.vuejs.org/v2/api

Allows customization of the plain text interpolation delimiters for Vue templates. This option is available in the full build with in-browser compilation. It changes the default '{{' and '}}' to a user-defined string pair.

```javascript
new Vue({
  delimiters: ['${', '}']
})

// Delimiters changed to ES6 template string style
```

--------------------------------

### Configure Webpack for Sourcemaps in Vue CLI 2

Source: https://v2.vuejs.org/v2/cookbook/debugging-in-vscode

This code snippet demonstrates how to configure Webpack to generate sourcemaps for Vue CLI 2 projects. Sourcemaps are essential for debugging, as they map compressed code back to its original source, allowing breakpoints to be set in VS Code.

```javascript
devtool: 'source-map',
```

--------------------------------

### Vue.set: Add Reactive Property

Source: https://v2.vuejs.org/v2/api

Adds a new property to a reactive object, ensuring that the new property is also reactive and triggers view updates. This method is essential for adding properties to reactive objects when direct assignment might not be detected by Vue's reactivity system. The target cannot be a Vue instance or its root data object.

```javascript
Vue.set(object, propertyName, value);
```

--------------------------------

### ref Attribute for Element and Component References

Source: https://v2.vuejs.org/v2/api

The ref attribute registers a reference to a DOM element or a child component in the parent's $refs object. For DOM elements, it's the element itself; for child components, it's the component instance. When used with v-for, it results in an array of references. It expects a string.

```html
<!-- vm.$refs.p will be the DOM node -->
<p ref="p">hello</p>

<!-- vm.$refs.child will be the child component instance -->
<child-component ref="child"></child-component>
```

--------------------------------

### Vue Component with Render Function for Anchored Headings

Source: https://v2.vuejs.org/v2/guide/render-function

This Vue component uses a render function to create anchored headings dynamically based on the 'level' prop. It's more concise than the template version and demonstrates accessing slot content via '$slots.default'. Requires Vue.js.

```javascript
Vue.component('anchored-heading', {
  render: function (createElement) {
    return createElement(
      'h' + this.level,   // tag name
      this.$slots.default // array of children
    )
  },
  props: {
    level: {
      type: Number,
      required: true
    }
  }
})
```

--------------------------------

### Vue.js: Transition Modes (out-in, in-out)

Source: https://v2.vuejs.org/v2/guide/transitions

Controls the timing of transitions between elements. The `out-in` mode ensures the current element transitions out completely before the new element transitions in. Conversely, the `in-out` mode transitions the new element in first, and then the current element transitions out. This is configured using the `mode` attribute on the `<transition>` component.

```html
<transition name="fade" mode="out-in">
  <!-- ... the buttons ... -->
</transition>
```

```html
<transition name="slide-fade" mode="in-out">
  <!-- ... -->
</transition>
```

--------------------------------

### Refactor Component to Accept Single 'post' Prop in Vue.js

Source: https://v2.vuejs.org/v2/guide/components

Illustrates refactoring a Vue component to accept a single 'post' object prop instead of multiple individual props. This simplifies data passing when components manage complex data structures.

```html
<blog-post 
  v-for="post in posts"
  v-bind:key="post.id"
  v-bind:post="post"
></blog-post>
```

--------------------------------

### Parent Handling Emitted Event Value via Method

Source: https://v2.vuejs.org/v2/guide/components

Shows how the parent component can pass the emitted event value to a method. The 'onEnlargeText' method receives the enlargement amount as its first parameter.

```html
<blog-post
  ...
  v-on:enlarge-text="onEnlargeText"
></blog-post>
```

--------------------------------

### Parent Method to Handle Emitted Event Value

Source: https://v2.vuejs.org/v2/guide/components

Defines the 'onEnlargeText' method in the parent component's methods object. This method accepts the 'enlargeAmount' emitted by the child and updates the 'postFontSize'.

```javascript
methods: {
  onEnlargeText: function (enlargeAmount) {
    this.postFontSize += enlargeAmount
  }
}
```

--------------------------------

### Defining Local Filters in a Vue Component

Source: https://v2.vuejs.org/v2/guide/filters

Shows how to define filters locally within a Vue component's options. Local filters are only available within the component they are defined in.

```javascript
filters: {
  capitalize: function (value) {
    if (!value) return ''
    value = value.toString()
    return value.charAt(0).toUpperCase() + value.slice(1)
  }
}
```

--------------------------------

### Vue Functional Component Single-File Template

Source: https://v2.vuejs.org/v2/guide/render-function

Shows how to declare a functional component using a single-file component (SFC) template. This syntax simplifies the declaration by using the `functional` attribute on the `<template>` tag.

```html
<template functional>
</template>
```

--------------------------------

### Vue.js: Render List Items with Scoped Slot for Customization

Source: https://v2.vuejs.org/v2/guide/components-slots

This Vue.js snippet shows a `todo-list` component utilizing scoped slots. It iterates over todos and renders each one using a named slot 'todo', passing the 'todo' object as a prop. This allows parent components to customize the rendering of each todo item while still providing fallback content.

```html
<ul>
  <li
    v-for="todo in filteredTodos"
    v-bind:key="todo.id"
  >
    <slot name="todo" v-bind:todo="todo">
      <!-- Fallback content -->
      {{ todo.text }}
    </slot>
  </li>
</ul>
```

--------------------------------

### Vue.js: Trigger Listeners with System Modifier Keys

Source: https://v2.vuejs.org/v2/guide/events

Use system modifier keys like .ctrl, .alt, .shift, and .meta to conditionally trigger event listeners. These modifiers allow event handlers to only fire when a specific key is pressed in combination with the event. Note that on Macintosh, meta is the Command key, and on Windows, it's the Windows key.

```html
<!-- Alt + C -->
<input v-on:keyup.alt.67="clear">

<!-- Ctrl + Click -->
<div v-on:click.ctrl="doSomething">Do something</div>
```

--------------------------------

### Vue.js: Explicitly Using Default Slot with v-slot

Source: https://v2.vuejs.org/v2/guide/components-slots

Shows an alternative way to provide content to the default slot in Vue.js using the v-slot directive. This approach explicitly names the 'default' slot, offering clarity when combining named and default slot content.

```html
<base-layout>
  <template v-slot:header>
    <h1>Here might be a page title</h1>
  </template>

  <template v-slot:default>
    <p>A paragraph for the main content.</p>
    <p>And another one.</p>
  </template>

  <template v-slot:footer>
    <p>Here's some contact info</p>
  </template>
</base-layout>
```

--------------------------------

### Vue.js: Bind Class with Array Syntax

Source: https://v2.vuejs.org/v2/guide/class-and-style

Apply a list of CSS classes by binding an array to `v-bind:class`. Individual classes within the array can be conditionally applied using ternary expressions. It also supports nesting object syntax within the array for complex conditional class application.

```html
<div v-bind:class="[activeClass, errorClass]"></div>
```

```javascript
data: {
  activeClass: 'active',
  errorClass: 'text-danger'
}
```

```html
<div v-bind:class="[isActive ? activeClass : '', errorClass]"></div>
```

```html
<div v-bind:class="[{ active: isActive }, errorClass]"></div>
```

--------------------------------

### Vue.js: Manually Bind Attributes with $attrs

Source: https://v2.vuejs.org/v2/guide/components-props

Demonstrates using `$attrs` with `inheritAttrs: false` to manually bind attributes passed to a component to a specific element within its template. This provides fine-grained control over attribute propagation.

```javascript
Vue.component('base-input', {
  inheritAttrs: false,
  props: ['label', 'value'],
  template: '
    <label>
      {{ label }}
      <input
        v-bind="$attrs"
        v-bind:value="value"
        v-on:input="$emit('input', $event.target.value)"
      >
    </label>
  '
})
```

--------------------------------

### v-for Directive in Vue.js for List Rendering

Source: https://v2.vuejs.org/v2/api

Renders elements or template blocks multiple times based on iterable data (Array, Object, number, string, Iterable). Uses 'alias in expression' syntax. A 'key' attribute is recommended for efficient reordering.

```html
<div v-for="item in items">
  {{ item.text }}
</div>
```

```html
<div v-for="(item, index) in items"></div>
<div v-for="(val, key) in object"></div>
<div v-for="(val, name, index) in object"></div>
```

```html
<div v-for="item in items" :key="item.id">
  {{ item.text }}
</div>
```

--------------------------------

### Enable Vue Devtools Inspection

Source: https://v2.vuejs.org/v2/api

Enables Vue Devtools inspection by setting Vue.config.devtools to true. This option should be set synchronously immediately after loading Vue. It impacts the ability to use browser developer tools for debugging Vue applications.

```javascript
Vue.config.devtools = true;
```

--------------------------------

### Vue.js: Named Slots Shorthand

Source: https://v2.vuejs.org/v2/guide/components-slots

Vue.js 2.6.0+ introduces a shorthand for named slots using the `#` symbol, similar to `v-on` (`@`) and `v-bind` (`:`). The shorthand requires an argument (the slot name).

```html
<base-layout>
  <template #header>
    <h1>Here might be a page title</h1>
  </template>

  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <template #footer>
    <p>Here's some contact info</p>
  </template>
</base-layout>

```

```html
<current-user #default="{ user }">
  {{ user.firstName }}
</current-user>

```

--------------------------------

### Vue.js: Preventing Infinite Loops in Recursive Components

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Highlights the risk of infinite loops with recursive components and provides a solution. It emphasizes the need for conditional rendering (e.g., using `v-if`) to ensure the recursion eventually terminates, preventing 'max stack size exceeded' errors.

```javascript
name: 'stack-overflow',
template: '<div><stack-overflow v-if="condition"></stack-overflow></div>'
```

--------------------------------

### v-show Directive

Source: https://v2.vuejs.org/v2/api

The `v-show` directive toggles the element’s `display` CSS property based on the truthy-ness of its expression. This directive also triggers transitions when its condition changes.

```APIDOC
## v-show

### Description
Toggles the element’s `display` CSS property based on the truthy-ness of the expression value. This directive triggers transitions when its condition changes.

### Expects
`any`

### See also
Conditional Rendering - v-show
```

--------------------------------

### Vue.js: VNode Data Object Structure

Source: https://v2.vuejs.org/v2/guide/render-function

Explains the structure of the data object used within Vue.js's createElement function. It covers various properties for binding classes, styles, attributes, props, DOM properties, event handlers, directives, and slots.

```javascript
{
  // Same API as `v-bind:class`, accepting either
  // a string, object, or array of strings and objects.
  class: {
    foo: true,
    bar: false
  },
  // Same API as `v-bind:style`, accepting either
  // a string, object, or array of objects.
  style: {
    color: 'red',
    fontSize: '14px'
  },
  // Normal HTML attributes
  attrs: {
    id: 'foo'
  },
  // Component props
  props: {
    myProp: 'bar'
  },
  // DOM properties
  domProps: {
    innerHTML: 'baz'
  },
  // Event handlers are nested under `on`, though
  // modifiers such as in `v-on:keyup.enter` are not
  // supported. You'll have to manually check the
  // keyCode in the handler instead.
  on: {
    click: this.clickHandler
  },
  // For components only. Allows you to listen to
  // native events, rather than events emitted from
  // the component using `vm.$emit`.
  nativeOn: {
    click: this.nativeClickHandler
  },
  // Custom directives. Note that the `binding`'s
  // `oldValue` cannot be set, as Vue keeps track
  // of it for you.
  directives: [
    {
      name: 'my-custom-directive',
      value: '2',
      expression: '1 + 1',
      arg: 'foo',
      modifiers: {
        bar: true
      }
    }
  ],
  // Scoped slots in the form of
  // { name: props => VNode | Array<VNode> }
  scopedSlots: {
    default: props => createElement('span', props.text)
  },
  // The name of the slot, if this component is the
  // child of another component
  slot: 'name-of-slot',
  // Other special top-level properties
  key: 'myKey',
  ref: 'myRef',
  // If you are applying the same ref name to multiple
  // elements in the render function. This will make `$refs.myRef` become an
  // array
  refInFor: true
}
```

--------------------------------

### Vue Component Template with Single Root Element

Source: https://v2.vuejs.org/v2/guide/components

Defines a Vue component template that includes a single root 'div' element. This structure adheres to Vue's requirement for components to have only one top-level element, containing post title and content.

```html
<div class="blog-post">
  <h3>{{ title }}</h3>
  <div v-html="content"></div>
</div>
```

--------------------------------

### Vue.js Component Registration and Initialization

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

This JavaScript code registers the 'AnimatedIconScissors' Vue component using its template ID and initializes the Vue application. It includes the same animation methods as previously shown, ensuring the component functions correctly within the Vue instance.

```javascript
Vue.component('AnimatedIconScissors', {
  template: '#scissors',
  methods: {
    startScissors() {
      this.scissorAnim(this.$refs.rightscissor, 30)
      this.scissorAnim(this.$refs.leftscissor, -30)
    },
    scissorAnim(el, rot) {
      TweenMax.to(el, 0.25, {
        rotation: rot,
        repeat: 3,
        yoyo: true,
        svgOrigin: '50 45',
        ease: Sine.easeInOut
      })
    }
  }
});

new Vue({
  el: '#app'
})

```

--------------------------------

### Vue.js Media Layout Component Template

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This is a Vue.js template for a 'media-layout' component, designed to display content and images. It supports a 'flipped' prop to alter its layout and uses slots for dynamic content insertion. It includes placeholders for title, content, and footer elements.

```html
<script type="text/x-template" id="medialayout">
<div :class="[flipped ? 'media-flip' : '', media]">
  <div class="img">
    <slot></slot>
  </div>
  <h2 class="title">This is my title</h2>
  <div class="content">
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit suscipit neque ipsam aliquam nesciunt perferendis sint quis. Tenetur recusandae iste at saepe magni omnis similique nobis tempore, pariatur et quae! Lorem ipsum dolor, sit amet consectetur adipisicing elit. Perspiciatis incidunt dolores eius natus neque consequuntur similique, quasi magni error saepe magnam, sequi, repudiandae provident impedit. Et beatae id obcaecati provident.</p>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit suscipit neque ipsam aliquam nesciunt perferendis sint quis. Tenetur recusandae iste at saepe magni omnis similique nobis tempore, pariatur et quae! Lorem ipsum dolor, sit amet consectetur adipisicing elit. Perspiciatis incidunt dolores eius natus neque consequuntur similique, quasi magni error saepe magnam, sequi, repudiandae provident impedit. Et beatae id obcaecati provident.</p>
  </div>
  <div class="footer">
    Tenetur recusandae iste at saepe magni omnis similique nobis tempore, pariatur et quae! 
  </div>
</div>
</script>
```

--------------------------------

### Configure Webpack for Sourcemaps in Vue CLI 3

Source: https://v2.vuejs.org/v2/cookbook/debugging-in-vscode

This snippet shows how to configure Webpack for sourcemap generation in Vue CLI 3 projects. It involves updating the `vue.config.js` file to include the `devtool: 'source-map'` setting within the `configureWebpack` object, enabling effective debugging in VS Code.

```javascript
module.exports = {
  configureWebpack: {
    devtool: 'source-map'
  }
}
```

--------------------------------

### Vue Inject as Prop Default (2.2.1+)

Source: https://v2.vuejs.org/v2/api

Illustrates how to use an injected value as the default for a prop in Vue.js (v2.2.1+). The 'default' function for a prop can now access 'this' to retrieve injected values.

```javascript
const Child = {
  inject: ['foo'],
  props: {
    bar: {
      default () {
        return this.foo
      }
    }
  }
}
```

--------------------------------

### Configure Custom v-model Prop and Event for Vue Components

Source: https://v2.vuejs.org/v2/api

Enables a custom component to define the prop and event used with `v-model`. By default, `v-model` uses the 'value' prop and 'input' event. This configuration is useful for components like checkboxes or radio buttons to avoid prop conflicts.

```javascript
Vue.component('my-checkbox', {
  model: {
    prop: 'checked',
    event: 'change'
  },
  props: {
    // this allows using the `value` prop for a different purpose
    value: String,
    // use `checked` as the prop which take the place of `value`
    checked: {
      type: Number,
      default: 0
    }
  },
  // ...
})

// Usage:
// <my-checkbox v-model="foo" value="some value"></my-checkbox>

// Equivalent to:
// <my-checkbox
//   :checked="foo"
//   @change="val => { foo = val }"
//   value="some value">
// </my-checkbox>
```

--------------------------------

### v-for with v-if on Same Element (Vue.js)

Source: https://v2.vuejs.org/v2/guide/list

Demonstrates using v-for and v-if on the same HTML element. It's generally not recommended but can be used to conditionally render items within a loop. The v-if directive has lower priority and executes on each iteration.

```html
<li v-for="todo in todos" v-if="!todo.isComplete">
  {{ todo }}
</li>
```

--------------------------------

### Invalid JavaScript Expressions in Vue.js Templates

Source: https://v2.vuejs.org/v2/guide/syntax

Demonstrates expressions that are not allowed within Vue.js template bindings. This includes JavaScript statements like variable declarations (`var a = 1`) and complex control flow structures, emphasizing the need for single, evaluatable expressions.

```html
<!-- this is a statement, not an expression:
{{ var a = 1 }}

<!-- flow control won't work either, use ternary expressions -->
{{ if (ok) { return message } }}
```

--------------------------------

### Vue.js Template for Animatable Scissors Icon

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

This Vue.js template defines the structure for an animatable scissors icon using SVG. It includes paths for the icon's visual elements and uses refs to identify elements for animation. The SVG is set up to trigger the 'startScissors' method on click.

```html
<template>
  <svg
    @click="startScissors"
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 100 100"
    width="100"
    height="100"
    aria-labelledby="scissors"
    role="presentation"
  >
    <title
      id="scissors"
      lang="en"
    >Scissors Animated Icon</title>
    <path
      id="bk"
      fill="#fff"
      d="M0 0h100v100H0z"/>
    <g ref="leftscissor">
      <path d="M..."/>
      ...
    </g>
    <g ref="rightscissor">
      <path d="M..."/>
      ...
    </g>
  </svg>
</template>

```

--------------------------------

### Vue Component Prop Definition (camelCase)

Source: https://v2.vuejs.org/v2/guide/components-props

Defines a Vue component named 'blog-post' using camelCase for its props. This JavaScript snippet shows how to declare props as an array of strings, suitable for simple prop names.

```javascript
Vue.component('blog-post', {
  // camelCase in JavaScript
  props: ['postTitle'],
  template: '<h3>{{ postTitle }}</h3>'
})
```

--------------------------------

### Child Emitting 'enlarge-text' Event with Value

Source: https://v2.vuejs.org/v2/guide/components

Illustrates emitting a specific value along with the 'enlarge-text' event. The button click will emit the value '0.1', allowing the parent to control the increment amount.

```html
<button v-on:click="$emit('enlarge-text', 0.1)">
  Enlarge text
</button>
```

--------------------------------

### Vue 2 Reactivity `reactive()` Behavior Difference

Source: https://v2.vuejs.org/v2/guide/migration-vue-2-7

Illustrates a key difference in the `reactive()` function between Vue 2.7 and Vue 3. In Vue 2.7, `reactive()` directly mutates the original object, resulting in identity equality, whereas Vue 3 creates a proxy.

```javascript
// true in 2.7, false in 3.x  
reactive(foo) === foo;  
```

--------------------------------

### v-else and v-else-if Directives in Vue.js

Source: https://v2.vuejs.org/v2/api

v-else denotes the 'else block' for a v-if or v-if/v-else-if chain. v-else-if denotes an 'else if block' and can be chained. Both require a preceding sibling with v-if or v-else-if.

```html
<div v-if="Math.random() > 0.5">
  Now you see me
</div>
<div v-else>
  Now you don't
</div>
```

```html
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'B'">
  B
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>
```

--------------------------------

### Explicit Transition Durations in Vue.js

Source: https://v2.vuejs.org/v2/guide/transitions

Set explicit transition durations in milliseconds for the `<transition>` component. This is useful for complex transition sequences involving nested elements with varying durations. You can specify a single duration for both enter and leave, or separate values.

```html
<transition :duration="1000">
  <!-- ... -->
</transition>

<transition :duration="{ enter: 500, leave: 800 }">
  <!-- ... -->
</transition>
```

--------------------------------

### Child Emitting 'enlarge-text' Event on Click

Source: https://v2.vuejs.org/v2/guide/components

Shows how a child component emits a custom 'enlarge-text' event when its button is clicked. This signals to the parent that the text enlargement action should occur.

```html
<button v-on:click="$emit('enlarge-text')">
  Enlarge text
</button>
```

--------------------------------

### Vue.js Prop Validation with Basic and Required Types

Source: https://v2.vuejs.org/v2/guide/components-props

Defines component props with basic type checking (Number, String) and specifies a required string prop. This ensures that essential data is passed correctly to the component, preventing runtime errors.

```javascript
Vue.component('my-component', {
  props: {
    propA: Number,
    propB: [String, Number],
    propC: {
      type: String,
      required: true
    }
  }
})
```

--------------------------------

### Vue.js Key Modifiers for Keyboard Events

Source: https://v2.vuejs.org/v2/guide/events

Demonstrates using key modifiers with v-on for keyboard events in Vue.js. This allows handlers to be called only when specific keys are pressed, such as .enter or .page-down.

```html
<input v-on:keyup.enter="submit">
<input v-on:keyup.page-down="onPageDown">
```

--------------------------------

### Vue Component with Template for Anchored Headings

Source: https://v2.vuejs.org/v2/guide/render-function

This Vue component uses a template to render anchored headings based on a 'level' prop. It's verbose and duplicates slot content, highlighting a scenario where render functions are more suitable. It requires Vue.js.

```javascript
Vue.component('anchored-heading', {
  template: '#anchored-heading-template',
  props: {
    level: {
      type: Number,
      required: true
    }
  }
})
```

--------------------------------

### Annotate Vue Component Props with TypeScript

Source: https://v2.vuejs.org/v2/guide/typescript

This snippet demonstrates how to define and annotate props for a Vue.js component using TypeScript. It covers basic types like String, Object, and Function, and utilizes `PropType` for complex types and custom validators, ensuring type safety for prop data.

```typescript
import Vue, { PropType } from 'vue'
  
interface ComplexMessage {
  title: string,
  okMessage: string,
  cancelMessage: string
}
const Component = Vue.extend({
  props: {
    name: String,
    success: { type: String },
    callback: {
      type: Function as PropType<() => void>
    },
    message: {
      type: Object as PropType<ComplexMessage>,
      required: true,
      validator (message: ComplexMessage) {
        return !!message.title;
      }
    }
  }
})
```

--------------------------------

### Listen to Custom Event in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Illustrates how to listen for a custom event emitted by a child component in a Vue template. It highlights that the listener must match the emitted event name exactly, recommending kebab-case for all event names.

```html
<my-component v-on:my-event="handleMyEvent"></my-component>
```

--------------------------------

### Augment Vue Instance with Plugin Properties in TypeScript

Source: https://v2.vuejs.org/v2/guide/typescript

This snippet demonstrates how to use TypeScript's module augmentation to add custom instance properties, like `$myProperty`, to Vue.js components. It requires importing 'vue' and declaring the augmented interface within a declaration file.

```typescript
import Vue from 'vue'
  
declare module 'vue/types/vue' {
  interface Vue {
    $myProperty: string
  }
}
```

--------------------------------

### Vue $forceUpdate: Force re-render of instance

Source: https://v2.vuejs.org/v2/api

The $forceUpdate method forces the Vue instance to re-render. This affects the instance itself and child components with inserted slot content, but not all child components.

```javascript
// Usage example:
// this.$forceUpdate()
```

--------------------------------

### Conditional Rendering with v-if

Source: https://v2.vuejs.org/v2/guide/syntax

The v-if directive conditionally renders an element based on the truthiness of its expression. It removes or inserts the element in the DOM accordingly. This is a core directive for controlling element visibility.

```html
<p v-if="seen">Now you see me</p>
```

--------------------------------

### Ignore Custom Elements in Vue

Source: https://v2.vuejs.org/v2/api

Configures Vue to ignore specific custom elements using Vue.config.ignoredElements. This prevents warnings for unknown custom elements that are defined outside of Vue, such as with Web Components. Accepts an array of strings or regular expressions.

```javascript
Vue.config.ignoredElements = [
  'my-custom-web-component',
  'another-web-component',
  // Use a `RegExp` to ignore all elements that start with "ion-" 
  // 2.5+ only
  /^ion-/
]
```

--------------------------------

### Vue.js Prop Validation with Default Values

Source: https://v2.vuejs.org/v2/guide/components-props

Configures component props with default values for Number and Object types. This provides fallback values when props are not explicitly passed, ensuring the component functions correctly even with incomplete data.

```javascript
Vue.component('my-component', {
  props: {
    propD: {
      type: Number,
      default: 100
    },
    propE: {
      type: Object,
      default: function () {
        return { message: 'hello' }
      }
    }
  }
})
```

--------------------------------

### Vue.js Custom Key Modifier Aliases

Source: https://v2.vuejs.org/v2/guide/events

Explains how to define custom key modifier aliases in Vue.js using `Vue.config.keyCodes`. This allows for custom key bindings, such as enabling `v-on:keyup.f1`.

```javascript
Vue.config.keyCodes.f1 = 112
```

--------------------------------

### Vue.directive: Register Global Directive

Source: https://v2.vuejs.org/v2/api

Registers or retrieves a global directive. A directive definition can be a function or an object with lifecycle hooks like `bind`, `inserted`, `update`, `componentUpdated`, and `unbind`. A function directive is called for both `bind` and `update` phases.

```javascript
// register
Vue.directive('my-directive', {
  bind: function () {},
  inserted: function () {},
  update: function () {},
  componentUpdated: function () {},
  unbind: function () {}
})

// register (function directive)
Vue.directive('my-directive', function () {
  // this will be called as `bind` and `update`
})

// getter, return the directive definition if registered
var myDirective = Vue.directive('my-directive')
```

--------------------------------

### Vue Mixin Option Merging: Data and Lifecycle Hooks

Source: https://v2.vuejs.org/v2/guide/mixins

Illustrates how Vue.js merges options when a mixin and a component have overlapping 'data' and 'created' hooks. Data properties are merged recursively with component data taking priority, and hooks are merged into an array, with mixin hooks executing first.

```javascript
var mixin = {
  data: function () {
    return {
      message: 'hello',
      foo: 'abc'
    }
  },
  created: function () {
    console.log('mixin hook called')
  }
}

new Vue({
  mixins: [mixin],
  data: function () {
    return {
      message: 'goodbye',
      bar: 'def'
    }
  },
  created: function () {
    console.log('component hook called')
    console.log(this.$data)
  }
})

// Output:
// mixin hook called
// component hook called
// { message: "goodbye", foo: "abc", bar: "def" }
```

--------------------------------

### Passing Data to Component via Props with v-for (Vue.js)

Source: https://v2.vuejs.org/v2/guide/list

Details how to pass iterated data from v-for to a custom component using props. This ensures explicit data flow, making components more reusable. The 'key' attribute is essential.

```html
<my-component
  v-for="(item, index) in items"
  v-bind:item="item"
  v-bind:index="index"
  v-bind:key="item.id"
></my-component>
```

--------------------------------

### Nested Local Vue Component Registration

Source: https://v2.vuejs.org/v2/guide/components-registration

Illustrates how to make a locally registered component available within another component. This is achieved by defining the parent component's child components in its own `components` option.

```javascript
var ComponentA = { /* ... */ }

var ComponentB = {
  components: {
    'component-a': ComponentA
  },
  // ...
}
```

--------------------------------

### Clean up Choices API in Vue.js beforeDestroy Hook

Source: https://v2.vuejs.org/v2/cookbook/avoiding-memory-leaks

This code demonstrates how to move the cleanup logic for a Choices API instance into the `beforeDestroy()` lifecycle hook in a Vue.js application. This is particularly useful in Single Page Applications using `vue-router`, where components are frequently created and destroyed during navigation. Calling `destroy()` in `beforeDestroy()` ensures resources are released before the component is fully removed from the DOM.

```javascript
beforeDestroy: function () {
    this.choicesSelect.destroy()
}
```

--------------------------------

### Vue.js Array Reactivity Caveats and Solutions

Source: https://v2.vuejs.org/v2/guide/reactivity

Vue.js cannot detect direct item setting by index or length modification in arrays. Solutions involve using Vue.set, Array.prototype.splice, or the vm.$set instance method for item updates, and splice for length modifications.

```javascript
var vm = new Vue({
  data: {
    items: ['a', 'b', 'c']
  }
})
vm.items[1] = 'x' // is NOT reactive
vm.items.length = 2 // is NOT reactive
```

```javascript
// Vue.set
Vue.set(vm.items, indexOfItem, newValue)
```

```javascript
// Array.prototype.splice
vm.items.splice(indexOfItem, 1, newValue)
```

```javascript
vm.$set(vm.items, indexOfItem, newValue)
```

```javascript
vm.items.splice(newLength)
```

--------------------------------

### Vue.js: Use v-for on a template tag for rendering blocks

Source: https://v2.vuejs.org/v2/guide/list

Similar to v-if, v-for can be used on a <template> tag to render a block of multiple elements. This is useful when you need to repeat a group of related elements without adding an extra wrapper element to the DOM.

```html
<ul>
  <template v-for="item in items">
    <li>{{ item.msg }}</li>
    <li class="divider" role="presentation"></li>
  </template>
</ul>
```

--------------------------------

### Vue.js: Using Named Slots with v-slot Directive

Source: https://v2.vuejs.org/v2/guide/components-slots

Demonstrates how to provide content to named slots in a Vue.js component. The v-slot directive is used on template tags to target specific slots ('header', 'default', 'footer') with content.

```html
<base-layout>
  <template v-slot:header>
    <h1>Here might be a page title</h1>
  </template>

  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <template v-slot:footer>
    <p>Here's some contact info</p>
  </template>
</base-layout>
```

--------------------------------

### Accessing Child Element with Ref and Method (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

A child component can use 'ref' on internal elements to expose them to the parent. It can also define methods, callable via the parent's access to the child instance, to perform actions on these internal elements.

```html
<input ref="input">

```

```javascript
methods: {
  // Used to focus the input from the parent
  focus: function () {
    this.$refs.input.focus()
  }
}
```

```javascript
this.$refs.usernameInput.focus()
```

--------------------------------

### SVG Path Data for Visual Elements

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

These SVG path elements define the shapes and strokes for various visual components within the project. Each path uses 'd' attribute for drawing instructions and 'transform' for positioning.

```svg
<path stroke="#a30bb6" stroke-width=".409" d="M-30.11,25.59c3.46,3.1,6.65,7.23,10.59,5,3-1.68,2.93-9,6.23-11.91,2.95-2.61,9.58-1,12.75-3.32C2.88,12.86,4.1,5.77,7.78,4.94s6.74,4.74,10.72,7.11" transform="translate(32.53 -.78)"/>
      <path stroke="#ba08ac" stroke-width=".432" d="M-30.53,24.39c1.54,1.72.61,7.3,2.25,7.54s2.71-5.55,4.58-6.51c1.53-.78,6.14,2.88,7.75,1.61,1.41-1.12-.77-6.73.7-8s6.55,1.8,8,.59c1.64-1.44-.2-7.25,1.51-8.5S.85,13.46,2.71,12.5s2-7.09,4-7.58S11.39,9.79,13.57,10c2,.18,5.5-4.71,7.6-3.78" transform="translate(32.53 -.78)"/>
      <path stroke="#d105a2" stroke-width=".455" d="M-31.11,23c1.52,1.82.33,7.39,1.94,7.72,1.8.38,3-5.37,4.9-6.3,1.57-.76,6.15,2.93,7.79,1.66,1.45-1.13-.66-6.79.85-8.07s6.56,1.86,8.06.68c1.67-1.43,0-7.28,1.71-8.47s6.5,2.56,8.39,1.66,2.19-7,4.26-7.45,4.66,4.95,6.83,5.1,5.32-4.92,7.45-4.15" transform="translate(32.53 -.78)"/>
      <path stroke="#e80397" stroke-width=".477" d="M-31.71,21.51c1.5,1.91.08,7.45,1.66,7.88,1.83.49,3.26-5.19,5.2-6.08,1.6-.74,6.14,3,7.82,1.72,1.48-1.12-.53-6.83,1-8.1s6.56,1.93,8.11.8c1.71-1.41.17-7.31,1.94-8.44s6.39,2.81,8.33,2S4.77,4.38,6.86,4s4.64,5,6.82,5.15S18.8,4,21,4.64" transform="translate(32.53 -.78)"/>
      <path stroke="#ff008d" stroke-width=".5" d="M-32.33,20c1.48,2-.14,7.5,1.42,8,1.86.6,3.5-5,5.47-5.86,1.64-.71,6.12,3.08,7.83,1.81,1.52-1.12-.39-6.87,1.19-8.13s6.56,2,8.16.95c1.73-1.38.4-7.32,2.2-8.37S.2,11.44,2.17,10.71,4.84,4,7,3.6s4.61,5.14,6.8,5.22S18.66,3.54,20.82,4" transform="translate(32.53 -.78)"/>
```

--------------------------------

### Replace v-if/v-for with JavaScript in Vue Render Functions

Source: https://v2.vuejs.org/v2/guide/render-function

Shows how to replace template syntax like `v-if` and `v-for` with plain JavaScript conditional statements and array methods within Vue render functions. This approach provides more control and is useful when template features become complex.

```html
<ul v-if="items.length">
  <li v-for="item in items">{{ item.name }}</li>
</ul>
<p v-else>No items found.</p>
```

```javascript
props: ['items'],
render: function (createElement) {
  if (this.items.length) {
    return createElement('ul', this.items.map(function (item) {
      return createElement('li', item.name)
    }))
  } else {
    return createElement('p', 'No items found.')
  }
}
```

--------------------------------

### Specify Transition Type (Animation or Transition)

Source: https://v2.vuejs.org/v2/guide/transitions

When an element has both CSS animation and transition effects, explicitly declare the type Vue should monitor using the `type` attribute. Set it to 'animation' or 'transition' to ensure correct event detection.

```html
<transition type="animation">
  <!-- ... -->
</transition>

<transition type="transition">
  <!-- ... -->
</transition>
```

--------------------------------

### Vue.js: Deprecated Named Slot Usage with `slot` Attribute (Template)

Source: https://v2.vuejs.org/v2/guide/components-slots

This snippet shows the deprecated method of passing content to named slots using the `slot` attribute on a `<template>` tag. It illustrates how to target 'header' and 'footer' slots within a `<base-layout>` component.

```html
<base-layout>
  <template slot="header">
    <h1>Here might be a page title</h1>
  </template>

  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <template slot="footer">
    <p>Here's some contact info</p>
  </template>
</base-layout>
```

--------------------------------

### Define Custom Option Merge Strategy in Vue.js

Source: https://v2.vuejs.org/v2/guide/mixins

This snippet demonstrates how to define a new custom option merge strategy in Vue.js. It involves attaching a function to `Vue.config.optionMergeStrategies` which takes the `toVal` and `fromVal` as arguments and returns the `mergedVal`.

```javascript
Vue.config.optionMergeStrategies.myOption = function (toVal, fromVal) {
  // return mergedVal
}
```

--------------------------------

### Vue.js: Fallback Content for Slots

Source: https://v2.vuejs.org/v2/guide/components-slots

Demonstrates how to provide fallback content for a Vue.js slot. If no content is passed from the parent component, the content placed between the `<slot>` tags in the child component will be rendered. This is useful for default values or actions.

```html
<button type="submit">
  <slot>Submit</slot>
</button>
```

```html
<submit-button></submit-button>
```

```html
<button type="submit">
  Submit
</button>
```

```html
<submit-button>
  Save
</submit-button>
```

```html
<button type="submit">
  Save
</button>
```

--------------------------------

### Vue.js Custom Directive: Pin Element (Dynamic Argument)

Source: https://v2.vuejs.org/v2/guide/custom-directive

This snippet showcases a Vue.js custom directive 'pin' with dynamic arguments. The 'bind' hook sets the element's 'position' to 'fixed' and dynamically applies either 'top' or 'left' styling based on the directive's argument ('arg'), allowing for flexible positioning controlled by component data.

```javascript
Vue.directive('pin', {
  bind: function (el, binding, vnode) {
    el.style.position = 'fixed'
    var s = (binding.arg == 'left' ? 'left' : 'top')
    el.style[s] = binding.value + 'px'
  }
})

new Vue({
  el: '#dynamicexample',
  data: function () {
    return {
      direction: 'left'
    }
  }
})
```

--------------------------------

### v-cloak Directive for Hiding Uncompiled Bindings

Source: https://v2.vuejs.org/v2/api

The v-cloak directive is used to hide mustache bindings until the Vue instance finishes compilation. It's typically combined with CSS to prevent flickering. It does not expect an expression. CSS rules like `[v-cloak] { display: none }` are used in conjunction with elements having the `v-cloak` attribute.

```css
[v-cloak] {
  display: none;
}
```

```html
<div v-cloak>
  {{ message }}
</div>
```

--------------------------------

### Custom Error Handler for Vue

Source: https://v2.vuejs.org/v2/api

Assigns a custom function to Vue.config.errorHandler to handle uncaught errors during component rendering and watchers. The handler receives the error, Vue instance, and additional info. This is crucial for robust error management.

```javascript
Vue.config.errorHandler = function (err, vm, info) {
  // handle error
  // `info` is a Vue-specific error info, e.g. which lifecycle hook
  // the error was found in. Only available in 2.2.0+
}
```

--------------------------------

### Using Computed Properties for Transformed Props in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-props

Shows how to use a computed property to transform a prop's value within a child component. This is the recommended approach when a prop needs to be processed or formatted before being used in the template or other component logic.

```javascript
props: ['size'],
computed: {
  normalizedSize: function () {
    return this.size.trim().toLowerCase()
  }
}
```

--------------------------------

### Vue.js Custom Directive: Function Shorthand for Bind/Update

Source: https://v2.vuejs.org/v2/guide/custom-directive

This shorthand allows defining a custom directive by providing a single function that will be called on both 'bind' and 'update' hooks. It's useful when the logic for initial binding and subsequent updates is identical. The directive directly manipulates the element's style based on the binding value.

```javascript
Vue.directive('color-swatch', function (el, binding) {
  el.style.backgroundColor = binding.value
})
```

--------------------------------

### Implement v-model Logic in Vue Render Functions

Source: https://v2.vuejs.org/v2/guide/render-function

Demonstrates how to replicate `v-model` functionality in Vue render functions. This involves manually handling the `input` event and updating the `value` prop, offering granular control over input behavior.

```javascript
props: ['value'],
render: function (createElement) {
  var self = this
  return createElement('input', {
    domProps: {
      value: self.value
    },
    on: {
      input: function (event) {
        self.$emit('input', event.target.value)
      }
    }
  })
}
```

--------------------------------

### Vue.js Prop Validation with Custom Validator Function

Source: https://v2.vuejs.org/v2/guide/components-props

Implements a custom validator function for a prop to enforce specific allowed values ('success', 'warning', 'danger'). This provides fine-grained control over prop acceptance, ensuring data integrity.

```javascript
Vue.component('my-component', {
  props: {
    propF: {
      validator: function (value) {
        return ['success', 'warning', 'danger'].includes(value)
      }
    }
  }
})
```

--------------------------------

### Emit Custom Event in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Demonstrates how to emit a custom event from a Vue component. Event names should be kebab-cased for consistency and to avoid issues with DOM template transformations. This method is fundamental for parent-child component communication.

```javascript
this.$emit('my-event', payload)
```

--------------------------------

### Vue.js: Slot with HTML and Component Content

Source: https://v2.vuejs.org/v2/guide/components-slots

Illustrates how slots in Vue.js can render complex content, including HTML elements like icons and other Vue components. This allows for flexible and rich content injection into child components.

```html
<navigation-link url="/profile">
  <span class="fa fa-user"></span>
  Your Profile
</navigation-link>
```

```html
<navigation-link url="/profile">
  <font-awesome-icon name="user"></font-awesome-icon>
  Your Profile
</navigation-link>
```

--------------------------------

### Vue.js: Template Expression for String Reversal (Discouraged)

Source: https://v2.vuejs.org/v2/guide/computed

Shows a simple Vue template displaying a reversed message directly within an expression. This approach is discouraged for anything beyond simple operations as it can lead to bloated and hard-to-maintain templates.

```html
<div id="example">
  {{ message.split('').reverse().join('') }}
</div>

```

--------------------------------

### Vue.js: Use v-for with an integer for repeated elements

Source: https://v2.vuejs.org/v2/guide/list

The v-for directive can accept an integer, causing the template to be repeated that many times. This is a concise way to generate a series of similar elements without needing an explicit array.

```html
<div>
  <span v-for="n in 10">{{ n }} </span>
</div>
```

--------------------------------

### Vue.js: Basic Text Input Binding with v-model

Source: https://v2.vuejs.org/v2/guide/forms

Demonstrates the basic usage of the `v-model` directive for a text input field. It creates a two-way data binding between the input element and the 'message' data property. When the user types, the 'message' is updated, and when 'message' changes programmatically, the input reflects it.

```html
<input v-model="message" placeholder="edit me">
<p>Message is: {{ message }}</p>
```

--------------------------------

### Augment Vue Global Properties and Component Options in TypeScript

Source: https://v2.vuejs.org/v2/guide/typescript

This code shows how to augment Vue's `VueConstructor` for global properties and `ComponentOptions` for custom component options using TypeScript module augmentation. This allows for declaring and using custom global variables or component-specific configurations.

```typescript
import Vue from 'vue'
  
declare module 'vue/types/vue' {
  interface VueConstructor {
    $myGlobal: string
  }
}
  
declare module 'vue/types/options' {
  interface ComponentOptions<V extends Vue> {
    myOption?: string
  }
}
```

--------------------------------

### Remove Event Listeners with vm.$off

Source: https://v2.vuejs.org/v2/api

Remove custom event listeners registered with `vm.$on` or `vm.$once`. If no arguments are provided, all listeners are removed. Providing an event name removes all listeners for that event. Specifying both event and callback removes only that specific listener. Supports array of events (v2.2.2+).

```javascript
vm.$off( [event, callback] )
```

--------------------------------

### Vue.js: Control Exact Modifier Key Combinations with .exact

Source: https://v2.vuejs.org/v2/guide/events

The .exact modifier in Vue.js provides precise control over which system modifier keys must be pressed for an event to trigger. Without .exact, additional modifier keys are permitted. With .exact, the event only fires if the specified modifiers are pressed and no others.

```html
<!-- this will fire even if Alt or Shift is also pressed -->
<button v-on:click.ctrl="onClick">A</button>

<!-- this will only fire when Ctrl and no other keys are pressed -->
<button v-on:click.ctrl.exact="onCtrlClick">A</button>

<!-- this will only fire when no system modifiers are pressed -->
<button v-on:click.exact="onClick">A</button>
```

--------------------------------

### Vue v-text directive: Update element's textContent

Source: https://v2.vuejs.org/v2/api

The v-text directive updates an element's textContent. For updating specific parts of the text content, Mustache interpolations ({{ }}) are recommended. It expects a string value.

```html
<span v-text="msg"></span>
<!-- same as -->
<span>{{msg}}</span>
```

--------------------------------

### Custom Option Merging Strategy in Vue

Source: https://v2.vuejs.org/v2/api

Defines a custom merging strategy for component options using Vue.config.optionMergeStrategies. This allows developers to control how parent and child component options are merged. It takes a function as a value.

```javascript
Vue.config.optionMergeStrategies._my_option = function (parent, child, vm) {
  return child + 1
}

const Profile = Vue.extend({
  _my_option: 1
})

// Profile.options._my_option = 2
```

--------------------------------

### Vue.js: Recursive Component Naming Convention

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Explains the requirement for the `name` option when defining recursive components in Vue.js. This option provides a unique identifier for the component, allowing it to reference itself within its own template.

```javascript
name: 'unique-name-of-my-component'
```

--------------------------------

### Workaround for DOM Template Parsing Caveats with Vue's 'is' Attribute

Source: https://v2.vuejs.org/v2/guide/components

This snippet shows a workaround for limitations in HTML where certain elements restrict child elements. By using the 'is' special attribute on a custom component tag, Vue can correctly interpret and render it within restricted elements like <table>.

```html
<table>
  <tr is="blog-post-row"></tr>
</table>
```

--------------------------------

### Emitting Update Events for Prop Synchronization in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Manually implement two-way prop binding by emitting an 'update:propName' event from the child component when a prop needs to be changed. The parent component listens for this event and updates its local data property accordingly. This is the underlying pattern that the .sync modifier simplifies.

```javascript
this.$emit('update:title', newTitle)
```

```html
<text-document
  v-bind:title="doc.title"
  v-on:update:title="doc.title = $event"
></text-document>
```

--------------------------------

### Using the Native 'debugger' Statement in Vue.js

Source: https://v2.vuejs.org/v2/cookbook/debugging-in-vscode

This snippet demonstrates how to use the native JavaScript 'debugger' statement within a Vue.js component's mounted hook. When the code execution reaches the 'debugger' statement and the browser's developer tools are open, execution will pause, allowing inspection of variables like 'hello'. Remember to remove 'debugger' statements before deploying to production.

```javascript
<script>
export default {
  data() {
    return {
      message: ''
    }
  },
  mounted() {
    const hello = 'Hello World!'
    debugger
    this.message = hello
  }
};
</script>
```

--------------------------------

### Vue.js: Inline Event Handlers with Native Event Argument

Source: https://v2.vuejs.org/v2/guide/events

Explains how to pass the native DOM event object to an inline event handler using the special `$event` variable. This is useful when the inline logic needs to interact with or prevent default browser behavior.

```html
<button v-on:click="warn('Form cannot be submitted yet.', $event)">
  Submit
</button>
```

```javascript
// ...
methods: {
  warn: function (message, event) {
    if (event) {
      event.preventDefault();
    }
    alert(message);
  }
}
```

--------------------------------

### Vue Render Functions: Manual Event Modifier Implementation

Source: https://v2.vuejs.org/v2/guide/render-function

Illustrates how to manually implement event modifiers like `.stop`, `.prevent`, `.self`, and key modifiers within event handler functions in Vue render functions. This provides maximum control over event propagation and default actions.

```javascript
on: {
  keyup: function (event) {
    // Abort if the element emitting the event is not
    // the element the event is bound to
    if (event.target !== event.currentTarget) return
    // Abort if the key that went up is not the enter
    // key (13) and the shift key was not held down
    // at the same time
    if (!event.shiftKey || event.keyCode !== 13) return
    // Stop event propagation
    event.stopPropagation()
    // Prevent the default keyup handler for this element
    event.preventDefault()
    // ...
  }
}
```

--------------------------------

### Ensure VNode Uniqueness in Vue Render Functions

Source: https://v2.vuejs.org/v2/guide/render-function

Demonstrates the correct way to render multiple identical VNodes using a factory function. Rendering duplicate VNodes directly within the same parent is invalid and will cause errors.

```javascript
render: function (createElement) {
  var myParagraphVNode = createElement('p', 'hi')
  return createElement('div', [
    // Yikes - duplicate VNodes!
    myParagraphVNode, myParagraphVNode
  ])
}
```

```javascript
render: function (createElement) {
  return createElement('div',
    Array.apply(null, { length: 20 }).map(function () {
      return createElement('p', 'hi')
    })
  )
}
```

--------------------------------

### Vue.js: Use 'key' attribute with v-for for list item tracking

Source: https://v2.vuejs.org/v2/guide/list

When rendering lists with v-for, use the 'key' attribute to provide a unique identifier for each item. This helps Vue efficiently track, reuse, and reorder DOM elements, especially when child component state or temporary DOM state is involved. Keys should be primitive string or numeric values.

```html
<div v-for="item in items" v-bind:key="item.id">
  <!-- content -->
</div>
```

--------------------------------

### Basic Scoped Slot Usage with `slot-scope`

Source: https://v2.vuejs.org/v2/guide/components-slots

Demonstrates the fundamental way to use `slot-scope` to receive props from a child component within a parent's template. The `slotProps` variable holds the data passed from the slot.

```html
<slot-example>
  <template slot="default" slot-scope="slotProps">
    {{ slotProps.msg }}
  </template>
</slot-example>
```

--------------------------------

### Customize v-model on Vue Component

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Shows how to customize the `prop` and `event` used by `v-model` on a custom Vue component. This is useful when the default 'value' prop or 'input' event conflicts with the component's intended usage, such as with checkboxes.

```javascript
Vue.component('base-checkbox', {
  model: {
    prop: 'checked',
    event: 'change'
  },
  props: {
    checked: Boolean
  },
  template: `
    <input
      type="checkbox"
      v-bind:checked="checked"
      v-on:change="$emit('change', $event.target.checked)"
    >
  `
})
```

--------------------------------

### Vue.js: Conditional groups with v-if on template

Source: https://v2.vuejs.org/v2/guide/conditional

To toggle multiple elements at once, v-if can be applied to a <template> element. This acts as an invisible wrapper, and the <template> element itself is not rendered in the final output. It's useful for grouping elements under a single conditional.

```html
<template v-if="ok">
  <h1>Title</h1>
  <p>Paragraph 1</p>
  <p>Paragraph 2</p>
</template>
```

--------------------------------

### Vue.js: Pass Non-Prop Attribute to Component

Source: https://v2.vuejs.org/v2/guide/components-props

Demonstrates passing an attribute not defined as a prop to a Vue.js component. This attribute will be automatically applied to the component's root element.

```html
<bootstrap-date-input data-date-picker="activated"></bootstrap-date-input>
```

--------------------------------

### Base SVG Icon Component in Vue.js

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

Defines a base SVG component for Vue.js that accepts props for dynamic sizing, coloring, and accessibility. It uses slots to render individual icon paths. This component is designed to be reusable for creating various inline SVG icons.

```vue
<template>
  <svg xmlns="http://www.w3.org/2000/svg" 
    :width="width"  
    :height="height"  
    viewBox="0 0 18 18"  
    :aria-labelledby="iconName"  
    role="presentation"  
  >  
    <title  
      :id="iconName"  
      lang="en"  
    >{{ iconName }} icon</title>  
    <g :fill="iconColor">  
      <slot />  
    </g>  
  </svg>  
</template>
```

```javascript
export default {
  props: {
    iconName: {
      type: String,
      default: 'box'
    },
    width: {
      type: [Number, String],
      default: 18
    },
    height: {
      type: [Number, String],
      default: 18
    },
    iconColor: {
      type: String,
      default: 'currentColor'
    }
  }
}
```

--------------------------------

### Vue.js Computed Property: Basic Getter

Source: https://v2.vuejs.org/v2/guide/computed

Demonstrates a basic Vue.js computed property that derives a 'fullName' from 'firstName' and 'lastName'. This approach is preferred over imperative watchers for simple data derivations due to its declarative nature and automatic caching.

```javascript
var vm = new Vue({
  el: '#demo',
  data: {
    firstName: 'Foo',
    lastName: 'Bar'
  },
  computed: {
    fullName: function () {
      return this.firstName + ' ' + this.lastName
    }
  }
})
```

--------------------------------

### Vue.js Computed Property: Getter and Setter

Source: https://v2.vuejs.org/v2/guide/computed

Illustrates a Vue.js computed property with both a getter and a setter. The getter derives a value, while the setter allows updating the underlying data properties when the computed property is assigned a new value. This enables two-way binding for derived data.

```javascript
// ...
computed: {
  fullName: {
    // getter
    get: function () {
      return this.firstName + ' ' + this.lastName
    },
    // setter
    set: function (newValue) {
      var names = newValue.split(' ')
      this.firstName = names[0]
      this.lastName = names[names.length - 1]
    }
  }
}
// ...
```

--------------------------------

### v-html Directive in Vue.js

Source: https://v2.vuejs.org/v2/api

Updates the element's innerHTML with plain HTML content. This directive can be dangerous if used with untrusted content due to XSS risks. Scoped styles do not apply to content rendered via v-html.

```html
<div v-html="html"></div>
```

--------------------------------

### Forwarding All Event Listeners in Vue Components ($listeners)

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Use the $listeners property to forward all event listeners from a parent component to a specific child element within a child component. This is crucial for creating transparent wrapper components that behave like native elements, especially when handling v-model.

```javascript
Vue.component('base-input', {
  inheritAttrs: false,
  props: ['label', 'value'],
  computed: {
    inputListeners: function () {
      var vm = this
      // `Object.assign` merges objects together to form a new object
      return Object.assign({},
        // We add all the listeners from the parent
        this.$listeners,
        // Then we can add custom listeners or override the
        // behavior of some listeners.
        {
          // This ensures that the component works with v-model
          input: function (event) {
            vm.$emit('input', event.target.value)
          }
        }
      )
    }
  },
  template: '
    <label>
      {{ label }}
      <input
        v-bind="$attrs"
        v-bind:value="value"
        v-on="inputListeners"
      >
    </label>
  '
})
```

```json
{
  focus: function (event) { /* ... */ },
  input: function (value) { /* ... */ }
}
```

--------------------------------

### Vue v-model Trim Modifier

Source: https://v2.vuejs.org/v2/guide/forms

Describes the `.trim` modifier for v-model, which automatically removes whitespace from the beginning and end of the user's input before updating the bound data property.

```html
<input v-model.trim="msg">
```

--------------------------------

### Resolve Memory Leak with Choices API destroy() in Vue.js

Source: https://v2.vuejs.org/v2/cookbook/avoiding-memory-leaks

This snippet demonstrates how to clean up a Choices API instance before removing it from the DOM in a Vue.js application. It involves storing a reference to the Choices instance in the Vue instance's data and calling its `destroy()` method. This prevents memory leaks by releasing resources held by the Choices instance.

```javascript
new Vue({
  el: "#app",
  data: function () {
    return {
      showChoices: true,
      choicesSelect: null
    }
  },
  mounted: function () {
    this.initializeChoices()
  },
  methods: {
    initializeChoices: function () {
      let list = []
      for (let i = 0; i < 1000; i++) {
        list.push({
          label: "Item " + i,
          value: i
        })
      }
      // Set a reference to our choicesSelect in our Vue instance's data object
      this.choicesSelect = new Choices("#choices-single-default", {
        searchEnabled: true,
        removeItemButton: true,
        choices: list
      })
    },
    show: function () {
      this.showChoices = true
      this.$nextTick(() => {
        this.initializeChoices()
      })
    },
    hide: function () {
      // now we can use the reference to Choices to perform clean up here
      // prior to removing the elements from the DOM
      this.choicesSelect.destroy()
      this.showChoices = false
    }
  }
})

```

--------------------------------

### Vue.js SVG Template with Clipping and Gradients

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This Vue.js template defines an SVG element with a specific viewBox and uses clip paths and radial gradients for visual styling. The `v-clipscroll` and `v-drawscroll` directives suggest custom Vue behaviors for animation or scrolling effects.

```vue
<script type="text/x-template" id="imagearea3">
<svg class="three" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 53.97 36.89">
  <defs>
    <clipPath id="clip-path5">
      <path v-clipscroll="{ start: '700', end: '750', toPath: 'M33.15 0H49.15V22H33.15z' }" id="starshape" d="M43.08 0.8L43.96 3.53 46.39 2.01 45.31 4.67 48.15 5.06 45.61 6.4 47.54 8.53 44.73 7.92 44.84 10.79 43.08 8.53 41.32 10.79 41.42 7.92 38.62 8.53 40.54 6.4 38.01 5.06 40.85 4.67 39.77 2.01 42.2 3.53 43.08 0.8z"/>
    </clipPath>
    <radialGradient id="radial-gradient5" cx="41.15" cy="11" r="9.62" gradientUnits="userSpaceOnUse">
      <stop offset="0" stop-color="#ff6ea7"/>
      <stop offset="1" stop-color="#ff038f"/>
    </radialGradient>
  </defs>
    
  <g clip-path="url(#clip-path5)">
    <path fill="url(#radial-gradient5)" d="M33.15 0H49.15V22H33.15z"/>
    <g v-drawscroll="{ start: '550', end: '600' }" fill="none" stroke-miterlimit="10">
      <path stroke="#011eff" stroke-width=".25" d="M-27.44,32.19c1.52.18,3.33,5.69,5,5.34,1.45-.3,1.15-6.16,2.69-6.89,1.34-.63,5.51,3.5,6.92,2.55,1.24-.83-.89-6.32.4-7.4s6.05,2.27,7.25,1.11c1.52-1.28-.68-6.95.91-8.36S2.41,20.2,4.06,19s1.1-7.33,3-7.93,4,4.64,6.13,5.31c1.7.54,6.28-3.12,8-1.38" transform="translate(32.53 -.78)"/>
      <path stroke="#181bf5" stroke-width=".273" d="M-27.63,31.55c1.55.41,3,6,4.65,5.64,1.48-.29,1.2-6.16,2.78-6.95,1.35-.69,5.67,3.29,7.09,2.27,1.25-.9-1-6.36.33-7.49s6.14,2.11,7.37.93c1.53-1.33-.69-7,.91-8.41s6.73,1.67,8.39.5S5.06,10.7,7,10.1s4.15,4.65,6.26,5.26c1.74.51,6.24-3.26,8.06-1.58" transform="translate(32.53 -.78)"/>
      <path stroke="#2f19ea" stroke-width=".295" d="M-27.88,30.83c1.58.64,2.61,6.2,4.31,5.93,1.52-.25,1.31-6.14,2.93-7,1.36-.73,5.8,3.12,7.23,2,1.27-.94-1-6.41.3-7.57s6.23,2,7.48.78c1.54-1.36-.68-7,.93-8.44S2,18.26,3.73,17.1,5,9.77,6.88,9.17s4.25,4.66,6.38,5.21c1.79.47,6.19-3.44,8.06-1.82" transform="translate(32.53 -.78)"/>
      <path stroke="#4616e0" stroke-width=".318" d="M-28.19,30c1.6.87,2.26,6.44,4,6.22,1.55-.2,1.45-6.1,3.1-7,1.39-.76,5.91,3,7.37,1.87,1.28-1-1-6.46.29-7.66s6.31,1.89,7.59.67c1.55-1.4-.65-7.08,1-8.48s6.75,1.74,8.46.59S4.89,8.91,6.82,8.31s4.35,4.66,6.49,5.15c1.84.43,6.13-3.63,8-2.09" transform="translate(32.53 -.78)"/>
      <path stroke="#5d13d6" stroke-width=".341" d="M-28.36,29.25C-25,32-21.68,35.7-17.84,33.19c2.83-1.85,2.3-9,5.4-12,2.8-2.64,9.38-1.08,12.41-3.4C3.27,15.3,4.38,8.27,8,7.51s6.34,4.88,10.18,7.37" transform="translate(32.53 -.78)"/>
      <path stroke="#7410cb" stroke-width=".364" d="M-28.92,28.13c3.38,2.87,6.68,6.71,10.55,4.28,2.89-1.82,2.48-9.06,5.64-12C-9.88,17.78-3.27,19.33-.2,17c3.34-2.55,4.48-9.61,8.08-10.4s6.48,4.82,10.38,7.28" transform="translate(32.53 -.78)"/>
      <path stroke="#8c0ec1" stroke-width=".386" d="M-29.51,26.9c3.42,3,6.67,7,10.58,4.65,2.95-1.76,2.69-9,5.92-12,2.9-2.63,9.52-1,12.65-3.41C3,13.63,4.18,6.55,7.82,5.73s6.62,4.77,10.56,7.2" transform="translate(32.53 -.78)"/>
    </g>
  </g>
</svg>
</script>

```

--------------------------------

### Vue.js: Dynamic Slot Names

Source: https://v2.vuejs.org/v2/guide/components-slots

Vue.js 2.6.0+ supports dynamic directive arguments for `v-slot`, allowing the definition of slot names programmatically. This is useful when the slot name needs to be determined at runtime.

```html
<base-layout>
  <template v-slot:[dynamicSlotName]>
    ...
  </template>
</base-layout>

```

--------------------------------

### Vue.js errorCaptured Hook Signature

Source: https://v2.vuejs.org/v2/api

The `errorCaptured` hook is called when an error from any descendant component is captured. It receives the error, the component instance, and error information. Returning `false` prevents further error propagation. This hook is new in Vue 2.5.0+.

```typescript
errorCaptured: (err: Error, vm: Component, info: string) => ?boolean
```

--------------------------------

### Vue.filter: Register Global Filter

Source: https://v2.vuejs.org/v2/api

Registers or retrieves a global filter. A filter is a function that takes a value and returns a processed value. This function is then used within template interpolations or directives to format data.

```javascript
// register
Vue.filter('my-filter', function (value) {
  // return processed value
})

// getter, return the filter if registered
var myFilter = Vue.filter('my-filter')
```

--------------------------------

### Register Global Custom Directive in Vue.js

Source: https://v2.vuejs.org/v2/guide/custom-directive

This code demonstrates how to register a custom directive named 'v-focus' globally in Vue.js. The directive is designed to focus an input element when it's inserted into the DOM. It utilizes the `inserted` hook function for this purpose.

```javascript
Vue.directive('focus', {
  // When the bound element is inserted into the DOM...
  inserted: function (el) {
    // Focus the element
    el.focus()
  }
})
```

--------------------------------

### Dependency Injection: Inject Option (Vue.js)

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

The 'inject' instance option in a descendant component allows it to access properties provided by an ancestor. This acts like 'long-range props' but without the ancestor needing to know which descendants are consuming the properties.

```javascript
inject: ['getMap']
```

--------------------------------

### Vue.js v-drawscroll Directive for Drawing SVG Paths

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This directive animates SVG paths by drawing them progressively as the user scrolls. It leverages GSAP's DrawSVGPlugin and requires TweenMax. The directive listens for scroll events and removes the listener once a specified end scroll point is reached.

```javascript
Vue.directive('drawscroll', {
  inserted: function(el, binding) {
    let f = function(evt) {
      var hasDrawn = false;
      if (!hasDrawn && window.scrollY > binding.value.start) {
        hasDrawn = true;
        TweenMax.set(el, {
          opacity: 1
        });
        
        TweenMax.staggerFromTo(el.childNodes, 5, {
          drawSVG: false
        }, {
          drawSVG: true,
          ease: Sine.easeOut
        }, -0.1);
      }
      if (window.scrollY > binding.value.end) {
        window.removeEventListener('scroll', f);
      }
    };
    window.addEventListener('scroll', f);
  }
});
```

--------------------------------

### Vue.js Custom Scroll Directive

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

This Vue.js directive 'scroll' listens for scroll events and executes a provided callback function. It removes the event listener once the callback returns true, making it efficient for one-time triggered actions. It's registered globally using Vue.directive and used within a Vue instance's methods.

```javascript
Vue.directive('scroll', {
  inserted: function (el, binding) {
    let f = function (evt) {
      if (binding.value(evt, el)) {
        window.removeEventListener('scroll', f)
      }
    }
    window.addEventListener('scroll', f)
  }
})

// main app
new Vue({
  el: '#app',
  methods: {
    handleScroll: function (evt, el) {
      if (window.scrollY > 50) {
        el.setAttribute(
          'style',
          'opacity: 1; transform: translate3d(0, -10px, 0)'
        )
      }
      return window.scrollY > 100
    }
  }
})
```

--------------------------------

### Vue.js: Stop Listening for an Event with $off

Source: https://v2.vuejs.org/v2/guide/components-edge-cases

Explains the usage of the `$off` method to stop listening for specific events on a Vue instance. This is crucial for preventing memory leaks and ensuring proper cleanup. It can remove all listeners for an event or a specific listener if provided.

```javascript
this.$off('eventName', eventHandler)
```

--------------------------------

### Binding Native Event to Vue Component Root Element (.native)

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Listen directly to native events on a component's root element using the .native modifier with v-on. This is useful for triggering parent methods directly from child component events. Be cautious as this can break if the component's root element changes.

```html
<base-input v-on:focus.native="onFocus"></base-input>
```

--------------------------------

### Vue Radio Button Value Binding

Source: https://v2.vuejs.org/v2/guide/forms

Shows how to bind a radio button's selected value to a dynamic property using v-bind. The `v-model` will update to the value of the bound property when the radio button is checked.

```html
<input type="radio" v-model="pick" v-bind:value="a">

```

```javascript
// when checked:
vm.pick === vm.a
```

--------------------------------

### Vue.js: Scoped Slots - Passing Child Data to Parent

Source: https://v2.vuejs.org/v2/guide/components-slots

Illustrates how to use scoped slots in Vue.js to pass data from a child component to its parent. The child component binds data ('user') to the slot using v-bind, making it accessible in the parent via a named prop object.

```html
<span>
  <slot v-bind:user="user">
    {{ user.lastName }}
  </slot>
</span>
```

--------------------------------

### Vue Select Option Object Literal Value

Source: https://v2.vuejs.org/v2/guide/forms

Demonstrates binding a select option's value to an inline object literal. When selected, the v-model will be updated with the actual object, allowing access to its properties.

```html
<select v-model="selected">
  <!-- inline object literal -->
  <option v-bind:value="{ number: 123 }">123</option>
</select>

```

```javascript
// when selected:
typeof vm.selected // => 'object'
v
```

--------------------------------

### Vue v-model Lazy Modifier

Source: https://v2.vuejs.org/v2/guide/forms

Explains the `.lazy` modifier for v-model, which changes the synchronization to occur after a `change` event (e.g., when the user tabs out of the input) instead of immediately after each `input` event.

```html
<!-- synced after "change" instead of "input" -->
<input v-model.lazy="msg">
```

--------------------------------

### SVG Path Data for Visual Elements

Source: https://v2.vuejs.org/v2/cookbook/creating-custom-scroll-directives

These SVG path elements define shapes and lines with specific stroke colors and widths. They are likely used to render graphical components within the application. The `transform` attribute suggests translation for positioning.

```svg
<path stroke="#7410cb" stroke-width=".364" d="M-15.27,14.06c3.29,2,6.46,6.62,10.22,5,3-1.32,3.44-8.36,6.75-10.59,3-2,9,.71,12.27-1s5-8.49,8.63-9,6.25,5.3,10,7" transform="translate(18.79 3.97)"/>

```

```svg
<path stroke="#8c0ec1" stroke-width=".386" d="M-15.85,13.18C-12.52,15.31-9.4,20-5.6,18.4c3.07-1.27,3.64-8.34,7-10.56,3-2,9.1.74,12.38-1s5.13-8.52,8.75-9,6.38,5.25,10.14,7" transform="translate(18.79 3.97)"/>

```

```svg
<path stroke="#a30bb6" stroke-width=".409" d="M-16.45,12.22c3.37,2.22,6.45,7,10.28,5.49C-3,16.49-2.32,9.42,1.11,7.22c3.1-2,9.16.8,12.5-1s5.22-8.52,8.88-9S29,2.45,32.79,4.11" transform="translate(18.79 3.97)"/>

```

```svg
<path stroke="#ba08ac" stroke-width=".432" d="M-16.85,11.37c1.53,1.24,1,6.9,2.63,7.08s2.78-5.59,4.54-6.2c1.55-.54,5.45,3.83,7.06,2.92S-2.57,8.55-1,7.58s6,2.93,7.46,2c1.74-1.11.71-7.08,2.52-8s6,3.36,7.91,2.66,2.51-6.71,4.53-7,4.31,5.19,6.39,5.34,5.07-5,7.12-4.33" transform="translate(18.79 3.97)"/>

```

```svg
<path stroke="#d105a2" stroke-width=".455" d="M-17.42,10.36c1.53,1.33.82,7,2.43,7.23s3-5.49,4.78-6.09c1.57-.52,5.45,3.87,7.1,3,1.49-.83.14-6.66,1.69-7.62s6,3,7.51,2.09C7.86,7.83,7,1.84,8.8.93s5.92,3.52,7.86,2.87,2.67-6.64,4.71-6.95,4.34,5.23,6.44,5.35,4.93-5.14,7-4.58" transform="translate(18.79 3.97)"/>

```

```svg
<path stroke="#e80397" stroke-width=".477" d="M-18,9.29c1.53,1.42.65,7.06,2.26,7.36s3.17-5.39,5-6c1.6-.51,5.45,3.91,7.13,3,1.52-.83.26-6.69,1.84-7.64s6,3,7.54,2.19c1.8-1.08,1-7.1,2.92-7.95S14.51,4,16.48,3.38s2.84-6.56,4.91-6.83,4.35,5.27,6.46,5.36,4.79-5.26,6.88-4.82" transform="translate(18.79 3.97)"/>

```

```svg
<path stroke="#ff008d" stroke-width=".5" d="M-18.62,8.19c1.53,1.48.51,7.11,2.12,7.46s3.34-5.29,5.18-5.84c1.64-.49,5.45,4,7.15,3s.39-6.71,2-7.65S3.77,8.34,5.4,7.53C7.23,6.47,6.66.43,8.56-.36S14.28,3.52,16.3,3s3-6.47,5.11-6.7,4.36,5.33,6.48,5.39,4.65-5.38,6.76-5" transform="translate(18.79 3.97)"/>

```

--------------------------------

### Preserve Component State with Vue.js keep-alive

Source: https://v2.vuejs.org/v2/cookbook/avoiding-memory-leaks

This snippet shows how to use Vue.js's built-in `keep-alive` component to preserve the state of a child component. By wrapping a component with `keep-alive`, its state is maintained in memory even when it's not actively rendered. This is useful for scenarios where users might navigate away from a form and expect their input to be saved upon returning.

```html
<button @click="show = false">Hide</button>
<keep-alive>
  <!-- my-component will be intentionally kept in memory even when removed -->
  <my-component v-if="show"></my-component>
</keep-alive>

```

--------------------------------

### CSS Styling for Vue.js Animatable Icon Container

Source: https://v2.vuejs.org/v2/cookbook/editable-svg-icons

This CSS provides basic styling for the application container and the animatable scissors icon. It centers the content, sets the text color, and styles the icon to be displayed centrally with a pointer cursor, indicating interactivity.

```css
#app {
  margin: 50px 0;
  color: #666;
  text-align: center;
}

#iconScissors {
  margin: 0 auto;
  display: table;
  cursor: pointer;
}

```

--------------------------------

### Vue.js: Add an else block with v-else

Source: https://v2.vuejs.org/v2/guide/conditional

The v-else directive can be used to provide an 'else block' for an v-if directive. It must immediately follow a v-if or v-else-if element to be recognized. This allows for simple two-state conditional rendering.

```html
<h1 v-if="awesome">Vue is awesome!</h1>
<h1 v-else>Oh no 😢</h1>
```

--------------------------------

### Two-Way Prop Binding with .sync Modifier in Vue.js

Source: https://v2.vuejs.org/v2/guide/components-custom-events

Utilize the .sync modifier as a shorthand for two-way prop binding. It automatically sets up an event listener to update the parent's data when the child emits an 'update:propName' event. This simplifies synchronization of prop values between parent and child components.

```html
<text-document v-bind:title.sync="doc.title"></text-document>
```

```html
<text-document v-bind.sync="doc"></text-document>
```

--------------------------------

### v-bind: Camel Case Modifier for Attributes in Vue.js

Source: https://v2.vuejs.org/v2/api

The `.camel` modifier transforms kebab-case attribute names to camelCase for `v-bind`, particularly useful for in-DOM templates like SVG's `viewBox`. This modifier is unnecessary when using string templates or compiling with tools like `vue-loader`.

```html
<svg :view-box.camel="viewBox"></svg>
```

--------------------------------

### Vue.js: Controlling element re-use with keys

Source: https://v2.vuejs.org/v2/guide/conditional

By default, Vue re-uses elements for efficiency. Adding a unique `key` attribute to elements within v-if blocks tells Vue to treat them as completely separate entities, forcing re-rendering from scratch when the condition changes. This is crucial for inputs or other elements where state preservation is not desired.

```html
<template v-if="loginType === 'username'">
  <label>Username</label>
  <input placeholder="Enter your username" key="username-input">
</template>
<template v-else>
  <label>Email</label>
  <input placeholder="Enter your email address" key="email-input">
</template>
```

--------------------------------

### Vue.js: Disable Attribute Inheritance

Source: https://v2.vuejs.org/v2/guide/components-props

Shows how to disable the default behavior of inheriting non-prop attributes on a component's root element by setting `inheritAttrs: false` in the component's options.

```javascript
Vue.component('my-component', {
  inheritAttrs: false,
  // ...
})
```

--------------------------------

### Accessing Static Slots in Vue Render Functions

Source: https://v2.vuejs.org/v2/guide/render-function

Shows how to access static slot contents as arrays of VNodes using `this.$slots.default` within Vue render functions. This allows for direct manipulation or rendering of default slot content.

```javascript
render: function (createElement) {
  // `<div><slot></slot></div>`
  return createElement('div', this.$slots.default)
}
```

--------------------------------

### Vue.delete: Remove Reactive Property

Source: https://v2.vuejs.org/v2/api

Deletes a property from a reactive object, ensuring that the deletion triggers view updates. This is useful for circumventing Vue's limitation in detecting property deletions. It also works with arrays using an index (available since 2.2.0). The target cannot be a Vue instance or its root data object.

```javascript
Vue.delete(object, propertyName);
```

--------------------------------

### Scoped Slot Usage on Non-`<template>` Elements

Source: https://v2.vuejs.org/v2/guide/components-slots

Illustrates using `slot-scope` directly on elements other than `<template>`, such as `<span>` or other components. This allows scoped slot content to be applied to specific elements within the parent.

```html
<slot-example>
  <span slot-scope="slotProps">
    {{ slotProps.msg }}
  </span>
</slot-example>
```

--------------------------------

### Accessing Scoped Slots in Vue Render Functions

Source: https://v2.vuejs.org/v2/guide/render-function

Demonstrates how to access scoped slots as functions that return VNodes using `this.$scopedSlots.default` in Vue render functions. This is crucial for components that provide data back to their parent through slots.

```javascript
props: ['message'],
render: function (createElement) {
  // `<div><slot :text="message"></slot></div>`
  return createElement('div', [
    this.$scopedSlots.default({
      text: this.message
    })
  ])
}
```

--------------------------------

### Vue.js: Chained conditional rendering with v-else-if

Source: https://v2.vuejs.org/v2/guide/conditional

The v-else-if directive allows for chaining multiple conditional checks. It must immediately follow a v-if or v-else-if element. This is useful for handling multiple exclusive conditions.

```html
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'B'">
  B
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>
```

--------------------------------

### Vue.js: Conditionally display an element with v-show

Source: https://v2.vuejs.org/v2/guide/conditional

The v-show directive also conditionally displays an element. Unlike v-if, elements with v-show are always rendered and remain in the DOM. v-show simply toggles the CSS `display` property. It does not support <template> elements or v-else.

```html
<h1 v-show="ok">Hello!</h1>
```

--------------------------------

### Vue.js .once Event Modifier

Source: https://v2.vuejs.org/v2/guide/events

Illustrates the usage of the .once event modifier in Vue.js, which ensures an event handler is triggered at most once. This modifier can be used on both native DOM events and component events.

```html
<a v-on:click.once="doThis"></a>
```

--------------------------------

### Register Local Custom Directive in Vue.js

Source: https://v2.vuejs.org/v2/guide/custom-directive

This code snippet shows how to register a custom directive named 'focus' locally within a Vue component. Directives can be defined in the `directives` option of a component. Similar to global directives, this local 'focus' directive uses the `inserted` hook to focus an element.

```javascript
directives: {
  focus: {
    // directive definition
    inserted: function (el) {
      el.focus()
    }
  }
}
```

--------------------------------

### Vue Checkbox True/False Values

Source: https://v2.vuejs.org/v2/guide/forms

Explains how to use `true-value` and `false-value` attributes with checkboxes to bind to specific string values instead of booleans. Note that these do not affect form submission for unchecked boxes.

```html
<input
  type="checkbox"
  v-model="toggle"
  true-value="yes"
  false-value="no">

```

```javascript
// when checked:
vm.toggle === 'yes'
// when unchecked:
vm.toggle === 'no'
```

--------------------------------

### Vue.js Event Modifiers for DOM Events

Source: https://v2.vuejs.org/v2/guide/events

Demonstrates the use of various event modifiers for v-on directives in Vue.js. Modifiers like .stop, .prevent, .capture, and .self alter default event handling behavior. Order matters when chaining modifiers.

```html
<a v-on:click.stop="doThis"></a>

<form v-on:submit.prevent="onSubmit"></form>

<a v-on:click.stop.prevent="doThat"></a>

<form v-on:submit.prevent></form>

<div v-on:click.capture="doThis">...</div>

<div v-on:click.self="doThat">...</div>
```

--------------------------------

### Vue.js: Conditionally render an element with v-if

Source: https://v2.vuejs.org/v2/guide/conditional

The v-if directive conditionally renders a block. The block is only rendered if the directive's expression returns a truthy value. This is a fundamental directive for controlling UI based on data.

```html
<h1 v-if="awesome">Vue is awesome!</h1>
```

--------------------------------

### Vue.js: Display filtered array using a method within v-for

Source: https://v2.vuejs.org/v2/guide/list

When computed properties are not feasible, such as within nested v-for loops, a method can be used to return a filtered or sorted array. This method is called for each item in the outer loop, allowing for dynamic filtering or sorting of inner data.

```html
<ul v-for="set in sets">
  <li v-for="n in even(set)">{{ n }}</li>
</ul>
```

```javascript
data: {
  sets: [[ 1, 2, 3, 4, 5 ], [6, 7, 8, 9, 10]]
},
methods: {
  even: function (numbers) {
    return numbers.filter(function (number) {
      return number % 2 === 0
    })
  }
}
```

--------------------------------

### Arrow Function Context Issue in Vue Prototype Methods

Source: https://v2.vuejs.org/v2/cookbook/adding-instance-properties

Highlights a common pitfall when defining prototype methods using ES6 arrow functions in Vue. Arrow functions do not bind their own context, meaning `this` refers to the parent scope, not the Vue instance. This snippet shows the resulting TypeError when attempting to use `this` within an arrow function defined on Vue.prototype.

```javascript
Vue.prototype.$reverseText = propertyName => {
  this[propertyName] = this[propertyName]
    .split('')
    .reverse()
    .join('')
}

// This would throw an error:
// Uncaught TypeError: Cannot read property 'split' of undefined
```

--------------------------------

### Vue.js: Single Checkbox Binding with v-model

Source: https://v2.vuejs.org/v2/guide/forms

Illustrates how to bind a single checkbox to a boolean data property using `v-model`. When the checkbox is checked, the 'checked' data property becomes true; when unchecked, it becomes false. The label displays the current boolean state of the 'checked' property.

```html
<input type="checkbox" id="checkbox" v-model="checked">
<label for="checkbox">{{ checked }}</label>
```

--------------------------------

### Vue v-model Number Modifier

Source: https://v2.vuejs.org/v2/guide/forms

Details the `.number` modifier for v-model, which automatically attempts to typecast the user's input value to a Number. This is useful as input values are typically strings.

```html
<input v-model.number="age" type="number">
```

--------------------------------

### Scoped Slot Usage Omitting `slot="default"`

Source: https://v2.vuejs.org/v2/guide/components-slots

Shows how the `slot="default"` attribute can be omitted when using the default slot, simplifying the template. The `slot-scope` attribute still makes the props available as `slotProps`.

```html
<slot-example>
  <template slot-scope="slotProps">
    {{ slotProps.msg }}
  </template>
</slot-example>
```

--------------------------------

### Vue.js: Replace array using non-mutating methods like filter

Source: https://v2.vuejs.org/v2/guide/list

Vue can detect changes when an array is replaced entirely using non-mutating methods like filter(), concat(), or slice(). Vue applies smart heuristics to reuse existing DOM elements, making this an efficient operation. This method is useful for displaying filtered or sorted results without altering the original data.

```javascript
example1.items = example1.items.filter(function (item) {
  return item.message.match(/Foo/)
})
```

--------------------------------

### Scoped Slot Usage with ES6 Destructuring

Source: https://v2.vuejs.org/v2/guide/components-slots

Presents an advanced usage of `slot-scope` employing ES6 destructuring within the attribute value. This allows directly accessing specific properties (like `msg`) from the props object, making the template cleaner.

```html
<slot-example>
  <span slot-scope="{ msg }">
    {{ msg }}
  </span>
</slot-example>
```

--------------------------------

### Vue.js: Display filtered array using computed property

Source: https://v2.vuejs.org/v2/guide/list

To display a filtered or sorted version of an array without mutating the original data, create a computed property. This computed property returns the new array, which can then be iterated over using v-for. This is a common pattern for derived data.

```html
<li v-for="n in evenNumbers">{{ n }}</li>
```

```javascript
data: {
  numbers: [ 1, 2, 3, 4, 5 ]
},
computed: {
  evenNumbers: function () {
    return this.numbers.filter(function (number) {
      return number % 2 === 0
    })
  }
}
```

--------------------------------

### Vue.js: Destructuring Slot Props

Source: https://v2.vuejs.org/v2/guide/components-slots

Scoped slots accept JavaScript expressions as arguments, enabling the use of ES2015 destructuring to extract specific slot props directly. This simplifies templates and allows for renaming props or defining fallback values.

```html
<current-user v-slot="{ user }">
  {{ user.firstName }}
</current-user>

```

```html
<current-user v-slot="{ user: person }">
  {{ person.firstName }}
</current-user>

```

```html
<current-user v-slot="{ user = { firstName: 'Guest' } }">
  {{ user.firstName }}
</current-user>

```

--------------------------------

### Vue.js .passive Event Modifier

Source: https://v2.vuejs.org/v2/guide/events

Shows how to use the .passive event modifier in Vue.js for improved performance, especially on mobile devices. It corresponds to the passive option in addEventListener and should not be used with .prevent.

```html
<div v-on:scroll.passive="onScroll">...</div>
```

--------------------------------

### Vue.js: Merge Class Attributes with Non-Prop Attributes

Source: https://v2.vuejs.org/v2/guide/components-props

Illustrates how Vue.js merges 'class' attributes when both the parent and the child component define them. The attribute passed to the component overrides existing ones, except for 'class' and 'style' which are merged.

```html
<bootstrap-date-input 
  data-date-picker="activated" 
  class="date-picker-theme-dark"
></bootstrap-date-input>
```

--------------------------------

### Passing Scoped Slots to Child Components in Vue Render Functions

Source: https://v2.vuejs.org/v2/guide/render-function

Explains how to pass scoped slots to child components using the `scopedSlots` field within the VNode data object in Vue render functions. This enables child components to define how parent-provided content should be rendered.

```javascript
render: function (createElement) {
  // `<div><child v-slot="props"><span>{{ props.text }}</span></child></div>`
  return createElement('div', [
    createElement('child', {
      // pass `scopedSlots` in the data object
      // in the form of { name: props => VNode | Array<VNode> }
      scopedSlots: {
        default: function (props) {
          return createElement('span', props.text)
        }
      }
    })
  ])
}
```

--------------------------------

### Vue.js: Receiving Scoped Slot Props in Parent

Source: https://v2.vuejs.org/v2/guide/components-slots

Demonstrates how a parent component can receive and use data passed from a child component via scoped slots in Vue.js. The v-slot directive assigns a name ('slotProps') to the received data object, allowing access to child component properties like 'user.firstName'.

```html
<current-user>
  <template v-slot:default="slotProps">
    {{ slotProps.user.firstName }}
  </template>
</current-user>
```

--------------------------------

### Vue.js: Restrict Event Listeners to Specific Mouse Buttons

Source: https://v2.vuejs.org/v2/guide/events

Use mouse button modifiers (.left, .right, .middle) in Vue.js to ensure that an event listener only triggers when a specific mouse button is used. This allows for fine-grained control over mouse interactions within your application.

```html
<div v-on:click.left="handleLeftClick">Left Click</div>
<div v-on:click.right="handleRightClick">Right Click</div>
<div v-on:click.middle="handleMiddleClick">Middle Click</div>
```