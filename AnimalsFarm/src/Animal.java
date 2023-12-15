import java.time.LocalDate;

public abstract class Animal {

    protected String Name;
    protected LocalDate birthDate;
    protected String animalType;

    public Animal(String name, LocalDate birth_date) {
    }

    public String getName() {
        return Name;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }
    public abstract void getCommands();

    public  abstract void addCommand(AnimalCommands commands);
}