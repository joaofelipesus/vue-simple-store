<template>
  <div id="app" class="container">
    <div>
      <h1>Bem vindo</h1>
    </div>

    <div class="mb-5">
      <input type="search" v-model="searchProduct" placeholder="Buscar" class="form-control mb-2">
      <button class="btn btn-primary" @click="filter()">Buscar</button>
    </div>

    <div class="products row">
      <product-card :productData="product" v-for="product of products" :key="product.id"></product-card>
    </div>
  </div>
</template>

<script>
import Product from './components/product/Product.vue'

export default {
  name: 'app',
  data () {
    return {
      products: [],
      searchProduct: ''
    }
  },
  components: {
    'product-card': Product
  },
  created() {
    let promise = this.$http.get('http://localhost:3000/api/products')
    promise.then(response => response.json())
            .then(products => this.products = products)
            .catch(err => console.log(err))
  },
  methods: {
    filter() {
      // NOTE: possible engines are
      //   - elastic: uses elastic search
      //   - index: uses a search index
      //   - ilike: uses ordinary text search using ILIKE operator
      const engine = 'index'
      let promise = this.$http.get(`http://localhost:3000/api/products?engine=${engine}&search_by=${this.searchProduct}`)
          promise.then(response => response.json())
            .then(products => this.products = products)
            .catch(err => console.log(err))
    }
  }
}
</script>

<style lang="scss" scoped>
</style>
