#Simulating PI Using Monte Carlo Simulation
import math
import random
 
N = 10000 #Number of iterations
 
circle_points = 0
square_points = 0
 

for i in range(N):
 
    # Random point generator via uniform distribution
    # Uniform allows us float numbers for more accurate points
    rand_x = random.uniform(-1, 1)
    rand_y = random.uniform(-1, 1)
 
    # Calculate spot coordinates and label it as distance from circle centre
    distance = math.sqrt(rand_x**2 + rand_y**2)
 
    # Check if the spot is inside the circle
    if distance <= 1:
        circle_points += 1
 
    square_points += 1
 
    # Estimate value of pi 
    pi = 4 * circle_points / square_points
 
print("After " + str(N) + " iterations, the final estimate of pi = ", pi)