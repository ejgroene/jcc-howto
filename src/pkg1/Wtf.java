package pkg1;

import java.io.IOException;
import org.apache.lucene.search.SimpleCollector;
import org.apache.lucene.search.ScoreMode;

public class Wtf extends SimpleCollector {

    @Override
    public void collect(int doc) throws IOException {
    }

    @Override
    public ScoreMode scoreMode() {
        return ScoreMode.COMPLETE;
    }
}
