<template>
  <div id="app">
    <div>
      <h1>Bem vindo</h1>
    </div>

    <div class="products">
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
      products: []
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
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
