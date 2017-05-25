package bang.models;

import java.util.ArrayList;
import java.util.Random;

/**
 * Created by seradam on 2017.05.22..
 */
public class Player {
    String name;
    Integer position;
    Role role;
    Character character;
    Integer health;
    ArrayList<Card> hand;
    ArrayList<Card> board;

    public Player(String name, Integer position){

    }



    public static void main(String[] args) {
        Random random = new Random();
        int a = random.nextInt(50);
        int b = random.nextInt(50);
        System.out.println(a);
        System.out.println(b);
    }
}
