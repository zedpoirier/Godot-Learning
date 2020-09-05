extends Control

var largestPrime = 1
var target = 600851475143
var test = 13195

var allFactors = []
var allPrimeFactors = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print("\nProblem 3:")
	# find all factors in target
	print ("All factors:")
	for i in range(1, target):
		if target % i == 0:
			allFactors.append(i)
			#print(i)
		printraw("\r" + str(i))
	# find the primes in the list of factors
	print("\nAll Primes:")
	for f in allFactors:
		if isPrime(f):
			allPrimeFactors.append(f)
			print(f)
	# return largest of those primes
	print("Largest Prime:")
	print(allPrimeFactors[-1])

func isPrime(num):
	for i in range(2, num):
		if num % i == 0:
			return false
	return true
