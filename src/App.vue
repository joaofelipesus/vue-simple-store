<template>
  <div id="app">
    <div>
      <h1>Bem vindo</h1>
    </div>

    <div class="products">
      <div class="product" v-for="product of products" :key="product.id">
        <div>
          <h2>{{ product.name }}</h2>
        </div>
        <div>
          <ul>
            <li>Preço: {{ product.price }}</li>
            <li>Descrição: {{ product.description }}</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      products: []
    }
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
