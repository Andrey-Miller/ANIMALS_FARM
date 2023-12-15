public class UserInterface {


    private final UserCommands command;


    public UserInterface(UserCommands command) {
        this.command = command;
    }
    public void start(){
        command.startProgramm();
    }
    public void addNewAnimal(){
        command.addAnimal();
    }
    public void addNewCommand(){
        command.addCommand();
    }
    public void showCommands(){
        command.showCommands();
    }

}


