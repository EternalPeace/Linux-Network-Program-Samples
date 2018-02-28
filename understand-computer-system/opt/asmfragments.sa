
	/* $begin combine6spill-sa 0 */
.L152: 
	addl (%eax),%ecx 
	addl 4(%eax),%esi 
	addl 8(%eax),%edi 
	addl 12(%eax),%ebx 
	addl 16(%eax),%ecx 
	addl 20(%eax),%esi 
	addl 24(%eax),%edi 
	addl 28(%eax),%ebx 
	addl $32,%eax 
	addl $8,%edx 
	cmpl -8(%ebp),%edx 
	jl .L152 
	/* $end combine6spill-sa 0 */

	/* $begin cmov-sa 0 */
	movl 8(%ebp),%eax		# Get val as result
	movl %eax,%edx			# Copy to %edx
	negl %edx	 		# Negate %edx
	testl %eax,%eax			# Test val
	# Conditionally move %edx to %eax
	cmovll %edx,%eax		# If < 0, copy %edx to result
	/* $end cmov-sa 0 */


	/* $begin derefbug-sa 0 */
	movl 8(%ebp),%edx	# Get xp
	movl (%edx),%eax	# Get *xp as result
	testl %edx,%edx		# Test xp
	cmovzl %edx,%eax	# If 0, copy 0 to result
	/* $end derefbug-sa 0 */


