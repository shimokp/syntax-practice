class Factorial {
    public static void main(String[] args) {
        new Factorial();
    }
    
    private Factorial() {
        int ans;
        ans = byRecursion(0);
        System.out.println(String.format("by recursion: %d", ans));
        
        ans = byFor(0);
        System.out.println(String.format("by for: %d", ans));
    }
    
    private int byRecursion(int num) {
        if (num < 1) {
            return 1;
        }
        return num * byRecursion(num-1);
    }
    
    private int byFor(int num) {
        int ans=1;
        for (; num>1; num--) {
            ans *= num;
        }
        return ans;
    }
}