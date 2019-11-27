options(digits = 3)

p_plane_in_a = 0.2
p_plane_in_b = 0.6
p_plane_in_c = 0.15
p_plane_in_d = 0.05
p_overlook_plane_in_area = 0.1
p_not_find_plane_in_different_area = 1

#On day 1, the team will search area A.
#The probability that the plane is in area A is Pr(plane in A) = 0.6

p_not_in_a = 1 - p_plane_in_a
p_not_in_a
p_in_a_not_found = p_plane_in_a * p_overlook_plane_in_area
p_in_a_not_found
p_not_found_in_a = p_not_in_a + p_in_a_not_found
p_not_found_in_a

#On day 1, the team will search area B.
#The probability that the plane is in area B is Pr(plane in B) = 0.6

p_not_in_b = 1 - p_plane_in_b
p_not_in_b
p_in_b_not_found = p_plane_in_b * p_overlook_plane_in_area
p_in_b_not_found
p_not_found_in_b = p_not_in_b + p_in_b_not_found
p_not_found_in_b

#On day 1, the team will search area C.
#The probability that the plane is in area C is Pr(plane in C) = 0.15

p_not_in_c = 1 - p_plane_in_c
p_not_in_c
p_in_c_not_found = p_plane_in_c * p_overlook_plane_in_area
p_in_c_not_found
p_not_found_in_c = p_not_in_c + p_in_c_not_found
p_not_found_in_c


# Use Bayes' Theorem to calculate the posterior probabilities of finding 
# the plane in each of the 4 grid locations. Recall that area B 
# will be searched on day 1.

# What is the posterior probability that the plane is in area B
# given that it is not found on day 1?

#(Plane in area A∣ Plane not found in area B)

p_in_a_not_found_in_b = p_not_find_plane_in_different_area* p_plane_in_a /p_not_found_in_b
p_in_a_not_found_in_b

#(Plane in area B∣ Plane not found in area B)

p_in_b_not_found_in_b = p_overlook_plane_in_area* p_plane_in_b /p_not_found_in_b
p_in_b_not_found_in_b

#(Plane in area C∣ Plane not found in area B)

p_in_c_not_found_in_b = p_not_find_plane_in_different_area* p_plane_in_c /p_not_found_in_b
p_in_c_not_found_in_b

#(Plane in area D∣ Plane not found in area B)

p_in_d_not_found_in_b = p_not_find_plane_in_different_area* p_plane_in_d /p_not_found_in_b
p_in_d_not_found_in_b

# Which area has the highest posterior probability and should be 
# searched on day 2?
searches = c("p_in_a_not_found_in_b", "p_in_b_not_found_in_b", "p_in_c_not_found_in_b", "p_in_d_not_found_in_b")
probs = c(p_in_a_not_found_in_b, p_in_b_not_found_in_b, p_in_c_not_found_in_b, p_in_d_not_found_in_b)
max_index = which.max(probs)
print(searches[max_index]) 

# Before the search begins, you have been asked to report the 
# probability that you find the plane within two days.
# What is the probability of finding the plane on the first day?

p_find_first_day = 1 - p_not_found_in_b
p_find_first_day

# What is the probability that the plane is not found on
# the first day but is found on the second day?
#(Plane found in A∣ Plane not found in area B)

# use maximum posterior probability from previous question: region A
pr_A_post <- p_plane_in_a * p_not_find_plane_in_different_area / p_not_found_in_b

# probability plane found on day 2
p_found_in_a <- pr_A_post*(1-p_overlook_plane_in_area)
p_found_in_a
# probability plane not found on day 1 but found on day 2
p_not_found_in_b * p_found_in_a

 # What is the probability that the plane is found within 2 days?
p_found_within_two_days = p_find_second_day + p_find_first_day
p_found_within_two_days
