(component
  (type (;0;) (func (param "x" string)))
  (import "foo" (func (;0;) (type 0)))
  (type (;1;)
    (instance
      (type (;0;) (func (param "x" string)))
      (export (;0;) "foo" (func (type 0)))
    )
  )
  (import "adapter-imports" (instance (;0;) (type 1)))
  (core module (;0;)
    (type (;0;) (func (param i32 i32)))
    (type (;1;) (func))
    (import "$root" "foo" (func (;0;) (type 0)))
    (func (;1;) (type 1)
      unreachable
    )
    (memory (;0;) 1)
    (export "bar" (func 1))
    (export "memory" (memory 0))
  )
  (core module (;1;)
    (type (;0;) (func (param i32 i32)))
    (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
    (import "adapter-imports" "foo" (func $foo (;0;) (type 0)))
    (func (;1;) (type 0) (param i32 i32)
      i32.const 0
      i32.const 0
      call $foo
    )
    (func (;2;) (type 1) (param i32 i32 i32 i32) (result i32)
      unreachable
    )
    (export "adapter-bar" (func 1))
    (export "cabi_export_realloc" (func 2))
  )
  (core module (;2;)
    (type (;0;) (func (param i32 i32)))
    (func $indirect-$root-foo (;0;) (type 0) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 0
      call_indirect (type 0)
    )
    (func $indirect-adapter-imports-foo (;1;) (type 0) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 1
      call_indirect (type 0)
    )
    (table (;0;) 2 2 funcref)
    (export "0" (func $indirect-$root-foo))
    (export "1" (func $indirect-adapter-imports-foo))
    (export "$imports" (table 0))
  )
  (core module (;3;)
    (type (;0;) (func (param i32 i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "1" (func (;1;) (type 0)))
    (import "" "$imports" (table (;0;) 2 2 funcref))
    (elem (;0;) (i32.const 0) func 0 1)
  )
  (core instance (;0;) (instantiate 2))
  (alias core export 0 "0" (core func (;0;)))
  (core instance (;1;)
    (export "foo" (func 0))
  )
  (core instance (;2;) (instantiate 0
      (with "$root" (instance 1))
    )
  )
  (alias core export 2 "memory" (core memory (;0;)))
  (alias core export 0 "1" (core func (;1;)))
  (core instance (;3;)
    (export "foo" (func 1))
  )
  (core instance (;4;) (instantiate 1
      (with "adapter-imports" (instance 3))
    )
  )
  (alias core export 4 "cabi_export_realloc" (core func (;2;)))
  (alias core export 0 "$imports" (core table (;0;)))
  (core func (;3;) (canon lower (func 0) (memory 0) string-encoding=utf8))
  (alias export 0 "foo" (func (;1;)))
  (core func (;4;) (canon lower (func 1) (memory 0) string-encoding=utf8))
  (core instance (;5;)
    (export "$imports" (table 0))
    (export "0" (func 3))
    (export "1" (func 4))
  )
  (core instance (;6;) (instantiate 3
      (with "" (instance 5))
    )
  )
  (type (;2;) (func))
  (alias core export 2 "bar" (core func (;5;)))
  (func (;2;) (type 2) (canon lift (core func 5)))
  (export (;3;) "bar" (func 2))
  (alias core export 4 "adapter-bar" (core func (;6;)))
  (func (;4;) (type 0) (canon lift (core func 6) (memory 0) (realloc 2) string-encoding=utf8))
  (export (;5;) "adapter-bar" (func 4))
)