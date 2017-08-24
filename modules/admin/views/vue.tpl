<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Vue.js CRUD application</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" media="all" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />

<style>
.logo {
  width: 75px;
  float: left;
  margin-right: 15px;
}

.form-group {
  max-width: 500px;
}

.actions {
  padding: 10px 0;
}

.glyphicon-euro {
  font-size: 12px;
}
</style>
</head>
<body>

<div class="container">
  <header class="page-header">
    <div class="branding">
      <img src="https://vuejs.org/images/logo.png" alt="Logo" title="Home page" class="logo"/>
      <h1>Vue.js 2 CRUD application</h1>
    </div>
  </header>
  <main id="app">
    <router-view></router-view>
  </main>
</div>

<template id="product-list">
  <div>
    <div class="actions">
      <router-link class="btn btn-default" v-bind:to="{path: '/add-product'}">
        <span class="glyphicon glyphicon-plus"></span>
        Add product
      </router-link>
    </div>
    <div class="filters row">
      <div class="form-group col-sm-3">
        <label for="search-element">Product name</label>
        <input v-model="searchKey" class="form-control" id="search-element" requred/>
      </div>
    </div>
    <table class="table">
      <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th class="col-sm-2">Actions</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="product in filteredProducts">
        <td>
          <router-link v-bind:to="{name: 'product', params: {product_id: product.id}}">{{ product.name }}</router-link>
        </td>
        <td>{{ product.description }}</td>
        <td>
          {{ product.price }}
          <span class="glyphicon glyphicon-euro" aria-hidden="true"></span>
        </td>
        <td>
          <router-link class="btn btn-warning btn-xs" v-bind:to="{name: 'product-edit', params: {product_id: product.id}}">Edit</router-link>
          <router-link class="btn btn-danger btn-xs" v-bind:to="{name: 'product-delete', params: {product_id: product.id}}">Delete</router-link>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<template id="add-product">
  <div>
    <h2>Add new product</h2>
    <form v-on:submit="createProduct">
      <div class="form-group">
        <label for="add-name">Name</label>
        <input class="form-control" id="add-name" v-model="product.name" required/>
      </div>
      <div class="form-group">
        <label for="add-description">Description</label>
        <textarea class="form-control" id="add-description" rows="10" v-model="product.description"></textarea>
      </div>
      <div class="form-group">
        <label for="add-price">Price, <span class="glyphicon glyphicon-euro"></span></label>
        <input type="number" class="form-control" id="add-price" v-model="product.price"/>
      </div>
      <button type="submit" class="btn btn-primary">Create</button>
      <router-link class="btn btn-default" v-bind:to="'/'">Cancel</router-link>
    </form>
  </div>
</template>

<template id="product">
  <div>
    <h2>{{ product.name }}</h2>
    <b>Description: </b>
    <div>{{ product.description }}</div>
    <b>Price:</b>
    <div>{{ product.price }}<span class="glyphicon glyphicon-euro"></span></div>
    <br/>
    <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
    <router-link v-bind:to="'/'">Back to product list</router-link>
  </div>
</template>

<template id="product-edit">
  <div>
    <h2>Edit product</h2>
    <form v-on:submit="updateProduct">
      <div class="form-group">
        <label for="edit-name">Name</label>
        <input class="form-control" id="edit-name" v-model="product.name" required/>
      </div>
      <div class="form-group">
        <label for="edit-description">Description</label>
        <textarea class="form-control" id="edit-description" rows="3" v-model="product.description"></textarea>
      </div>
      <div class="form-group">
        <label for="edit-price">Price, <span class="glyphicon glyphicon-euro"></span></label>
        <input type="number" class="form-control" id="edit-price" v-model="product.price"/>
      </div>
      <button type="submit" class="btn btn-primary">Save</button>
      <router-link class="btn btn-default" v-bind:to="'/'">Cancel</router-link>
    </form>
  </div>
</template>

<template id="product-delete">
  <div>
    <h2>Delete product {{ product.name }}</h2>
    <form v-on:submit="deleteProduct">
      <p>The action cannot be undone.</p>
      <button type="submit" class="btn btn-danger">Delete</button>
      <router-link class="btn btn-default" v-bind:to="'/'">Cancel</router-link>
    </form>
  </div>
</template>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vue-router/2.2.1/vue-router.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue-resource@1.3.4"></script>
  <script src="{!BASE_URL!}/assets/js/vueapp.js"></script>

</body>
</html>
