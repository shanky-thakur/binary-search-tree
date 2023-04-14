import java.util.Scanner;

public class Main{

    static class bst{

        static Node root = null;

        static class Node{
            int data;
            Node left;
            Node right;

            public Node(int data) {
                this.data = data;
            }
        }

        public Node buildTree(){

            Scanner sc = new Scanner(System.in);
            System.out.println("type data");
            int data = sc.nextInt();
            Node newNode = new Node(data);

            if(data == -1){
                return null;
            }

            if(root == null){
                root = newNode;
            }

            System.out.println("type data for left of " + newNode.data);
            newNode.left = buildTree();
            System.out.println("type data for right of " + newNode.data);
            newNode.right = buildTree();

            return newNode;
        }

        static boolean stat = true;

        public void checkBST(Node newNode){
            if(newNode == null){
                return;
            }else {
                if ((newNode.left != null) && (newNode.right != null)) {
                    if ((newNode.left.data < newNode.data) && (newNode.data < newNode.right.data)) {
                        checkBST(newNode.left);
                        checkBST(newNode.right);
                    }
                } else {
                    stat = false;
                }
            }
        }

        public void checkBSTImplement(){
            checkBST(root);
            if(stat){
                System.out.println("tree is a binary search tree");
            }else{
                System.out.println("tree is not a binary search tree");
            }
        }

        public void find(int number,Node newNode){
            if((number > newNode.data)&&(newNode.right != null)){
                find(number,newNode.right);
            }else if((number < newNode.data)&&(newNode.left != null)){
                find(number,newNode.left);
            }else if(number == newNode.data){
                System.out.println("yes");
            }else{
                System.out.println("no");
            }
        }

        public void findNumber(int value){
            find(value,root);
        }

        public void findMin(Node newNode){
            while(newNode.left != null){
                newNode = newNode.left;
            }
            System.out.println(newNode.data);
        }
        public void min(){
            findMin(root);
        }

        public void findMax(Node newNode){
            while(newNode.right != null){
                newNode = newNode.right;
            }
            System.out.println(newNode.data);
        }

        public void max(){
            findMax(root);
        }

        public void addNode(int value,Node newNode){
            if(newNode.data == value){
                System.out.println("Node exists");
            }
            if((value > newNode.data)&&(newNode.right != null)){
                addNode(value , newNode.right);
            }else if((newNode.right == null)&&(newNode.data < value)){
                Node a = new Node(value);
                newNode.right = a;
            }
            if((value < newNode.data)&&(newNode.left != null)){
                addNode(value , newNode.left);
            }

        }

        public void add(int entry){
            addNode(entry,root);
        }
    }

    public static void main(String[] args) {
        bst b = new bst();
        b.buildTree();

//        b.checkBSTImplement();
//        b.findNumber(14);
//        b.findNumber(11);
//        b.max();
//        b.min();
//        b.add(23);
//        b.add(23);
        
    }
}
