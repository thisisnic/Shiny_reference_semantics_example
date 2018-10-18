# Shiny `reactiveValues` Reference Semantics

In Shiny, `reactiveValues()` can be used to create a list-like 
reactive object.  However, this list has special properties.  

Normally in R, scoping rules mean that when you pass an object into a function
as a parameter, __copy-on-modify__ semantics are used.  In other words, a copy of 
that object is passed into the function, and so this copy is the one which the 
function can alter, and the original object is not modified.

However, in the case of objects created using `reactiveValues()`, this is not
the case.  Objects created using `reactiveValues()` are R6 objects, and these kinds of objects use 
__reference semantics__.  This means that when we pass them into a function as a parameter, 
it is a reference to the original object that is is passed in, and so modifications made within the scope of the function are reflected outside of the function as well as within it.

The app in this repo shows a brief example of this.

See the reactiveValues section [in this blog post by yindeng for more information](https://shinydata.wordpress.com/2015/02/02/a-few-things-i-learned-about-shiny-and-reactive-programming/).