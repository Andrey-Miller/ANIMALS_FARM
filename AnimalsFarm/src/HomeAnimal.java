import java.time.LocalDate;
import java.util.ArrayList;

public class HomeAnimal extends Animal {

    private ArrayList<AnimalCommands> commands = new ArrayList<>();

//    private String petType;

    public HomeAnimal(String name, LocalDate birth_date) {
        super(name, birth_date);
//        this.petType = petType;
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public LocalDate getBirthDate() {
        return super.getBirthDate();
    }

    @Override
    public void getCommands() {
        if (commands.size()==0){
            System.out.println("Животное не обучено командами");
        }else
            for (AnimalCommands com :commands) {
                System.out.println(com.getCommandName());
            }
    }

    public void addCommand (AnimalCommands commands){
        this.commands.add(commands);
    }


}
