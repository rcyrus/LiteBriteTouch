#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_9AE69B7A7FBA4065B3EC1BD1491BD3DC(void *, void *);
void MREP_A44B56EF7ACE440A9E7D82DFAB012811(void *, void *);
void MREP_4D4BF52F5A684C16826E9E27CCD1AC40(void *, void *);
void MREP_83CE52EC834644ABA1D635A5C49884F9(void *, void *);
}
int
main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    const char *progname = argv[0];
    ruby_init();
    ruby_init_loadpath();
    ruby_script(progname);
    int retval = 0;
    try {
        void *self = rb_vm_top_self();
MREP_9AE69B7A7FBA4065B3EC1BD1491BD3DC(self, 0);
MREP_A44B56EF7ACE440A9E7D82DFAB012811(self, 0);
MREP_4D4BF52F5A684C16826E9E27CCD1AC40(self, 0);
MREP_83CE52EC834644ABA1D635A5C49884F9(self, 0);
        retval = UIApplicationMain(argc, argv, nil, @"AppDelegate");
        rb_exit(retval);
    }
    catch (...) {
	rb_rb2oc_exc_handler();
    }
    [pool release];
    return retval;
}
