import java.util.HashMap;

class Main {
    static HashMap<Integer, String> map = new HashMap() {
        {
            put(1, "I");
            put(2, "II");
            put(3, "III");
            put(4, "IV");
            put(5, "V");
            put(6, "VI");
            put(7, "VII");
            put(8, "VIII");
            put(9, "IX");
            put(10, "X");
            put(20, "XX");
            put(30, "XXX");
            put(40, "XL");
            put(50, "L");
            put(60, "LX");
            put(70, "LXX");
            put(80, "LXXX");
            put(90, "XC");
            put(100, "C");
            put(200, "CC");
            put(300, "CCC");
            put(400, "CD");
            put(500, "D");
            put(600, "DC");
            put(700, "DCC");
            put(800, "DCCC");
            put(900, "CM");
            put(1000, "M");
            put(2000, "MM");
            put(3000, "MMM");
        }
    };

    public static void main(String[] args) {
        String s = args[0];

        String ans = "";
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            Integer N = -1;
            try {
                N = Integer.parseInt(String.valueOf(c));
            } catch (Exception e) {
                continue;
            }

            Double d = Math.pow(10, s.length() - 1);
            Integer num = N * d.intValue();

            if (null != map.get(num))
                ans += map.get(num);
        }

        System.out.println(ans);
    }
}
