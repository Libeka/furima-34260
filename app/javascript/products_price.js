window.addEventListener('load', () =>{

  const priceInput = document.getElementById("item-price");
  
  const addTaxDom = document.getElementById("add-tax-price");
  
  const profitDOM = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  profitDOM.innerHTML = Math.floor(priceInput.value-inputValue * 0.1);

  
  })
  
  
 
  })
  
 