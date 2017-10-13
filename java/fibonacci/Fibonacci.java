import java.util.*;

class Fibonacci {
	public static void main(String[] args)
	{
		new Fibonacci();
	}

	private Fibonacci()
	{
		int ans = byDP(3);
        System.out.println(String.format("byDP: %d", ans));
        
        ans = byRC(3);
        System.out.println(String.format("byRC: %d", ans));
	}

    // DP (Dynamic Programming: 動的計画法)
	private int byDP(int n)
	{
		int[] fib = new int[n+1];
        
        for (int i=0; i<=n; i++) {
            switch(i)
            {
            case 0:
                fib[0] = 0;
                break;
            case 1:
                fib[1] = 1;
                break;
            default:
                fib[i] = fib[i - 2] + fib[i - 1];
                break;
            }
        }
        
        System.out.println(Arrays.toString(fib));
        
        return fib[n];
	}
    
    // RC (Recursive Call: 再帰呼び出し)
    private int byRC(int n)
    {
        switch(n) {
            case 0:
                return 0;
            case 1:
                return 1;
            default:
                return byRC(n-1) + byRC(n-2);
        }
    }
}
