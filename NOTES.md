# todo

* Write, of course
* Decide what still needs to be done in terms of code/benchmarks.



* Abstract

* Introduction to CERN
  ALICE
  Run3 & O2 upgrade


* What are AODs, how are they used (talk about Raw data, ESDs, CTFs for comparison, how analysis is done)
  * What are the requirements for a good AOD (features, distributed setting, storage size)
* How does the current implementation deal with this (feature support, efficiency)

* New AODs
  * How was it approached
    * include talk of distributed flow (per process parallel, FairMQ, shmem, analysis trains)
  * What was settled on
  * how does it perform (features, benchmarks) (include talk about the framework, event creation in the interface part
    * vectorization possibilities, threading
  * Note on storage format (compression, cite different compressions here too)

* Acknowlegments
* Glossary (ESDs, AOD, Entity, Task, CTF, ALICE, CERN, O2, etc.)
* References (bibtex)

Include nice Tkiz graphs for all explanations of arrays and such.

=========================
Interleave arrays in chunks of cache/vector size? Allows for vectorization, linear access all that.  but does not allow for zero-copy transfer without the overhead of sending all data.
