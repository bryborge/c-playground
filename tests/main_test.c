#include <CUnit/Basic.h>
#include <CUnit/CUnit.h>
#include "../include/hello.h"

// Test function
void test_hello_world(void) {
    CU_ASSERT_EQUAL(get_hello_result(), 0);
}

// Test suite setup and teardown
int init_suite(void) {
    return 0;
}

int clean_suite(void) {
    return 0;
}

// Main test function
int main(void) {
    if (CUE_SUCCESS != CU_initialize_registry()) {
        return CU_get_error();
    }

    CU_pSuite suite = CU_add_suite("Hello_World_Test_Suite", init_suite, clean_suite);
    if (NULL == suite) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if (NULL == CU_add_test(suite, "test_hello_world", test_hello_world)) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();
    int failures = CU_get_number_of_failures();
    CU_cleanup_registry();

    return failures;
}
