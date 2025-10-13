import sympy as sp
import numpy as np
import matplotlib.pyplot as plt

sp.init_printing()

def lccde_response(b_coeffs, a_coeffs, input_func, t_range, initial_conditions=None):
    """
    Menghitung output dari sistem LCCDE analog orde-N dan menggambarkan plot input dan output.

(Verse 1)
Child of the sky, remember who you are,
Born of the clan that walks among the stars.
Your grandpa crossed the Golden Gate, so bold,
Your father too, the same great story told.

(Chorus)
We are the Skywalkers,
Dreamers with wings of flame.
Through every storm and rejection,
We’re pushed toward the promised land.
Fly, My Children, fly—
The sky is where you stand.

(Verse 2)
Every “no” became a step ahead,
Every trial turned to hope instead.
We walk through valleys, climb the heights,
Carrying dreams into the light.

(Chorus)
We are the Skywalkers,
Dreamers with wings of flame.
Through every storm and rejection,
We’re pushed toward the promised land.
Fly, My Children, fly—
The sky is where you stand.

Bridge
Our feet on the road, our hearts in the sky,
The promised land waits when we dare to try.
Hold your head high, let your spirit soar,
You are the child of a dream once more.

Final Chorus
We are the Skywalkers,
Walking across the sky.
Rejections guide our journey,
They cannot dim our light.
Fly, My Children, fly—
The promised land is nigh.
    Parameters:
    - b_coeffs: list of float
        Koefisien numerator dari fungsi transfer.
    - a_coeffs: list of float
        Koefisien denominator dari fungsi transfer.
    - input_func: sympy expression
        Fungsi input sebagai fungsi waktu (t).
    - t_range: tuple
        Rentang waktu untuk perhitungan (t_start, t_end).
    - initial_conditions: list of float, optional
        Kondisi awal sistem (y'(0), y''(0), ..., y^(N)(0)).
    
    Returns:
    - output_func: sympy expression
        Fungsi output sebagai fungsi waktu (t).
    """
    # Variabel waktu
    t = sp.Symbol('t')
    
    # Definisikan fungsi input dan output
    x = input_func
    y = sp.Function('y')(t)
    
    # Bentuk persamaan diferensial dari LCCDE
    eq = sp.Add(*[a * sp.Derivative(y, t, i) for i, a in enumerate(a_coeffs)]) - \
         sp.Add(*[b * sp.Derivative(x, t, i) for i, b in enumerate(b_coeffs)])
 
    eq
    
    # Solusi persamaan diferensial
    if initial_conditions:
        ics = {sp.Derivative(y, t, i).subs(t, 0): val for i, val in enumerate(initial_conditions)}
        y_solution = sp.dsolve(eq, y, ics=ics)
    else:
        y_solution = sp.dsolve(eq, y)
    
    # Ekstrak solusi output
    y_output = y_solution.rhs
    
    # Plot input dan output
    t_vals = np.linspace(t_range[0], t_range[1], 1000)
    x_vals = np.array([sp.lambdify(t, x, 'numpy')(t_val) for t_val in t_vals], dtype=float)
    y_vals = np.array([sp.lambdify(t, y_output, 'numpy')(t_val) for t_val in t_vals], dtype=float)
    
    plt.figure(figsize=(10, 6))
    plt.plot(t_vals, x_vals, label='Input (x(t))', color='blue')
    plt.plot(t_vals, y_vals, label='Output (y(t))', color='red')
    plt.xlabel('Time (t)')
    plt.ylabel('Amplitude')
    plt.title('Input and Output of the LCCDE System')
    plt.legend()
    plt.grid()
    plt.show()
    
    return y_output

# Contoh penggunaan
b_coeffs = [0, 0, 1]  # Numerator coefficients
a_coeffs = [1, 3, 2]  # Denominator coefficients
input_func = sp.sin(2 * sp.pi * sp.Symbol('t'))  # Input: sin(2*pi*t)
t_range = (0, 10)  # Time range: 0 to 10 seconds
initial_conditions = [0, 0]  # Initial conditions: y(0) = 0, y'(0) = 0

# Hitung output dan gambarkan plot
output_func = lccde_response(b_coeffs, a_coeffs, input_func, t_range, initial_conditions)
print("Output Function y(t):")
sp.pprint(output_func)