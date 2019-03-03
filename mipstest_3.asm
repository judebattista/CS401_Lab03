addi $4, $0, 1				# mov 1 into $4
addi $5, $0, 1				# mov 1 into $5
bne $4, $5, end				# should do nothing since $4 and $5 are equal
addi $5, $5, '1'			# add one to $5, making it not equal to $4
bne $4, $5, testXori		# should branch to the testXori section, skippingthe jump to end
j end						# skip the testXori section
testXori:
addi $4, $0, 3				# Set $4 to three			
xori $5, $4, 6				# Do an xor with $4 = 3 and 6, should be 5 (...0011 XOR ...0110 = 0101 = 5)
end:
