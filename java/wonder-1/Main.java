import java.util.*;

class Main {
    public static void main(String[] args) {
        for (int i = 0; i < args.length; i++) {
            calc(args[i]);
        }
    }

    public static void calc(String num) {
        Integer i;

        for (int j = 0; j < num.length(); j++) {
            if (String.valueOf(num.charAt(j)).getBytes().length >= 2) {
                System.out.println("invalid");
                return;
            }
        }

        if (num.contains(".")) {
            System.out.println("invalid");
            return;
        }

        try {
            i = Integer.parseInt(num);
        } catch (Exception e) {
            System.out.println("invalid");
            return;
        }

        if (i % 3 == 0 && num.contains("3")) {
            System.out.println("dumb");
            return;
        }
        if (i % 3 == 0) {
            System.out.println("idiot");
            return;
        }
        if (num.contains("3")) {
            System.out.println("stupid");
            return;
        }
        System.out.println("smart");
    }
}