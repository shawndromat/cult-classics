export default class Example {
  myWorld = () => {
    return 'this is my world'
  }

  helloWorld = () => {
    console.log(this.myWorld())
  }
}
