import geomerative.*;


public interface Shape {
  void computeShape(int _size, int  _step, float _angle);
  void drawShape(PVector _relativeCoord, boolean _isContour);
}
////////////////////////// CIRCLE SHAPE

public class Circle implements Shape {
  ArrayList<PVector> abPoints;
  private RShape myCircle;
  private RPoint[] circPnts;
  float strokeW = 1;

  public void computeShape(int _size, int  _step, float _angle) {
    RG.setPolygonizer(RG.UNIFORMSTEP);
    RG.setPolygonizerStep(_step);
    myCircle=RG.getEllipse(0, 0, _size); // note creation is done directly with RG
    circPnts = myCircle.getPoints();
  }

  public void drawShape(PVector _relativeCoord, boolean _isContour ) {
    if (_isContour ) {
      pushMatrix();
      translate(_relativeCoord.x, _relativeCoord.y);
      beginShape();
      for (int i=0; i<circPnts.length; i++) {
        noFill();
        stroke(255, 0, 255);
        strokeWeight(strokeW);
        vertex(circPnts[i].x, circPnts[i].y);
      }
      endShape(CLOSE);
      popMatrix();
    } else {
      pushMatrix();
      translate(_relativeCoord.x, _relativeCoord.y);

      for (int i=0; i<circPnts.length; i++) {
        noStroke();
        fill(255, 0, 255);
        ellipse(circPnts[i].x, circPnts[i].y, 3, 3);
      }
      popMatrix();
    }
  }
}

////////////////////////// POLYGON SHAPE
public class Polygon implements Shape {
  ArrayList<PVector> abPoints;
  RPolygon polyCircle;
  RPoint[] polyPnts;
  float strokeW = 1;
  float theta;

  public void computeShape(int _size, int  _step, float _angle) {
    polyCircle = RPolygon.createCircle(0, 0, _size, _step);
    polyPnts = polyCircle.getPoints();
    this.theta = _angle;
    abPoints = new ArrayList<PVector>();
  }

  public void drawShape(PVector _relativeCoord, boolean _isContour ) {

    if (_isContour ) {
      pushMatrix();
      translate(_relativeCoord.x, _relativeCoord.y);
      rotate(theta);
      beginShape();

      for (int i=0; i<polyPnts.length; i++) {
        noFill();
        stroke(0, 255, 255);
        strokeWeight(strokeW);
        vertex(polyPnts[i].x, polyPnts[i].y);
      }
      endShape(CLOSE);
      popMatrix();
    } else {
      pushMatrix();
      translate(_relativeCoord.x, _relativeCoord.y);
      rotate(theta);

      for (int i=0; i<polyPnts.length; i++) {
        noStroke();
        fill(0, 0, 255);
        ellipse(polyPnts[i].x, polyPnts[i].y, 7, 7);
      }
      popMatrix();
    }
  }
}  

////////////////////////// LINE SHAPE
public class Line implements Shape {
  ArrayList<PVector> abPoints;
  RShape myLine;
  RPoint[] lpnts;
  float strokeW = 3;
  float theta;

  public void computeShape(int _size, int  _step, float _angle) {
    RG.setPolygonizer(RG.UNIFORMSTEP);
    RG.setPolygonizerStep(_step);
    myLine=RShape.createLine(-_size/3, 0, _size/3, 0);
    lpnts = myLine.getPoints();
    this.theta = _angle;
  }

  public void drawShape(PVector _relativeCoord, boolean _isContour ) {
    if (_isContour ) {
      pushMatrix();
      translate(_relativeCoord.x, _relativeCoord.y);
      rotate(theta);
      beginShape();
      noFill();
      stroke(0, 255, 255);
      strokeWeight(strokeW);

      for (int i=0; i<lpnts.length; i++) {
        vertex(lpnts[i].x, lpnts[i].y);
      }
      endShape();
      popMatrix();
    } else {
      pushMatrix();
      translate(_relativeCoord.x, _relativeCoord.y);
      rotate(theta);
      noStroke();
      fill(0, 255, 255);
      for (int i=0; i<lpnts.length; i++) {
        ellipse(lpnts[i].x, lpnts[i].y, 3, 3);
      }
      popMatrix();
    }
  }
}


//////////////////////////

public class ShapeFactory {
  public Shape createShape(String _shapeType) {
    if (_shapeType == null) {
      return null;
    }
    if (_shapeType.equalsIgnoreCase("CIRCLE")) {
      println("A Circle object has been created");
      return new Circle();
    } else if (_shapeType.equalsIgnoreCase("POLYGON")) {
      println("A Polygon object has been created");
      return new Polygon();
    } else if (_shapeType.equalsIgnoreCase("LINE")) {
      println("A Line object has been created");
      return new Line();
    }
    return null;
  }
}
