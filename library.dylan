Module: dylan-user

define library fff
  use common-dylan;
  use io;
  use c-ffi;
  use testworks;
  export fff;
end library fff;

define module fff
  use common-dylan;
  use format-out;
  use testworks;
  use c-ffi;
  export fff-test-suite;
  export bogus;
  export max-3*, max-3, max-3-setter;
  export max-6, max-6*;
  export max-7, max-7*, max-7-setter;
  export max-2, max-2-setter, max-2*;
  export max-1, max-1-setter, max-1*;
  export slot-1, slot-1-setter;
  export slot-2, slot-2-setter;
end module fff;
