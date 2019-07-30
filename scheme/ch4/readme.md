**The Metacircular Evaluator**

Our evaluator for Lisp will be implemented as a Lisp program.It may seem circular to think 
about evaluating Lisp programs using an evaluator that is iteself implemented in Lisp.
However, evaluation is a process, so it is appropriate to describe the evaluation process
using Lisp, which after all, is our tool for describing processes.An evaluator that
is written in same language that it evaluates is said to be metacircular.

1. To evaluate a combination, evaluate the subexpressions and then apply the value of the
operator subexpression to the values of the operand subexpression.
2. To apply a compound procedure to a set of arguments, evaluate the body of the procedure
in a new environment. To construct this environment, extend the environment part of the procedure
object by a frame in which the formal parameters of the procedure are bound to the arguments
to which the procedure is applied.

The evaluation process will be embodied within apply, and eval.

Some examples;
  * make-procedure constructs compound procedure
  * lookup-variable-value accesses the values of variables.
  * apply-primitive-procedure applies a primitive procedure to a given list of arguments.
  
  
