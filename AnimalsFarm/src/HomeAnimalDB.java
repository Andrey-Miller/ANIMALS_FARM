import java.util.ArrayList;
import java.util.Collection;

public class HomeAnimalDB implements DataBase<HomeAnimal> {

    private ArrayList<HomeAnimal> petsCollection = new ArrayList<>();
//    private final Pet pet;

//    public PetsBase(Pet pet) {
//        this.pet = pet;
//    }




    @Override
    public void add(HomeAnimal item) {
        petsCollection.add(item);
    }

    @Override
    public Collection<HomeAnimal> getAll() {
//        for (Pet pet: petsCollection) {
//            System.out.println();
//        }
        return petsCollection;
    }

}
