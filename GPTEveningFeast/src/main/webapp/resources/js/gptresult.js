const ingredientNav = $('#ingred-nav');
const recipeNav = $('#recipe-nav');
const ingredientWrapper = $('.ingredient-wrapper');
const recipeWrapper = $('.recipe-wrapper');
let currentState = "ingred";

function cartGPT() {
	let productList = [];
	
	$("input[name=product]:checked").each(function() {
		productList.push($(this).val());
	});
	
	ajax({
		url: "/evenapp/gpt/cart",
		method: "post",
		data: {
			productList,
		},
		success: function(response) {
			location.href = "/evenapp/cart";
		}
	});
}

function clickIngredient() {
	if(currentState === "ingred") {
		return;
	}
	currentState = "ingred";
	ingredientNav.addClass("active");
	ingredientWrapper.css("display", "block");
	recipeNav.removeClass("active");
	recipeWrapper.css("display", "none");
}

function clickRecipe() {
	if(currentState === "recipe") {
		return;
	}
	currentState = "recipe";
	ingredientNav.removeClass("active");
	ingredientWrapper.css("display", "none");
	recipeNav.addClass("active");
	recipeWrapper.css("display", "block");
}