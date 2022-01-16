<template>
  <div id="app" class="container">
    <div>
      <h1>Bem vindo</h1>
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

<style lang="scss" scoped>
</style>
