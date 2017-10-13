import java.util.*;

class Fibonacci {
	public static void main(String[] args)
	{
		new Fibonacci();
	}

	private Fibonacci()
	{
		int ans = byDP(20);
        System.out.println(String.format("byDP: %d", ans));
	}

    // DP (Dynamic Programming: 動的計画法)
	private int byDP(int n)
	{
		int[] fib = new int[n];
        
        for (int i=0; i<n; i++) {
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
        
        return fib[n-1];
	}
}
