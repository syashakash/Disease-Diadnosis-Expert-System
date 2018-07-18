
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tushar
 */
class Rule{
    String name;
    ArrayList<String[]> tuples = new ArrayList();
    
}

public class Generate_Rules {
    
    public ArrayList<Rule> rules = new ArrayList();
    
    private void readFile(String filename) throws FileNotFoundException, IOException{
        InputStreamReader reader = new InputStreamReader(new FileInputStream(filename));
        BufferedReader in = new BufferedReader(reader);
        
        Rule temp = new Rule();
        boolean flag = true;
        
        for(String line; (line=  in.readLine())!=null ;){         
            line = line.trim();
            if(line.isEmpty()){
                if(temp.name != null)
                    rules.add(temp);
                temp = new Rule();
                flag = true;
            }
            else if(flag){
                temp.name = line;
                flag = false;
            }
            else{
                String arr[] = line.split("->");
                for(int i=0;i<3;i++)
                    arr[i] = arr[i].toLowerCase();
                temp.tuples.add(arr);
            }
        }
        if(temp.name != null)
            rules.add(temp);
        
    }
    
    private void writeHeader(BufferedWriter out) throws IOException{
        String str = "(defglobal ?*diseases* = (create$ ";
        for(Rule r: rules){
            str += r.name+' ';
        }
        str += "))\n";
        str += "(defglobal ?*temp* = (create$))\n" +
                        "(deftemplate symptom (slot bp) (slot pr) (slot va))\n" +
                        "\n\n";
        out.write(str);
    }
    
    public Generate_Rules(String filename) throws FileNotFoundException, IOException {
        readFile(filename);
        BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("./src/data.clp")));
        writeHeader(out);
        
        for(Rule r: rules){
            StringBuilder str = new StringBuilder("(defrule "+r.name+'\n'+
                    "   (or \n");
            for(String []tup: r.tuples){
                str.append("        (symptom (bp ")
                        .append(tup[0])
                        .append(") (pr ")
                        .append(tup[1])
                        .append(") (va ")
                        .append(tup[2])
                        .append("))\n");
            }
            
            str.append("    )\n    =>\n" +
                        "    (if (member$ "+r.name+" ?*diseases*)\n" +
                        "        then (if (not (member$ "+r.name+" ?*temp*)) \n" +
                        "            then (bind ?*temp* (create$ ?*temp* "+r.name+"))\n" +
                        "        )\n" +
                        "    )\n)\n");
            
            out.write(str.toString()+'\n');
        }
        out.close();
    }
    
}
