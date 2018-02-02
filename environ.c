extern char** environ;
main()
{
	char** env=environ;
	while(*env){
		printf("%s\n",*env++);
	}
	return;
}
