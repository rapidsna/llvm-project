// RUN: %clang_cc1 -fexperimental-late-parse-attributes -fsyntax-only -Wpointer-arith -verify %s

#define __counted_by(f)  __attribute__((counted_by(f)))


#define __counted_by(f)  __attribute__((counted_by(f)))

// ============================================================================
// SIMPLE POINTER: int *buf
// ============================================================================

// Position: after *, before identifier
// Applies to `int *`.
// Put in DeclChunk.
struct ptr_after_star {
  int *__counted_by(count) buf;
  int count;
};

// Position: before type specifier
// Applies to the top-level type.
// Belongs to DeclSpec.
struct ptr_before_type {
  __counted_by(count) int *buf;
  int count;
};

// Position: after type, before *
// Applies to `int`. Error.
// Belongs to DeclSpec.
struct ptr_after_type {
  int __counted_by(count) *buf;
  int count;
};

// Position: after identifier
// Applies to the top-level type.
// Pass around via LateAttrs parameter.
struct ptr_after_ident {
  int *buf __counted_by(count);
  int count;
};

// ============================================================================
// TYPEDEF POINTER: ptr_to_int_t buf
// ============================================================================

typedef int * ptr_to_int_t;

// Position: after typedef name, before identifier
// Applies to `ptr_to_int_t`.
// Belongs to DeclSpec.
struct typedef_after_type {
  ptr_to_int_t __counted_by(count) buf;
  int count;
};

// Position: before typedef name
// Applies to the top-level type.
// Belongs to DeclSpec.
struct typedef_before_type {
  __counted_by(count) ptr_to_int_t buf;
  int count;
};

// Position: after identifier
// Applies to the top-level type.
// Pass around via LateAttrs parameter.
struct typedef_after_ident {
  ptr_to_int_t buf __counted_by(count);
  int count;
};

// ============================================================================
// POINTER TO ARRAY: int (*buf)[4]
// ============================================================================

// Position: after type, before (*
// Applies to `int`. Error.
// Belongs to DeclSpec.
struct ptr_to_arr_after_type {
  int __counted_by(count) (* buf)[4];
  int count;
};

// Position: before type
// Applies to the top-level type.
// Belongs to DeclSpec.
struct ptr_to_arr_before_type {
  __counted_by(count) int (* buf)[4];
  int count;
};

// Position: after *, before identifier (inside parens)
// Applies to `int (*)[4]`.
// DeclChunk::Pointer
struct ptr_to_arr_after_star {
  int (* __counted_by(count) buf)[4];
  int count;
};

// Position: after identifier, before ) (inside parens)
// Applies to the top-level type.
// Belongs to Declarator.
struct ptr_to_arr_after_ident {
  int (*buf __counted_by(count))[4];
  int count;
};

// Position: after [4]
// Position: after identifier, before ) (inside parens)
// Applies to the top-level type.
// Pass around via LateAttrs parameter.
struct ptr_to_arr_after_brackets {
  int (* buf)[4] __counted_by(count);
  int count;
};

// Position: after (, before *
// Error position.
// DeclChunk::Paren
struct ptr_to_arr_after_lparen {
  int (__counted_by(count) *buf)[4];
  int count;
};

// Position: inside [4]
// Error position.
// DeclChunk::Array
struct ptr_to_arr_inside_brackets {
  int (* buf)[4 __counted_by(count)];
  int count;
};

// Position: before [4]
// Error position
struct ptr_to_arr_before_brackets {
  int (* buf) __counted_by(count) [4];
  int count;
};

// Position: double parens, after ((, before *
struct ptr_to_arr_double_paren1 {
  int ((__counted_by(count) * buf))[4];
  int count;
};

// Position: double parens, after *, before identifier
struct ptr_to_arr_double_paren2 {
  int ((* __counted_by(count) buf))[4];
  int count;
};

// ============================================================================
// POINTER TO ARRAY WITH QUALIFIERS
// ============================================================================

