package bang.models;

import java.sql.SQLException;
import java.util.ArrayList;
import bang.TableFactory;

/**
 * Created by seradam on 2017.05.22..
 */
public class Game {

    ArrayList<Role> listOfRoles;
    ArrayList<Character> listofCharacters;
    ArrayList<Card> deck;

    public ArrayList<Card> buildDeck() throws SQLException {
        TableFactory tf = new TableFactory();
        String deckGetterQuery = "SELECT * FROM card";
        ArrayList<ArrayList<String>> cardsNestedList = tf.getData(deckGetterQuery);
        ArrayList<Card> deck = new ArrayList<Card>();
        for (int i = 0; i<cardsNestedList.size(); i++){
            int quantityCounter = Integer.parseInt(cardsNestedList.get(i).get(4));
            while (quantityCounter > 0){
                deck.add(new Card(cardsNestedList.get(i).get(1),
                        cardsNestedList.get(i).get(2), cardsNestedList.get(i).get(3)));
                quantityCounter--;
            }
        }
        return deck;
    }

    public static void main(String[] args) throws SQLException {
        Game g = new Game();
        ArrayList<Card> sg = g.buildDeck();
        for (int i = 0; i<sg.size(); i++){
            System.out.println(sg.get(i).name);
        }
    }
}
