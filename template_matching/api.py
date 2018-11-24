import cv2
import numpy as np



class TemplateMatching(object):
    def match_template(self, file_path, template_path):
        """

        :param file_path:       path to the main file (screenshot of a website)
        :param template_path:   path to the template (logo on a website, ..., the element to be found)
        :return:
        """
        # cv2.namedWindow("imageWindow")
        img_rgb = cv2.imread(file_path)
        img_gray = cv2.cvtColor(img_rgb, cv2.COLOR_BGR2GRAY)

        template = cv2.imread(template_path, 0)
        # w, h = template.shape[::-1]

        res = cv2.matchTemplate(img_gray, template, cv2.TM_CCOEFF_NORMED)
        threshold = 0.8

        loc = np.where(res >= threshold)

        if len(loc[0]) > 0:
            return True

        return False
# if __name__ == "__main__":
#     match_template("website.png", "logo.png")
#     match_template("website.png", "bad.png")
