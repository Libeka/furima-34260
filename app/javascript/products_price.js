window.addEventListener('load', () =>{
console.log("ok")
  const priceInput = document.getElementById("item-price");

  const addTaxDom = document.getElementById("add-tax-price");

  const profitDOM = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // console.log(inputValue);
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    profitDOM.innerHTML = Math.floor(priceInput.value-inputValue * 0.1);
    console.log(inputValue * 0.1)

    
  })

  

  //priceInput.addEventListener("input", () => {
    //const priceInput = document.getElementById("add-tax-price");
    
    //console.log("イベント発火")
  //})

  //priceInput.addEventListener("input", () => {
    //const priceInput = document.getElementById("profit");
    
    //console.log("イベント発火")
  //})
})

//priceInput.addEventListener('load', function(){
  
  //const priceInput = document.getElementById("add-tax-price");
  
      //console.log("イベント発火")
//});
  //priceInput.addEventListener('', function(){
  //const priceInput = document.getElementById("add-tax-price");
  //priceInput.addEventListener("input", () => {
    
  //})
//const priceInput = document.getElementById("profit");