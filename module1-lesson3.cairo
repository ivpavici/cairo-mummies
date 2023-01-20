// Implementing Recursive Logic
// It is time for you to build the recursive function to check whether or not all the sides of a pyramid have slopes 51 or 52 degrees. 
// Complete the exercise so the assertions all pass.

%builtins output
from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}() {

    tempvar quad_pyramid_slope_angles : felt* = new (51,52,51,52);
    assert quad_pyramid_slope_angles[0] = 51;
    assert quad_pyramid_slope_angles[1] = 52;
    assert quad_pyramid_slope_angles[2] = 51;
    assert quad_pyramid_slope_angles[3] = 52;
    let (is_quad_valid : felt) = verify_slopes(quad_pyramid_slope_angles, 4);
    assert is_quad_valid = 1;

    tempvar tri_pyramid_slope_angles : felt* = new (51,52,48);
    assert tri_pyramid_slope_angles[0] = 51;
    assert tri_pyramid_slope_angles[1] = 52;
    assert tri_pyramid_slope_angles[2] = 48;
    let (is_tri_valid : felt) = verify_slopes(tri_pyramid_slope_angles, 3);
    assert is_tri_valid = 0;

    serialize_word(is_tri_valid);
    return ();
}
// do not modify code on this line or above

// Modify this function based on the prompt
func verify_slopes{output_ptr : felt*}(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt) {

    if (slopes_len == 0) {
        return (is_valid=1);
    }
    
    // OR logic simulation in Cairo
    if (((51 - slopes_arr[0]) * (52 - slopes_arr[0])) != 0) {
        %{ print("Test!") %}
        return (is_valid=0);
    }
         
    let (res : felt) = verify_slopes(slopes_arr+1, slopes_len-1);
    
    return (is_valid=res);
}
