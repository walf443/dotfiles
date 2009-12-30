#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#ifdef __cplusplus
}
#endif

#define XS_STATE(type, x) \
    INT2PTR(type, SvROK(x) ? SvIV(SvRV(x)) : SvIV(x))

#define XS_STRUCT2OBJ(sv, class, obj) \
    if (obj == NULL) { \
        sv_setsv(sv, &PL_sv_undef); \
    } else { \
        sv_setref_pv(sv, class, (void *) obj); \
    }

MODULE = [% module %]  PACKAGE = [% module %]

YourType*
[% module %]::new()
CODE:
    YourType* self = your_type_new();
    RETVAL = self;
OUTPUT:
    RETVAL

void
DESTROY(YourType* self)
CODE:
    your_type_free(self);
