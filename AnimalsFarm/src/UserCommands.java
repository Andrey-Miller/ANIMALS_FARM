import java.time.LocalDate;
import java.util.Scanner;

public class UserCommands implements Controller {


    private Animal animal;
    private Counter counter;
    private HomeAnimalDB petsBase = new HomeAnimalDB();
    private PackAnimalDB packsBase = new PackAnimalDB();


    static final Scanner scanner = new Scanner(System.in);
    @Override
    public void startProgramm() {
        System.out.println("Программа запущена");
        System.out.println("__________________________");
        System.out.println("1. Добавить новое животное");
        System.out.println("2. Обучить команде");
        System.out.println("3. Показать все команды");
        System.out.println("0. Выход");
    }

    @Override
    public void addAnimal() {
        boolean flag = false;
        while(flag == false) {
            System.out.println("Кого добавляем?");
            System.out.println("1. Домашнее животное");
            System.out.println("2. Вьючное животное");
            System.out.println("Выберите действие: ");

            int animalType = scanner.nextInt();
            if (animalType == 1 || animalType == 2) {
//                    flag = true;
                if (animalType == 1) {
                    String animalName = "";
                    System.out.println("Введите вид домашнего животного");
                    System.out.println("собака, кот или хомяк");
                    String petType = readData();

                    if (checkType(readData(), animalType) == false) {
                        flag = false;
                    } else {

                        System.out.println("Введите Имя домашнего животного");
                        String name = readData();
                        animalName = name;
                    }
                    LocalDate birthday = LocalDate.parse(readDate());
                    this.animal = new HomeAnimal(animalName, birthday);
                    petsBase.add((HomeAnimal) animal);
                    flag = true;

                }
                if (animalType == 2) {
                    String animalName = "";
                    System.out.println("Введите вид вьючного животного");
                    System.out.println("верблюд,осел или лошадь");
                    String packType = readData();
                    if (checkType(readData(), animalType) == false) {
                        flag = false;
                    } else {

                        System.out.println("Введите Имя вьючного животного");
                        String packName = readData();
                        animalName = packName;
                    }
                    LocalDate birthday = LocalDate.parse(readDate());
                    this.animal = new PackAnimal(animalName, birthday);
                    packsBase.add((PackAnimal) animal);
                    flag = true;

                }
            } else flag = false;
        }


    }
    public String readDate(){
        System.out.println("Введите дату рождения в формате YYYY-MM-DD");
        String date = scanner.nextLine();
        LocalDate localDate = LocalDate.parse(date);
        return date;
    }
    public String readData(){
        String result = null;
        boolean flag = false;
        while (flag == false && result ==null) {
            String smth = scanner.nextLine();
            if (smth == "") {
                flag = false;
                System.out.println("Данные пустые. Попробуйте снова");
                break;
            } else {
                result = smth;
                flag = true;
            }
        }
        return result;
    }

    @Override
    public boolean checkType(String string, int animalType) {
        String newString = string.toLowerCase();
        boolean flag = false;
        String[] petArray = {"собака", "кот", "хомяк"};
        String[] packArray = {"верблюд","осел","лошадь"};
        if(animalType == 1) {
            for (String s : petArray
            ) {
                if (newString.equals(s)) {
                    System.out.println("Это домашнее животное");
                    flag = true;
                    break;
                }
            }
        }
        if(animalType ==2) {

            for (String s : packArray
            ) {
                if (newString.equals(s)) {
                    System.out.println("Это вьючное животное");
                    flag = true;
                    break;
                }
            }
        }
        if (flag == false) {
            System.out.println("Ошибка ввода, неправильный тип.");
        }
        return flag;
    }


    public void showCommands() {
        System.out.println("Животное обучено командам: ");
        animal.getCommands();

    }


    public void addCommand() {
        String comandName = null;
        boolean flag = false;
        while (flag == false && comandName == null) {
            System.out.println("Введите название команды");
            String someCommand = scanner.nextLine();
            if (someCommand == ""||someCommand == null){
                flag = false;

            }else {
                comandName = someCommand;
                AnimalCommands comand = new AnimalCommands(comandName);
                animal.addCommand(comand);
                flag = true;
            }
        }
    }
}
