# Demo application
This is a demo application that illustrates the usage of do scripts

## Developer experience
As a developer simply run `./do --help` to see what can be done in this project

To add more functionality to our do script use the following template and
simply add the customised lines to the `do` file in the root folder:
```bash
## my-command: Describe what your command does here
function task_my_command {
    ## implement your command here
}
```
Please note that the comment above the function has a very specific structure.
Note that the command name needs to match the bash function below it: my-command -> task_my_command

# Tools
- [Spring Boot](https://docs.spring.io/spring-boot/docs/2.6.3/reference/htmlsingle)
- [Gradle](https://docs.gradle.org)
- [asdf version manager](https://asdf-vm.com/)
- [terraform](https://www.terraform.io/)