
(comment

(def mm (parse-matrix-file (io/resource "matrix-3")))
(mat/to-nested-vectors mm)
(mat/dimension-count mm 1)

(defn extend-matrix2 [matrix fill]
  (let [n (mat/dimension-count matrix 1)
        blank-row (repeat (+ n 2) fill)
        xf (map #(concat [fill] % [fill]))]
    (-> (transduce xf conj [blank-row] (mat/rows matrix))
         (conj blank-row)
         to-array-2d)))

(defn extend-matrix3 [matrix fill]
  (let [[m n] (mat/shape matrix)
        f (fn [i j] (if (or (#{0 (inc m)} i) (#{0 (inc n)} j))
                      fill
                      (mat/mget matrix (dec i) (dec j))))]
    (mat/compute-matrix matrix (map #(+ 2 %) [m n]) f)))

(mat/to-nested-vectors  (extend-matrix3 mm 0))

((vec ((vec mm) 0)) 1) 

)
