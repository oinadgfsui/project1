# Monte Carlo Estimation of Pi

## Part 1 - Fixed Counts
- In this part, run experiments from `i = 1` to `N_max`.
- For each `i`, we generate `i` random points inside the unit square.
- Count how many points fall inside the quarter circle (x² + y² ≤ 1).
- Estimate of pi is `4 * (inside / i)`.
- Record the error and the time.
- Finally plot:
  - Convergence of estimated pi  
  - Error curve  
  - Error vs Time (log-log)

---

## Part 2 - Confidence Interval Stopping Rule
- Here do not fix the number of points.  
- Instead, stop when the **margin of error** is small enough.  
- Formula for standard error:  
  `se = 4 * sqrt(p_hat * (1 - p_hat) / n)`  
- Margin of error (half-width) = `z * se` with z = 1.96 (95% confidence).  
- We set limits for accuracy:
  - 2 digits → 0.05
  - 3 digits → 0.005
  - 4 digits → 0.0005
- The loop continues until each level is reached.
- Print how many samples and how long it took for 2, 3, and 4 digits.

---

## Part 3 - Dynamic Visualization
- This part shows the process visually.  
- Draw the unit square and the quarter circle.  
- Random points are added one by one:
  - Blue if inside the circle  
  - Red if outside the circle  
- Keep updating the scatter plot with `set()` and `drawnow`.  
- The simulation stops when the confidence interval is small enough for the target digits.  
- At the end, the figure shows:
  - The estimated value of pi (formatted with D digits)  
  - The time used 

---

## Files
- `part1_fixed_counts.m` → Part 1 code
- `part2_confidence_interval.m` → Part 2 code
- `three.m` → Part 3 function (dynamic plot)

---

## How to Run
1. Open MATLAB.
2. Run `part1_fixed_counts.m` → you will get 3 plots.
3. Run `part2_confidence_interval.m` → you will see printed results in Command Window.
4. Call `three(D)` → for example `three(3)` to get visualization until 3 significant digits.

---
