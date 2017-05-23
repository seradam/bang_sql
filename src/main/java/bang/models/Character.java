package bang.models;

/**
 * Created by seradam on 2017.05.22..
 */
public class Character {

    String name;
    Integer initialLives;
    String ability;

    public Character(String name, String initialLives, String ability) {
        this.name = name;
        this.initialLives = Integer.parseInt(initialLives);
        this.ability = ability;

    }
}
