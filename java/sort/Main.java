import java.util.*;
class Main {
    static List <Integer> list = new ArrayList <Integer>();
    
    public static void main(String[] args) {
        new Main();
    }
    
    public Main() {
        list.add(32);
        list.add(13);
        list.add(22);
        list.add(234);
        
        sortToDesc();

        System.out.println(list);
    }
    
    public void sortToDesc() {
        Collections.sort(list, new Comparator <Integer>() {
            @Override
            public int compare(Integer a, Integer b) {
                // 引数1と引数2はそれぞれリスト中の値

                // compareTo()メソッドにより引数の大小比較を行う。
                // ・引数２の方が大きければ、戻り値は正の整数: 引数２→引数１の順に並ぶ。
                // ・引数同士が一致すれば、戻り値は０: 引数１と引数２は同列。
                // ・引数１の方が大きければ、戻り値は負の整数: 引数１→引数２の順に並ぶ。
                return b.compareTo(a);
            }
        });
    }
}