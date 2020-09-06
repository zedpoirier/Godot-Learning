extends Control

var largestPrime = 1
var target = 600851475143

var allPrimeFactors = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print("\nProblem 3:")
	allPrimeFactors = prime_factors((target))
	print("All Prime Factors: " + str(allPrimeFactors))
	print("Largest Prime: ... " + str(allPrimeFactors[-1]))

func prime_factors(n):
	#"""Returns all the prime factors of a positive integer"""
	var factors = []
	var d = 2
	while n > 1:
		while n % d == 0:
			factors.append(d)
			n /= d
		d = d + 1
		if d*d > n:
			if n > 1: factors.append(n)
			break
	return factors

