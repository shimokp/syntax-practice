import java.util.*;

class Main {
    public static void main(String[] args) {
        int max = Integer.parseInt(args[0]);
        Random rand = new Random();

        String source = "";
        String target = "秩序秩秩序秩序";

        for (int i = 0; i < max; i++) {
            int x = rand.nextInt();
            if (x % 2 == 0) {
                source += "秩";
                System.out.println("秩");
            } else {
                source += "序";
                System.out.println("序");
            }
            if (source.contains(target)) {
                System.out.println("ピューッ♪ピューッ♪");
                return;
            }
        }
        System.out.println("団体行動を乱すな！");
    }
}