// const pointer
struct ptr_to_arr_const_ptr1 {
  int (* const __counted_by(count) buf)[4];
  int count;
};

struct ptr_to_arr_const_ptr2 {
  int __counted_by(count) (* const buf)[4];
  int count;
};

// pointer to const
struct ptr_to_arr_ptr_to_const {
  const int (* __counted_by(count) buf)[4];
  int count;
};

struct ptr_to_arr_ptr_to_const2 {
  int const (* __counted_by(count) buf)[4];
  int count;
};

// restrict pointer
struct ptr_to_arr_restrict1 {
  int (* __restrict __counted_by(count) buf)[4];
  int count;
};

struct ptr_to_arr_restrict2 {
  int __counted_by(count) (* __restrict buf)[4];
  int count;
};

// ============================================================================
// POINTER TO MULTI-DIMENSIONAL ARRAY: int (*buf)[4][8]
// ============================================================================

struct ptr_to_multidim_arr_after_type {
  int __counted_by(count) (* buf)[4][8];
  int count;
};

struct ptr_to_multidim_arr_after_star {
  int (* __counted_by(count) buf)[4][8];
  int count;
};

struct ptr_to_multidim_arr_middle {
  int (* buf)[4] __counted_by(count) [8];
  int count;
};

struct ptr_to_multidim_arr_after_all {
  int (* buf)[4][8] __counted_by(count);
  int count;
};

// ============================================================================
// ARRAY OF POINTERS TO ARRAY: int (*buf[10])[4]
// ============================================================================

struct arr_of_ptr_to_arr_after_type {
  int __counted_by(count) (* buf[10])[4];
  int count;
};

struct arr_of_ptr_to_arr_after_star {
  int (* __counted_by(count) buf[10])[4];
  int count;
};

struct arr_of_ptr_to_arr_middle {
  int (* buf[10]) __counted_by(count) [4];
  int count;
};

struct arr_of_ptr_to_arr_inside_first_brackets {
  int (* buf __counted_by(count) [10])[4];
  int count;
};

// ============================================================================
// TYPEDEF ARRAY: arr4_t *buf where arr4_t is int[4]
// ============================================================================

typedef int arr4_t[4];

struct typedef_arr_before_type {
  __counted_by(count) arr4_t * buf;
  int count;
};

struct typedef_arr_after_type {
  arr4_t __counted_by(count) * buf;
  int count;
};

struct typedef_arr_after_star {
  arr4_t * __counted_by(count) buf;
  int count;
};

// ============================================================================
// FUNCTION POINTER: int (*buf)(void)
// ============================================================================

// Position: after *, before identifier
struct fptr_after_star {
  int (* __counted_by(count) buf)(void);
  int count;
};

// Position: after (, before *
struct fptr_after_lparen {
  int (__counted_by(count) *buf)(void);
  int count;
};

// ============================================================================
// _ATOMIC POINTER VARIATIONS
// ============================================================================

// _Atomic(int *) - atomic pointer type
struct atomic_ptr_type {
  _Atomic(int *) __counted_by(count) buf;
  int count;
};

// Attribute inside _Atomic (likely invalid)
struct atomic_ptr_attr_inside {
  _Atomic(int *__counted_by(count)) buf;
  int count;
};

// _Atomic int * - could be atomic int or atomic pointer
struct atomic_ambiguous {
  _Atomic int * __counted_by(count) buf;
  int count;
};

// ============================================================================
// _ATOMIC POINTER TO ARRAY
// ============================================================================

struct atomic_ptr_to_arr1 {
  _Atomic int (* __counted_by(count) buf)[4];
  int count;
};

struct atomic_ptr_to_arr2 {
  int _Atomic (* __counted_by(count) buf)[4];
  int count;
};

struct atomic_ptr_to_arr3 {
  int (* _Atomic __counted_by(count) buf)[4];
  int count;
};
