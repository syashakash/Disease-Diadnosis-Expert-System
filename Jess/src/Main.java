
import java.io.IOException;
import java.util.ArrayList;
import jess.*;



/**
 * This project is submitted by Group-6
 * 
 */

/**
 * 
 * Main class provides two useful functions to manipulate the jess engine.
 * It also provides rules derived from knowledge base
 * and act as the starting point of this project.
 */
public class Main {
    
    Rete engine;
    ArrayList<Rule> rules;
    
    Main() throws JessException, IOException{
        rules = new Generate_Rules("./src/deficiency.txt").rules;
        engine = new Rete();
        engine.batch("./src/data.clp");
        engine.reset();
    }
    
    /**
     * 
     * @param bodyPart
     * @param property
     * @param value
     * @throws JessException 
     * 
     * This function add facts and then run the jess engine.
     */
    public void assertFact(String bodyPart, String property, String value) throws JessException{
        
        String fact = "(symptom (bp "+bodyPart+") (pr "+property+") (va "+value+"))";
        engine.assertString(fact);
        engine.run();
        engine.eval("(bind ?*diseases* ?*temp*)");
        engine.eval("(bind ?*temp* (create$))");
        
    }
    
    /**
     * 
     * @return
     * @throws JessException 
     * 
     * This function returns the list of possible diseases.
     */
    public String[] getResult() throws JessException{
        String ans = engine.eval("?*diseases*").toString();
        String list[] = {"Unknown_Disease"};
        
        if (!ans.isEmpty())
            list = ans.split(" ");
        System.out.println(ans);
        return list;
    } 
    
    
    public static void main(String []args) throws JessException, IOException{
        /**
         * This code is self generated code which changes the look and feel of Home (JFrame)
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        
        Main session = new Main();
        Home obj = new Home(session);
        obj.setVisible(true);
        
    }
}
